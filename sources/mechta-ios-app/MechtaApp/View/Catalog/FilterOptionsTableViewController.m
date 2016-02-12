//
//  FilterOptionsTableViewController.m
//  MechtaApp
//
//  Created by Artem Demidovich on 2/13/16.
//  Copyright © 2016 Aphion Software. All rights reserved.
//

#import "FilterOptionsTableViewController.h"
#import "FilterOptionTableViewCell.h"

@interface FilterOptionsTableViewController ()

@property FilterModel *filterModel;
@property FiltersModel *appliedFilters;

@end

@implementation FilterOptionsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}


#pragma mark - Data Loading

- (IBAction)applyFilterOptions:(UIBarButtonItem *)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void) setFilterParameters:(FilterModel*) filterModel withAppliedFilters:(FiltersModel*)appliedFilters {
    self.filterModel = filterModel;
    self.appliedFilters = appliedFilters;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (self.filterModel != nil && self.filterModel.options != nil)
        return self.filterModel.options.count;
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    FilterOptionTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FilterOptionCell"];
    if (!cell) {
        [tableView registerNib:[UINib nibWithNibName:@"FilterOptionTableViewCell" bundle:nil]forCellReuseIdentifier:@"FilterOptionCell"];
        cell = [tableView dequeueReusableCellWithIdentifier:@"FilterOptionCell"];
    }
    
    FilterOptionModel *model = self.filterModel.options[indexPath.row];
    [cell.filterOptionLabel setText:model.value];
    
    BOOL isAlreadyInFilter = [self checkIsAlreadyInFilter:model];
    if (isAlreadyInFilter == YES) {
        cell.filterMarkImageView.image = [UIImage imageNamed:@"filter_mark_checked"];
    } else {
        cell.filterMarkImageView.image = [UIImage imageNamed:@"filter_mark_unchecked"];
    }
    
    return cell;
}

- (BOOL) checkIsAlreadyInFilter:(FilterOptionModel*) model {
    if (self.appliedFilters == nil || self.appliedFilters.filters == nil)
        return NO;
    
    for (FilterModel *filterModel in self.appliedFilters.filters) {
        if (filterModel.options != nil) {
            for (FilterOptionModel *filterOptionModel in filterModel.options) {
                if ([filterOptionModel.key isEqualToString:model.key]) {
                    return YES;
                }
            }
        }
    }
    return NO;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    FilterOptionModel *model = self.filterModel.options[indexPath.row];
    BOOL isAlreadyInFilter = [self checkIsAlreadyInFilter:model];
    if (isAlreadyInFilter == YES) {
        [self removeFilterOptionModelFromFilters:model];
    } else {
        [self addFilterOptionModelToFilters:model];
    }
    
    [self.tableView reloadData];
}


- (void) addFilterOptionModelToFilters:(FilterOptionModel*) model {
    for (FilterModel *filterModel in self.appliedFilters.filters) {
        if (filterModel.index == self.filterModel.index) {
            // FOUND filterModel lets add this object;
            [filterModel.options addObject:model];
            return;
        }
    }
    
    // Adding filterModel
    FilterModel *addFilterModel = [[FilterModel alloc] init];
    addFilterModel.name = self.filterModel.name;
    addFilterModel.index = self.filterModel.index;
    addFilterModel.options = [[NSMutableArray alloc] init];
    [addFilterModel.options addObject:model];
    [self.appliedFilters.filters addObject:addFilterModel];
    
}

- (void) removeFilterOptionModelFromFilters:(FilterOptionModel*) model {
    for (FilterModel *filterModel in self.appliedFilters.filters) {
        if (filterModel.index == self.filterModel.index) {
            FilterOptionModel *deletingModel = nil;
            for (FilterOptionModel *filterOptionModel in filterModel.options) {
                if ([filterOptionModel.key isEqualToString:model.key]) {
                    deletingModel = filterOptionModel;
                    break;
                }
            }
            
            if (deletingModel != nil) {
                [filterModel.options removeObject:deletingModel];
            }
        }
    }
}


- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
