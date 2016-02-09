//
//  ProductDetailTableViewController.m
//  MechtaApp
//
//  Created by Artem Demidovich on 2/5/16.
//  Copyright © 2016 Aphion Software. All rights reserved.
//

#import "ProductDetailTableViewController.h"
#import "ProductImageTableViewCell.h"

#import "ProductService.h"
#import "DejalActivityView.h"

#import "CityService.h"

#import "ProductSwitcherTableViewCell.h"

/* Режим просмотра доступен где-то */
static int MODE_AVAILABILITY = 0;

/* Режим просмотра описания */
static int MODE_DESCRIPTION = 1;

/* Режим просмотра характеристик */
static int MODE_CHARACTERISTICS = 2;


@interface ProductDetailTableViewController ()

@property ProductModel *product;
@property int mode;

@end

@implementation ProductDetailTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.mode = MODE_AVAILABILITY;
    
    [DejalBezelActivityView activityViewForView:self.view withLabel:@"Подождите\nИдет загрузка..."];
    [self loadProduct];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


#pragma mark - Data loading


- (void) loadProduct {
    if (self.product == nil) {
        // TODO SHOW ERROR
        return;
    }
    
    CityModel *cityModel = [CityService getSelectedCityModel];
    
    [ProductService retrieveProductDetailWithId:self.product.numberOnSite inCategory:self.product.numberOnSiteCategory inCityId:cityModel.id onSuccess:^(ResponseWrapperModel *response) {
        if (response.success) {
            ProductModel *product = (ProductModel*)response.data;
            if (product != nil) {
                [self.tableView reloadData];
                [DejalBezelActivityView removeViewAnimated:YES];
            } else {
                [DejalBezelActivityView removeViewAnimated:NO];
                UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Ошибка"
                                                                               message:@"Не удалось загрузить информацию о товаре."
                                                                        preferredStyle:UIAlertControllerStyleAlert];
                UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                                      handler:^(UIAlertAction * action) {}];
                [alert addAction:defaultAction];
                [self presentViewController:alert animated:YES completion:nil];
            }
            
        }
    } onFailure:^(NSError *error) {
        [DejalBezelActivityView removeViewAnimated:NO];
        UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Ошибка"
                                                                       message:@"Не удалось загрузить  информацию о товаре."
                                                                preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                              handler:^(UIAlertAction * action) {}];
        [alert addAction:defaultAction];
        [self presentViewController:alert animated:YES completion:nil];
    }];
}

- (void) setProductModel:(ProductModel*)model {
    self.product = model;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (self.mode == MODE_AVAILABILITY) {
        if (self.product != nil && self.product.productAvailability != nil) {
            return 2 + [self.product.productAvailability count];
        } else {
            return 2 + 1; // Empty PRODUCT IS UNAVAILABLE
        }
    }
    
    if (self.mode == MODE_DESCRIPTION) {
            return 2 + 1; // Empty PRODUCT DESCRIPTION
    }

    if (self.mode == MODE_CHARACTERISTICS) {
        if (self.product != nil && self.product.characteristics != nil) {
            int rowCount = 0;
            for (ProductCharacteristicGroupModel *groupModel in self.product.characteristics) {
                if (groupModel != nil) {
                    rowCount += 1;
                    if (groupModel.characteristics != nil) {
                        for (ProductCharacteristicModel *model in groupModel.characteristics) {
                            rowCount = +1;
                        }
                    }
                }
            }
            return 2 + rowCount;
        } else {
            return 2 + 1; // Empty PRODUCT DESCRIPTION
        }
    }
    
    return 2;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        ProductImageTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ProductImageCell"];
        if (!cell) {
            [tableView registerNib:[UINib nibWithNibName:@"ProductImageTableViewCell" bundle:nil]forCellReuseIdentifier:@"ProductImageCell"];
            cell = [tableView dequeueReusableCellWithIdentifier:@"ProductImageCell"];
        }
        
        
        return cell;
    }
    
    if (indexPath.row == 1) {
        ProductSwitcherTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ProductSwitcherCell"];
        if (!cell) {
            [tableView registerNib:[UINib nibWithNibName:@"ProductSwitcherTableViewCell" bundle:nil]forCellReuseIdentifier:@"ProductSwitcherCell"];
            cell = [tableView dequeueReusableCellWithIdentifier:@"ProductSwitcherCell"];
        }
        
        
        return cell;
    }
    
    return nil;
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        return 200;
    }
    return 44;
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
