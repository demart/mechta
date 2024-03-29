//
//  ProductsTableViewController.m
//  MechtaApp
//
//  Created by Artem Demidovich on 2/5/16.
//  Copyright © 2016 Aphion Software. All rights reserved.
//

#import "ProductsTableViewController.h"
#import "CityService.h"
#import "ProductService.h"
#import "ProductTableViewCell.h"
#import "LoadMoreTableViewCell.h"
#import "DejalActivityView.h"
#import "LocalStorageService.h"
#import "ProductDetailTableViewController.h"
#import "FilterTableViewController.h"
#import "Constants.h"

#import "UIBarButtonItem+Badge.h"

@interface ProductsTableViewController ()

@property long categoryId;
@property NSMutableArray *products;
@property int page;
@property BOOL hasMoreRecords;
@property BOOL firstTimeLoading;

@property NSMutableDictionary *loadImageOperations;
@property NSOperationQueue *loadImageOperationQueue;

@property FiltersModel *filters;
@property FiltersModel *appliedFilters;

@end

@implementation ProductsTableViewController

static long PAGE_LIMIT = 10;

- (void)viewDidLoad {
    [super viewDidLoad];

    self.firstTimeLoading = YES;
    self.products = [[NSMutableArray alloc] init];
    self.appliedFilters = [[FiltersModel alloc] init];
    
    self.loadImageOperationQueue = [[NSOperationQueue alloc] init];
    [self.loadImageOperationQueue setMaxConcurrentOperationCount:5];
    
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];

    [DejalBezelActivityView activityViewForView:self.view withLabel:@"Подождите\nИдет загрузка..."];
    [self loadProducts];
    [self.searchController.searchBar sizeToFit];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void) viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    [_loadImageOperationQueue cancelAllOperations];
    [_loadImageOperations removeAllObjects];
}

#pragma mark - Data loading

- (void) setProductsCategory:(long)categoryId {
    self.categoryId = categoryId;
    self.page +=1;
}

- (IBAction)showFilterAction:(UIBarButtonItem *)sender {
    if (self.filters != nil) {
        [self performSegueWithIdentifier:@"showFiltersSergue" sender:self];
    } else {
        // TODO SHOW MESSAGE EMPTY FILTERS -> IMPOSSIBLE
    }
}

// Устанавливает фильтры и выгружает данные
- (void) applyFiltersWithLoadingProduct {
    [DejalBezelActivityView activityViewForView:self.view withLabel:@"Подождите\nИдет загрузка..."];
    [self.products removeAllObjects];
    self.page = 1;
    [self loadProducts];
}

-(void) loadProducts {
    CityModel *cityModel = [CityService getSelectedCityModel];

    long filtersCount = 0;
    if (self.filters.filters != nil)
        filtersCount = [self.filters.filters count];
    
    [ProductService retrieveProductsWithCategoryId:self.categoryId withPage:self.page withFilter:self.appliedFilters  withFilterCount:filtersCount inCityId:cityModel.id onSuccess:^(ResponseWrapperModel *response) {
     if (response.success) {
         NSMutableArray *products = (NSMutableArray*)response.data;
         if (products == nil || [products count] < 1) {
             self.hasMoreRecords = NO;
         } else {
             [self.products addObjectsFromArray:products];
             if (response.countOfPages > self.page) {
                 self.page = self.page + 1;
                 self.hasMoreRecords = YES;
             } else {
                 self.hasMoreRecords = NO;
             }
         }
         
         if (self.firstTimeLoading == YES) {
             self.filters = response.filters;
             self.appliedFilters.costRight = self.filters.costRight;
             self.appliedFilters.costLeft = self.filters.costLeft;
             self.firstTimeLoading = NO;
             
             // ADD FILTER UITABBARITEM
             UIBarButtonItem *navLeftButton = [[UIBarButtonItem alloc] initWithTitle:@"Фильтр" style:UIBarButtonItemStylePlain target:self action:@selector(showFilterAction:)];
             self.navigationItem.rightBarButtonItem = navLeftButton;
             //self.navigationItem.rightBarButtonItem.badgeBGColor = [UIColor colorWithRed:0.0/255 green:204.0/255 blue:255.0/255 alpha:1.0];
             self.navigationItem.rightBarButtonItem.badgeBGColor = [UIColor colorWithRed:0.0/255 green:204.0/255 blue:51.0/255 alpha:1.0];
             self.navigationItem.rightBarButtonItem.badgePadding = 3;
             self.navigationItem.rightBarButtonItem.badgeMinSize = 5;
             self.navigationItem.rightBarButtonItem.badgeTextColor = [UIColor whiteColor];
             self.navigationItem.rightBarButtonItem.badgeFont = [UIFont systemFontOfSize:13];
         }
         
         [self.tableView reloadData];
     }
     
     [DejalBezelActivityView removeViewAnimated:YES];
        
    } onFailure:^(NSError *error) {
        [DejalBezelActivityView removeViewAnimated:NO];
        UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Ошибка"
                                                                       message:@"Не удалось загрузить список товаров."
                                                                preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                              handler:^(UIAlertAction * action) {}];
        [alert addAction:defaultAction];
        [self presentViewController:alert animated:YES completion:nil];

    }];
}

