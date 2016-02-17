//
//  SearchResultsTableViewController.m
//  MechtaApp
//
//  Created by Artem Demidovich on 2/17/16.
//  Copyright © 2016 Aphion Software. All rights reserved.
//

#import "SearchResultsTableViewController.h"
#import "Constants.h"
#import "ProductDetailTableViewController.h"

#import "SearchObjectModel.h"
#import "ProductModel.h"

@interface SearchResultsTableViewController ()
@end

@implementation SearchResultsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    //self.tableView.separatorColor = [UIColor clearColor];
    
    self.page = 2;
    
    self.loadImageOperationQueue = [[NSOperationQueue alloc] init];
    [self.loadImageOperationQueue setMaxConcurrentOperationCount:5];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void)viewWillDisappear:(BOOL)animated {
    [_loadImageOperationQueue cancelAllOperations];
    [_loadImageOperations removeAllObjects];
}

-(void) loadProducts {
    CityModel *cityModel = [CityService getSelectedCityModel];
    
    [CatalogService searchProductsWithText:self.searchedText withPage:self.page  inCityId:cityModel.id onSuccess:^(ResponseWrapperModel *response) {
       
        NSMutableArray *products = (NSMutableArray*)response.data;
        if (products == nil || [products count] < 1) {
            self.hasMoreRecords = NO;
        } else {
            [self.foundRecords addObjectsFromArray:products];
            if (response.countOfPages > self.page) {
                self.page = self.page + 1;
                self.hasMoreRecords = YES;
            } else {
                self.hasMoreRecords = NO;
            }
        }
        [self.tableView reloadData];
    } onFailure:^(NSError *error) {
        // SHOW ERROR
        UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Ошибка"
                                                                       message:@"Не удалось загрузить данные."
                                                                preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                              handler:^(UIAlertAction * action) {}];
        [alert addAction:defaultAction];
        [self presentViewController:alert animated:YES completion:nil];
    }];
    
}

- (void) loadProductImageInCell:(SearchProductTableViewCell*) cell onIndexPath:(NSIndexPath*)indexPath withImageUrl:(NSString*)imageUrl {
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
                    SearchProductTableViewCell *updateCell = (SearchProductTableViewCell*)[self.tableView cellForRowAtIndexPath:indexPath];
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
    if (self.wasSearchQueryRequested) {
        if (self.foundRecords.count > 0) {
            self.tableView.backgroundView = nil;
            if (self.hasMoreRecords == YES) {
                return self.foundRecords.count + 1;
            } else {
                return self.foundRecords.count;
            }
        } else {
            [self showEmptySearchResultView];
            return 0;
        }
    } else {
        self.tableView.backgroundView = nil;
        return 0;
    }
}

- (void) showEmptySearchResultView {
    UIView *messageContainer = [[UIView alloc] initWithFrame:CGRectMake(0, 0,
                                                                        self.tableView.bounds.size.width,
                                                                        self.tableView.bounds.size.height)];
    UILabel *messageLbl = [[UILabel alloc] initWithFrame:CGRectMake(self.tableView.bounds.size.width*0.1, self.tableView.bounds.size.height*.4,
                                                                    self.tableView.bounds.size.width*0.8,
                                                                    self.tableView.bounds.size.height)];
    messageLbl.numberOfLines = 0;
    NSString *text = @"Поиск не дал результатов.\n Попробуйте ввести другое ключевое слово.";
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.alignment = NSTextAlignmentCenter;
    NSDictionary *attributes = @{NSFontAttributeName: [UIFont systemFontOfSize:15.f],
                                 NSBaselineOffsetAttributeName: @0,
                                 NSParagraphStyleAttributeName: paragraphStyle};
    NSAttributedString *attributedText = [[NSAttributedString alloc] initWithString:text
                                                                         attributes:attributes];
    messageLbl.attributedText = attributedText;
    messageLbl.textColor = [Constants SYSTEM_COLOR_DARK_GREY];
    [messageLbl sizeToFit];
    [messageContainer addSubview:messageLbl];
    [messageContainer sizeToFit];
    self.tableView.backgroundView = messageContainer;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row > [self.foundRecords count] -1) {
        LoadMoreTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LoadMoreCell"];
        if (!cell) {
            [tableView registerNib:[UINib nibWithNibName:@"LoadMoreTableViewCell" bundle:nil]forCellReuseIdentifier:@"LoadMoreCell"];
            cell = [tableView dequeueReusableCellWithIdentifier:@"LoadMoreCell"];
        }
        
        [cell.loadingActivityIndicator startAnimating];
        [self loadProducts];
        
        return cell;
    } else {
        SearchProductTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SearchProductCell"];
        if (!cell) {
            [tableView registerNib:[UINib nibWithNibName:@"SearchProductTableViewCell" bundle:nil]forCellReuseIdentifier:@"SearchProductCell"];
            cell = [tableView dequeueReusableCellWithIdentifier:@"SearchProductCell"];
        }
        
        SearchObjectModel *model = self.foundRecords[indexPath.row];
        [cell.productName setText:model.name];
        [self loadProductImageInCell:cell onIndexPath:indexPath withImageUrl:model.imageUrl];
        return cell;
    }
    
    return [[UITableViewCell alloc] init];
}


- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"Search item selected");
    if (self.foundRecords != nil && indexPath.row > [self.foundRecords count] - 1)
        return;


    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    ProductDetailTableViewController * vc = (ProductDetailTableViewController *)[sb instantiateViewControllerWithIdentifier:@"productDetailController"];
    SearchObjectModel *model = self.foundRecords[indexPath.row];
    ProductModel *productModel = [[ProductModel alloc] init];
    productModel.numberOnSite = model.numberOnSite;
    productModel.numberOnSiteCategory = model.numberOnSiteCategory;
    [vc setProductModel:productModel];
    [self.mainNavigationController pushViewController:vc animated:YES];
}


- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.foundRecords != nil && indexPath.row > [self.foundRecords count] - 1)
        return 40;
    return 105;
}



#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    //
}


@end
