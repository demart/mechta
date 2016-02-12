//
//  FilterTableViewController.m
//  MechtaApp
//
//  Created by Artem Demidovich on 2/12/16.
//  Copyright © 2016 Aphion Software. All rights reserved.
//

#import "FilterTableViewController.h"

#import "FilterPriceTableViewCell.h"
#import "FilterGroupTableViewCell.h"
#import "FilterOptionTableViewCell.h"

@interface FilterTableViewController ()

@property UITableViewController *productController;
@property FiltersModel *filtersModel;

@property FiltersModel *appliedFilters;
@property int sortOrder;

@end

@implementation FilterTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

#pragma mark - Filters loading

- (void) clearFilters {
    self.appliedFilters = nil;
    self.filtersModel = nil;
    self.sortOrder = 0;
}

- (void) setFilterParameters:(FiltersModel*)filtersModel forViewController:(UITableViewController*) productController {
    self.filtersModel = filtersModel;
    self.productController = productController;
}


- (void) viewWillAppear:(BOOL)animated {
    [self prepareFilters];
}


- (void) prepareFilters {
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // 1 - Price
    // 2 - Groups
    // 3 - Sorts
    return 1 + self.filtersModel.filters.count + 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Цена
    if (section == 0) {
        return 1;
    }
    
    // Цгуппы
    if (section > 0 && self.filtersModel.filters.count <= section) {
        return self.filtersModel.filters.count;
    }
    
    return 0;
}


- (UIView*) tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    // Price header
    if (section == 0) {
        return [[UIView alloc] init];
    }
    
    // Filters headers
    if (section > 0 && self.filtersModel.filters.count <= section) {
        FilterGroupTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FilterGroupCell"];
        if (!cell) {
            [tableView registerNib:[UINib nibWithNibName:@"FilterGroupTableViewCell" bundle:nil]forCellReuseIdentifier:@"FilterGroupCell"];
            cell = [tableView dequeueReusableCellWithIdentifier:@"FilterGroupCell"];
        }
        return cell;
    }
    
    return [[UIView alloc] init];
}


- (CGFloat) tableView:(UITableView *)tableView estimatedHeightForHeaderInSection:(NSInteger)section {
    return 20;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    // Price Cell
    if (indexPath.section == 0) {
        FilterPriceTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FilterPriceCell"];
        if (!cell) {
            [tableView registerNib:[UINib nibWithNibName:@"FilterPriceTableViewCell" bundle:nil]forCellReuseIdentifier:@"FilterPriceCell"];
            cell = [tableView dequeueReusableCellWithIdentifier:@"FilterPriceCell"];
        }
        return cell;
    }
    
    // Filter Options
    if (indexPath.section > 0 && self.filtersModel.filters.count <= indexPath.section) {
        FilterOptionTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FilterOptionCell"];
        if (!cell) {
            [tableView registerNib:[UINib nibWithNibName:@"FilterOptionTableViewCell" bundle:nil]forCellReuseIdentifier:@"FilterOptionCell"];
            cell = [tableView dequeueReusableCellWithIdentifier:@"FilterOptionCell"];
        }
        return cell;
    }
    
    return [[UITableViewCell alloc] init];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)hideFiltersView:(UIBarButtonItem *)sender {
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
    
}
- (IBAction)applyFiltersAction:(UIBarButtonItem *)sender {
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