- (void) showActiveFilterBadgeIcon {
    self.navigationItem.rightBarButtonItem.badgeValue = @"✓";
    self.navigationItem.rightBarButtonItem.badgeBGColor = [UIColor colorWithRed:0.0/255 green:204.0/255 blue:255.0/255 alpha:1.0];
//    self.navigationItem.rightBarButtonItem.badgeBGColor = [UIColor colorWithRed:0.0/255 green:204.0/255 blue:51.0/255 alpha:1.0];
    self.navigationItem.rightBarButtonItem.badgePadding = 3;
    self.navigationItem.rightBarButtonItem.badgeMinSize = 5;
    self.navigationItem.rightBarButtonItem.badgeTextColor = [UIColor whiteColor];
    self.navigationItem.rightBarButtonItem.badgeFont = [UIFont systemFontOfSize:13];
}

- (void) showNoActiveFilterBadgeIcon {
    self.navigationItem.rightBarButtonItem.badgeValue = nil;
}

- (void) loadProductImageInCell:(ProductTableViewCell*) cell onIndexPath:(NSIndexPath*)indexPath withImageUrl:(NSString*)imageUrl {
    UIImage *loadedImage =(UIImage *)[LocalStorageService  loadImageFromLocalCache:imageUrl];
    
    if (loadedImage != nil) {
        cell.productImageView.image = loadedImage;
    } else {
        NSBlockOperation *loadImageOperation = [[NSBlockOperation alloc] init];
        __weak NSBlockOperation *weakOperation = loadImageOperation;
        
        [loadImageOperation addExecutionBlock:^(void){
            UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:
                                                                                   imageUrl
                                                                                   ]]];
            [[NSOperationQueue mainQueue] addOperationWithBlock:^(void) {
                if (! weakOperation.isCancelled) {
                    ProductTableViewCell *updateCell = (ProductTableViewCell*)[self.tableView cellForRowAtIndexPath:indexPath];
                    if (updateCell != nil && image != nil) {
                        updateCell.productImageView.image = image;
                    }
                    
                    
                    if (image != nil) {
                        [LocalStorageService  saveImageToLocalCache:imageUrl withData:image];
                    } else {
                        cell.productImageView.image = [UIImage imageNamed:@"no_photo_icon"];
                    }
                    [self.loadImageOperations removeObjectForKey:indexPath];
                }
            }];
        }];
        
        [_loadImageOperations setObject: loadImageOperation forKey:indexPath];
        if (loadImageOperation) {
            [_loadImageOperationQueue addOperation:loadImageOperation];
        }
    }
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (self.products != nil) {
        if (self.hasMoreRecords) {
            return [self.products count] + 1;
        } else {
            return [self.products count];
        }
    }
    return 0;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row > [self.products count] - 1) {
        // Extra
        LoadMoreTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LoadMoreCell"];
        if (!cell) {
            [tableView registerNib:[UINib nibWithNibName:@"LoadMoreTableViewCell" bundle:nil]forCellReuseIdentifier:@"LoadMoreCell"];
            cell = [tableView dequeueReusableCellWithIdentifier:@"LoadMoreCell"];
        }
        [cell.loadingActivityIndicator startAnimating];
        
        [self loadProducts];
        
        return cell;
        
    } else {
        
        ProductTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ProductCell"];
        if (!cell) {
            [tableView registerNib:[UINib nibWithNibName:@"ProductTableViewCell" bundle:nil]forCellReuseIdentifier:@"ProductCell"];
            cell = [tableView dequeueReusableCellWithIdentifier:@"ProductCell"];
        }
    
        ProductModel *model = self.products[indexPath.row];
        [cell.productNameField setText:model.name];
        //[cell setUnavailable];
        
        if (model.productAvailability == nil || [model.productAvailability count] < 1) {
            [cell setUnavailable];
        } else {
            [cell setFormattedPrice:[model formattedCost]];
        }
        
        if (model.content != nil) {
            UIFont *font = [UIFont  systemFontOfSize:12.0];
            NSString* content = [NSString stringWithFormat:@"<html><style>body{font-family: '%@'; font-size:%fpx;}</style><body>%@</body></html>",
                                 [font fontName],
                                 12.0,
                                 model.content];
            
            NSAttributedString * attrStr = [[NSAttributedString alloc] initWithData:[content dataUsingEncoding:NSUnicodeStringEncoding] options:@{ NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType } documentAttributes:nil error:nil];
            
            [cell.productDescriptionField setAttributedText:attrStr];
        } else {
            [cell.productDescriptionField setText:@""];
        }
        
        [self loadProductImageInCell:cell onIndexPath:indexPath withImageUrl:model.imageUrl];
        
        return cell;
    }
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.products != nil && indexPath.row > [self.products count] - 1)
        return 40;
    return 150;
}


- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // TODO PASS PRODUCT ID
    if (self.products != nil && indexPath.row > [self.products count] - 1)
        return;
    
    [self performSegueWithIdentifier:@"showProductDetailSergue" sender:self];
}



#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.destinationViewController isKindOfClass:[ProductDetailTableViewController class]]) {
        ProductDetailTableViewController *viewController = (ProductDetailTableViewController*)segue.destinationViewController;
        NSIndexPath *indexPath = self.tableView.indexPathForSelectedRow;
        ProductModel *model = self.products[indexPath.row];
        [viewController setProductModel:model];
    }
    
    if ([segue.destinationViewController isKindOfClass:[UINavigationController class]]) {
        UINavigationController *navController = (UINavigationController*)segue.destinationViewController;
        FilterTableViewController *viewController = (FilterTableViewController*)[navController topViewController];
        [viewController setFilterParameters:self.filters withAppliedFilters:self.appliedFilters forViewController:self];
    }
    
}


@end
