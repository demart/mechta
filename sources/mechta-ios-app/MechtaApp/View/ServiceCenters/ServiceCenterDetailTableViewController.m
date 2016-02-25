//
//  ServiceCenterDetailTableViewController.m
//  MechtaApp
//
//  Created by Artem Demidovich on 2/25/16.
//  Copyright © 2016 Aphion Software. All rights reserved.
//

#import "ServiceCenterDetailTableViewController.h"
#import "ServiceCenterDetailMapViewTableViewCell.h"
#import "ServiceCenterMapLocationModel.h"

@interface ServiceCenterDetailTableViewController ()

@property ServiceCenterModel *serviceCenterModel;

@end

@implementation ServiceCenterDetailTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    self.tableView.separatorColor = [UIColor clearColor];
}


-(void) setSelectedServiceCetnerModel:(ServiceCenterModel*) model {
    self.serviceCenterModel = model;
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
        ServiceCenterDetailMapViewTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ServiceCenterDetailMapViewCell"];
        if (!cell) {
            [tableView registerNib:[UINib nibWithNibName:@"ShopDetailMapViewTableViewCell" bundle:nil]forCellReuseIdentifier:@"ServiceCenterDetailMapViewCell"];
            cell = [tableView dequeueReusableCellWithIdentifier:@"ServiceCenterDetailMapViewCell"];
        }
        
        [cell initMapView:self.serviceCenterModel];
        
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

@end
