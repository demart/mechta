//
//  ShopDetailTableViewController.m
//  MechtaApp
//
//  Created by Artem Demidovich on 2/10/16.
//  Copyright © 2016 Aphion Software. All rights reserved.
//

#import "ShopDetailTableViewController.h"
#import "ShopDetailMapViewTableViewCell.h"
#import "MapLocationModel.h"

@interface ShopDetailTableViewController ()

@property ShopModel *shopModel;

@end

@implementation ShopDetailTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    self.tableView.separatorColor = [UIColor clearColor];
}


-(void) setSelectedShopModel:(ShopModel*) model {
    self.shopModel = model;
}

- (void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    // Load Data
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        ShopDetailMapViewTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ShopDetailMapViewCell"];
        if (!cell) {
            [tableView registerNib:[UINib nibWithNibName:@"ShopDetailMapViewTableViewCell" bundle:nil]forCellReuseIdentifier:@"ShopDetailMapViewCell"];
            cell = [tableView dequeueReusableCellWithIdentifier:@"ShopDetailMapViewCell"];
        }
        
        [cell initMapView:self.shopModel];
        
        return cell;
    }
    
    
    return nil;
}


- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        return self.tableView.bounds.size.height - self.navigationController.navigationBar.bounds.size.height;
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
