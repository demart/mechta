    //
//  CatalogTableViewController.m
//  MechtaApp
//
//  Created by Artem Demidovich on 2/5/16.
//  Copyright © 2016 Aphion Software. All rights reserved.
//

#import "CatalogTableViewController.h"
#import "CatalogTableViewCell.h"

#import "CitiesTableViewController.h"

#import "CityService.h"

#import "CatalogService.h"

#import "ProductsTableViewController.h"
#import "DejalActivityView.h"

#import "LocalStorageService.h"

@interface CatalogTableViewController ()

@property long parentCategoryId;
@property NSMutableArray *categories;

@property NSMutableDictionary *loadImageOperations;
@property NSOperationQueue *loadImageOperationQueue;

@end

@implementation CatalogTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.loadImageOperationQueue = [[NSOperationQueue alloc] init];
    [self.loadImageOperationQueue setMaxConcurrentOperationCount:3];
    
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
}

-(void) viewWillAppear:(BOOL)animated {
    
    // Загружаем выбранный город
    CityModel *cityModel = [CityService getSelectedCityModel];
    if (cityModel == nil) {
        [self.cityChoiceButton setTitle:@"Выберите город"];
    } else {
        [self.cityChoiceButton setTitle:cityModel.name];
    }
    
    // Загружаем категории
    [self loadCategories];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void) viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    [_loadImageOperationQueue cancelAllOperations];
    [_loadImageOperations removeAllObjects];
}


#pragma mark - Loading data

-(void) loadCategories {
    NSMutableArray *categories = [CatalogService getCategoriesByParentId:self.parentCategoryId];
    if (categories != nil) {
        self.categories = categories;
        [self.tableView reloadData];
    } else {
        
        [DejalBezelActivityView activityViewForView:self.view withLabel:@"Подождите\nИдет загрузка..."];
        [CatalogService retrieveCategoriesWithParentId:self.parentCategoryId onSuccess:^(ResponseWrapperModel *response) {
            if (response.success) {
                self.categories = [CatalogService getCategoriesByParentId:self.parentCategoryId];
                [self.tableView reloadData];
                [DejalBezelActivityView removeViewAnimated:YES];
            } else {
                [DejalBezelActivityView removeViewAnimated:NO];
                // SHOW ERROR
                UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Ошибка"
                                                                               message:@"Не удалось загрузить категории."
                                                                        preferredStyle:UIAlertControllerStyleAlert];
                UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                                      handler:^(UIAlertAction * action) {}];
                [alert addAction:defaultAction];
                [self presentViewController:alert animated:YES completion:nil];
            }
        } onFailure:^(NSError *error) {
            [DejalBezelActivityView removeViewAnimated:NO];
            // SHOW ERROR
            UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Ошибка"
                                                                           message:@"Не удалось загрузить категории."
                                                                    preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                                  handler:^(UIAlertAction * action) {}];
            [alert addAction:defaultAction];
            [self presentViewController:alert animated:YES completion:nil];
        }];
        
    }
}


- (void) loadUserAvatarInCell:(CatalogTableViewCell*) cell onIndexPath:(NSIndexPath*)indexPath withImageUrl:(NSString*)imageUrl {
    UIImage *loadedImage =(UIImage *)[LocalStorageService  loadImageFromLocalCache:imageUrl];
    
    if (loadedImage != nil) {
        cell.categoryImageView.image = loadedImage;
    } else {
        NSBlockOperation *loadImageOperation = [[NSBlockOperation alloc] init];
        __weak NSBlockOperation *weakOperation = loadImageOperation;
        
        [loadImageOperation addExecutionBlock:^(void){
            UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:
                                                                                   imageUrl
                                                                                   ]]];
            [[NSOperationQueue mainQueue] addOperationWithBlock:^(void) {
                if (! weakOperation.isCancelled) {
                    CatalogTableViewCell *updateCell = (CatalogTableViewCell*)[self.tableView cellForRowAtIndexPath:indexPath];
                    if (updateCell != nil && image != nil) {
                        updateCell.categoryImageView.image = image;
                    }
                    
                    
                    if (image != nil) {
                        [LocalStorageService  saveImageToLocalCache:imageUrl withData:image];
                    } else {
                        //cell.categoryImageView.image = [UIImage imageNamed:@"catalog_cell_default_icon"];
                        cell.categoryImageView.image = [UIImage imageNamed:@"no_category_icon"];
                        
                        //cell.categoryImageView.image = nil;
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
    if (self.categories != nil)
        return [self.categories count];
    return 0;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CatalogTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CatalogCell"];
    if (!cell) {
        [tableView registerNib:[UINib nibWithNibName:@"CatalogTableViewCell" bundle:nil]forCellReuseIdentifier:@"CatalogCell"];
        cell = [tableView dequeueReusableCellWithIdentifier:@"CatalogCell"];
    }
    
    CategoryModel *model = self.categories[indexPath.row];
    [cell.catalogNameField setText:model.name];
    
    if (model.imageUrl != nil) {
        [self loadUserAvatarInCell:cell onIndexPath:indexPath withImageUrl:model.imageUrl];
    } else {
        cell.categoryImageView.image = [UIImage imageNamed:@"no_category_icon"];
        //cell.categoryImageView.image = nil;
    }
    
    return cell;
}


-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    CategoryModel *model = self.categories[indexPath.row];
    if (model.hasChildren == YES) {
        [self performSegueWithIdentifier:@"showCategorySergue" sender:self];
    } else {
        [self performSegueWithIdentifier:@"showProductsSergue" sender:self];
    }
}

-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60;
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // IF CITY -> SHOW SELECTED CITY
    if ([segue.destinationViewController isKindOfClass:[CitiesTableViewController class]]) {
        // TODO
    }
    
    if ([segue.destinationViewController isKindOfClass:[ProductsTableViewController class]]) {
        ProductsTableViewController *viewController = (ProductsTableViewController*)segue.destinationViewController;
         NSIndexPath *indexPath = self.tableView.indexPathForSelectedRow;
        CategoryModel *model = self.categories[indexPath.row];
        [viewController setProductsCategory:model.numberOnSite];
    }
    
    if ([segue.destinationViewController isKindOfClass:[CatalogTableViewController class]]) {
        CatalogTableViewController *viewController = (CatalogTableViewController*)segue.destinationViewController;
        NSIndexPath *indexPath = self.tableView.indexPathForSelectedRow;
        CategoryModel *model = self.categories[indexPath.row];
        viewController.parentCategoryId = model.id;
    }
    
    
}


- (IBAction)cityChoiceButtonAction:(UIBarButtonItem *)sender {
    [self performSegueWithIdentifier:@"chooseCitySergue" sender:nil];
}
@end
