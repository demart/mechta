//
//  ProductDetailTableViewController.m
//  MechtaApp
//
//  Created by Artem Demidovich on 2/5/16.
//  Copyright © 2016 Aphion Software. All rights reserved.
//

#import "ProductDetailTableViewController.h"
#import "ProductImageTableViewCell.h"

@interface ProductDetailTableViewController ()

@property ProductModel *product;

@end

@implementation ProductDetailTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Data loading

- (void) setProductModel:(ProductModel*)model {
    self.product = model;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ProductImageTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ProductImageCell"];
    if (!cell) {
        [tableView registerNib:[UINib nibWithNibName:@"ProductImageTableViewCell" bundle:nil]forCellReuseIdentifier:@"ProductImageCell"];
        cell = [tableView dequeueReusableCellWithIdentifier:@"ProductImageCell"];
    }
    
    
    
    return cell;
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
