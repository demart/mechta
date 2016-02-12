//
//  FilterTableViewController.m
//  MechtaApp
//
//  Created by Artem Demidovich on 2/12/16.
//  Copyright © 2016 Aphion Software. All rights reserved.
//

#import "FilterTableViewController.h"
#import "FilterOptionsTableViewController.h"

#import "FilterPriceTableViewCell.h"
#import "FilterGroupTableViewCell.h"
#import "FilterOptionTableViewCell.h"
#import "FilterClearTableViewCell.h"
#import "Constants.h"

@interface FilterTableViewController ()

@property UITableViewController *productController;
@property FiltersModel *filtersModel;

@property FiltersModel *appliedFilters;
@property int sortOrder;

@end

@implementation FilterTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    self.tableView.tableFooterView.frame = CGRectMake(0, 0, self.tableView.frame.size.width, 1);
    //self.tableView.separatorColor = [UIColor clearColor];
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
    
    if (self.appliedFilters == nil) {
        self.appliedFilters = [[FiltersModel alloc] init];
        self.appliedFilters.costLeft = self.filtersModel.costLeft;
        self.appliedFilters.costRight = self.filtersModel.costRight;
        self.appliedFilters.selectedCostLeft = self.filtersModel.selectedCostLeft;
        self.appliedFilters.selectedCostRight = self.filtersModel.selectedCostRight;
        self.appliedFilters.sortOrder = 1;
        self.appliedFilters.filters = [[NSMutableArray alloc] init];
    }
}


- (void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self prepareFilters];
}


- (void) prepareFilters {
    [self.tableView reloadData];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    int rows = [self isExistAppliedFilters] == YES ? 3 : 2;
    return 1 + 1 + self.filtersModel.filters.count + rows;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    // EMPTY DARK CELL
    if (indexPath.row == 0 || indexPath.row == 2) {
        UITableViewCell *view = [[UITableViewCell alloc] init];
        [view setBackgroundColor:[Constants SYSTEM_COLOR_LIGHTER_GREY]];
        return view;
    }
    
    if (indexPath.row == 1) {
        FilterPriceTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FilterPriceCell"];
        if (!cell) {
            [tableView registerNib:[UINib nibWithNibName:@"FilterPriceTableViewCell" bundle:nil]forCellReuseIdentifier:@"FilterPriceCell"];
            cell = [tableView dequeueReusableCellWithIdentifier:@"FilterPriceCell"];
        }
        return cell;
    }
    
    int rows = [self isExistAppliedFilters] == YES ? 3 : 2;
    
    if (indexPath.row == 3 && rows == 3) {
        FilterClearTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FilterClearCell"];
        if (!cell) {
            [tableView registerNib:[UINib nibWithNibName:@"FilterClearTableViewCell" bundle:nil]forCellReuseIdentifier:@"FilterClearCell"];
            cell = [tableView dequeueReusableCellWithIdentifier:@"FilterClearCell"];
        }
        cell.accessoryView = [self addClearFilterModelButton];
        return cell;
    }
    
    if (indexPath.row > rows && indexPath.row < self.filtersModel.filters.count+rows) {
        FilterGroupTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FilterGroupCell"];
        if (!cell) {
            [tableView registerNib:[UINib nibWithNibName:@"FilterGroupTableViewCell" bundle:nil]forCellReuseIdentifier:@"FilterGroupCell"];
            cell = [tableView dequeueReusableCellWithIdentifier:@"FilterGroupCell"];
        }

        FilterModel *model = self.filtersModel.filters[indexPath.row - rows];
        [cell.filterGroupTitle setText:model.name];
        
        BOOL isAppliedFilterOptions = [self isAppliedFilterOptions:model];
        if (isAppliedFilterOptions == YES) {
            cell.filterAppliedImageView.image = [UIImage imageNamed:@"filter_mark_checked_green"];
            cell.accessoryView = [self addClearFilterModelButton];
        } else {
            cell.filterAppliedImageView.image = nil;
            cell.accessoryView = nil;
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        }
        
        return cell;
    }
    
    return [[UITableViewCell alloc] init];
    
}

- (BOOL) isAppliedFilterOptions:(FilterModel*) model {
    if (self.appliedFilters == nil || self.appliedFilters.filters == nil)
        return NO;
    
    for (FilterModel *filterModel in self.appliedFilters.filters) {
        if (model.index == filterModel.index) {
            if (filterModel.options == nil || filterModel.options.count < 1) {
                return NO;
            } else {
                return YES;
            }
        }
    }
    return NO;
}


- (UIView*) addClearFilterModelButton {
    UIImage *image = [UIImage imageNamed:@"filter_clear_icon"];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 0, 20, 20);
    [button addTarget: self
               action: @selector(accessoryButtonTapped:withEvent:)
     forControlEvents: UIControlEventTouchUpInside];
    [button setImage:image forState:UIControlStateNormal];
    return button;
}

- (void) accessoryButtonTapped: (UIControl *) button withEvent: (UIEvent *) event {
    NSIndexPath * indexPath = [self.tableView indexPathForRowAtPoint:[[[event touchesForView: button] anyObject] locationInView: self.tableView]];
    if ( indexPath == nil )
        return;
    
    [self.tableView.delegate tableView: self.tableView accessoryButtonTappedForRowWithIndexPath: indexPath];
}


- (void) tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath {
    int rows = [self isExistAppliedFilters] == YES ? 3 : 2;
    if (indexPath.row == 3 && rows == 3) {
        [self.appliedFilters.filters removeAllObjects];
        [self.tableView reloadData];
        return;
    }
    
    if (self.appliedFilters == nil || self.appliedFilters.filters == nil || self.appliedFilters.filters.count < 1)
        return;
    
    FilterModel *selectedFilterModel =  self.filtersModel.filters[indexPath.row -rows];
    if (selectedFilterModel == nil)
        return;
    
    FilterModel *filterModel = nil;
    for (FilterModel *model in self.appliedFilters.filters) {
        if (model.index == selectedFilterModel.index)
            filterModel = model;
    }
    
    if (filterModel != nil) {
        [self.appliedFilters.filters removeObject:filterModel];
        [self.tableView reloadData];
    }
    
}


- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    int rows = [self isExistAppliedFilters] == YES ? 3 : 2;
    if (indexPath.row > rows && indexPath.row < self.filtersModel.filters.count+rows) {
        [self performSegueWithIdentifier:@"showFilterOptionsSegue" sender:self];
    }
}

- (BOOL) isExistAppliedFilters {
    if (self.appliedFilters.filters != nil && self.appliedFilters.filters.count > 0) {
        for (FilterModel *filterModel in self.appliedFilters.filters) {
            if (filterModel.options != nil && filterModel.options.count > 0)
                return YES;
        }
    }
        return NO;
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0 || indexPath.row == 2)
        return 20;
    
    if (indexPath.row == 1)
        return 60;
    
    int rows = [self isExistAppliedFilters] == YES ? 3 : 2;
    if (indexPath.row == 3 && rows == 3)
        return 30;
    
    if (indexPath.row > rows && indexPath.row < self.filtersModel.filters.count+rows)
        return 40;
    
    return 20;
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.destinationViewController isKindOfClass:[FilterOptionsTableViewController class]]) {
        FilterOptionsTableViewController *viewController = (FilterOptionsTableViewController*)segue.destinationViewController;
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        int rows = [self isExistAppliedFilters] == YES ? 3 : 2;
        FilterModel *filterModel = self.filtersModel.filters[indexPath.row-rows];
        [viewController setFilterParameters:filterModel withAppliedFilters:self.appliedFilters];
    }

}


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
