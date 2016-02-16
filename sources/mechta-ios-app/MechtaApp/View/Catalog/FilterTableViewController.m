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
#import "FilterSortOptionsTableViewCell.h"

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

    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView setBackgroundColor:[Constants SYSTEM_COLOR_LIGHTER_GREY]];
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    
    UITapGestureRecognizer *searchTapped = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(applyFiltersViewAction:)];
    [self.activeteSearchView addGestureRecognizer:searchTapped];
    
    //self.tableView.separatorColor = [UIColor clearColor];
//    self.tableView.tableFooterView.frame = CGRectMake(0, 0, self.tableView.frame.size.width, 1);
}

#pragma mark - Filters loading

- (void) clearFilters {
    self.appliedFilters = nil;
    self.filtersModel = nil;
    self.sortOrder = 0;
}

- (void) setFilterParameters:(FiltersModel*)filtersModel  withAppliedFilters:(FiltersModel*)appliedFilters forViewController:(UITableViewController*) productController {
    
    self.filtersModel = filtersModel;
    self.productController = productController;

    self.appliedFilters = appliedFilters;
    
    if (self.appliedFilters.selectedCostLeft <= self.filtersModel.costLeft)
        self.appliedFilters.selectedCostLeft = self.filtersModel.costLeft;
    if (self.appliedFilters.selectedCostRight <= self.filtersModel.costLeft)
        self.appliedFilters.selectedCostRight = self.filtersModel.costRight;
    
    if (self.appliedFilters.filters == nil){
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
    return 1 + self.filtersModel.filters.count + rows + 3;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    // EMPTY DARK CELL
    if (indexPath.row == 0 || indexPath.row == 2) {
        UITableViewCell *view = [[UITableViewCell alloc] init];
        [view setBackgroundColor:[Constants SYSTEM_COLOR_LIGHTER_GREY]];
        view.accessoryType = UITableViewCellAccessoryNone;
        view.selectionStyle = UITableViewCellSelectionStyleNone;
        return view;
    }
    
    if (indexPath.row == 1) {
        FilterPriceTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FilterPriceCell"];
        if (!cell) {
            [tableView registerNib:[UINib nibWithNibName:@"FilterPriceTableViewCell" bundle:nil]forCellReuseIdentifier:@"FilterPriceCell"];
            cell = [tableView dequeueReusableCellWithIdentifier:@"FilterPriceCell"];
        }

        cell.selectionStyle = UITableViewCellSelectionStyleNone;

        cell.filtersModel = self.appliedFilters;
        cell.filterPriceSlider.minimumValue = self.filtersModel.costLeft;
        cell.filterPriceSlider.maximumValue = self.filtersModel.costRight;
        
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
    
    if (indexPath.row > rows && indexPath.row < self.filtersModel.filters.count+rows+1) {
        FilterGroupTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FilterGroupCell"];
        if (!cell) {
            [tableView registerNib:[UINib nibWithNibName:@"FilterGroupTableViewCell" bundle:nil]forCellReuseIdentifier:@"FilterGroupCell"];
            cell = [tableView dequeueReusableCellWithIdentifier:@"FilterGroupCell"];
        }

        
        
        FilterModel *model = self.filtersModel.filters[indexPath.row - rows - 1];
        
        BOOL isAppliedFilterOptions = [self isAppliedFilterOptions:model];
        if (isAppliedFilterOptions == YES) {
            cell.filterAppliedImageView.image = [UIImage imageNamed:@"filter_mark_checked_green"];
            cell.accessoryView = [self addClearFilterModelButton];
            // ADD formatted text
            NSMutableArray *arr = [self getAppliedFilterOptions:model];
            if (arr != nil && [arr count] > 0) {
                NSString *selectedOptins;
                FilterOptionModel *optionModel =(FilterOptionModel*)arr[0];
                if ([arr count] > 1) {
                    selectedOptins = [[NSString alloc] initWithFormat:@"%@ + %lu", optionModel.value, (unsigned long)[arr count]-1];
                } else {
                    selectedOptins = [[NSString alloc] initWithFormat:@"%@", optionModel.value];
                }
                
                NSString *target = [[NSString alloc] initWithFormat:@"%@\n%@", model.name, selectedOptins];
                NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:target];
                
                UIFont *fontBold = [UIFont fontWithName:@"Helvetica" size:13];
                [attributedString addAttribute:NSFontAttributeName
                                         value:fontBold
                                         range:NSMakeRange(model.name.length+1, selectedOptins.length)];
                [attributedString addAttribute:NSForegroundColorAttributeName
                                         value:[Constants SYSTEM_COLOR_PURPLE]
                                         range:NSMakeRange(model.name.length+1, selectedOptins.length)];

                [cell.filterGroupTitle setAttributedText:attributedString];
            } else {
                [cell.filterGroupTitle setText:model.name];
            }
        } else {
            cell.filterAppliedImageView.image = nil;
            cell.accessoryView = nil;
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            // SHOW normat text
            [cell.filterGroupTitle setText:model.name];
        }
        
        return cell;
    }
    
    if (indexPath.row == self.filtersModel.filters.count+rows+1+1) {
        FilterSortOptionsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FilterSortOptionsCell"];
        if (!cell) {
            [tableView registerNib:[UINib nibWithNibName:@"FilterSortOptionsTableViewCell" bundle:nil]forCellReuseIdentifier:@"FilterSortOptionsCell"];
            cell = [tableView dequeueReusableCellWithIdentifier:@"FilterSortOptionsCell"];
        }
        
        [cell setAppliedFiltersModel:self.appliedFilters];
        
        return cell;
    }
    
    
    
    UITableViewCell *view = [[UITableViewCell alloc] init];
    [view setBackgroundColor:[Constants SYSTEM_COLOR_LIGHTER_GREY]];
    view.accessoryType = UITableViewCellAccessoryNone;
    view.selectionStyle = UITableViewCellSelectionStyleNone;
    return view;
    
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

- (NSMutableArray*) getAppliedFilterOptions:(FilterModel*) model {
    if (self.appliedFilters == nil || self.appliedFilters.filters == nil)
        return nil;
    
    NSMutableArray *arr = [[NSMutableArray alloc] init];
    for (FilterModel *filterModel in self.appliedFilters.filters) {
        if (model.index == filterModel.index) {
            if (filterModel.options == nil || filterModel.options.count < 1) {
                return nil;
            } else {
                for (FilterOptionModel *option in filterModel.options) {
                    [arr addObject:option];
                }
            }
        }
    }
    return arr;
}


- (UIView*) addClearFilterModelButton {
    UIImage *image = [UIImage imageNamed:@"filter_clear_icon"];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 0, 15, 15);
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
    
    FilterModel *selectedFilterModel =  self.filtersModel.filters[indexPath.row -rows-1];
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
    if (indexPath.row > rows && indexPath.row < self.filtersModel.filters.count+rows+1) {
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

- (BOOL) isExistAppliedFiltersIncludingPrices {
    if ([self isExistAppliedFilters] == NO) {
        if (self.appliedFilters.costLeft != self.appliedFilters.selectedCostLeft ||
            self.appliedFilters.costRight != self.appliedFilters.selectedCostRight) {
            return YES;
        } else {
            if (self.appliedFilters.sortOrder > 0) {
                return YES;
            } else {
                return NO;
            }
        }
    } else {
        return YES;
    }
}


- (void) tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 1) {
        if (self.appliedFilters.selectedCostRight > 0) {
            ((FilterPriceTableViewCell*)cell).filterPriceSlider.upperValue = self.appliedFilters.selectedCostRight;
        } else {
            ((FilterPriceTableViewCell*)cell).filterPriceSlider.upperValue = self.appliedFilters.costRight;
        }
        
        if (self.appliedFilters.selectedCostLeft > 0) {
            ((FilterPriceTableViewCell*)cell).filterPriceSlider.lowerValue = self.appliedFilters.selectedCostLeft;
        } else {
            ((FilterPriceTableViewCell*)cell).filterPriceSlider.lowerValue = self.appliedFilters.costLeft;
        }

        [((FilterPriceTableViewCell*)cell) updateSliderLabels];
    }
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0)
        return 25;
    
    if (indexPath.row == 1)
        return 80;
    
    if (indexPath.row == 2)
        return 25;
    
    int rows = [self isExistAppliedFilters] == YES ? 3 : 2;
    if (indexPath.row == 3 && rows == 3)
        return 40;
    
    if (indexPath.row > rows && indexPath.row < self.filtersModel.filters.count+rows+1)
        return 50;
    
    if (indexPath.row == self.filtersModel.filters.count+rows+1+1)
        return 190;
    
    return 25;
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.destinationViewController isKindOfClass:[FilterOptionsTableViewController class]]) {
        FilterOptionsTableViewController *viewController = (FilterOptionsTableViewController*)segue.destinationViewController;
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        int rows = [self isExistAppliedFilters] == YES ? 3 : 2;
        FilterModel *filterModel = self.filtersModel.filters[indexPath.row-rows-1];
        [viewController setFilterParameters:filterModel withAppliedFilters:self.appliedFilters];
    }

}


- (IBAction)hideFiltersView:(UIBarButtonItem *)sender {
    [self hideViewAndApplyFilter];
}
- (IBAction)applyFiltersAction:(UIBarButtonItem *)sender {
    [self hideViewAndApplyFilter];
}

- (void) applyFiltersViewAction:(UITapGestureRecognizer *)recognizer {
    [self hideViewAndApplyFilter];
}

- (void) hideViewAndApplyFilter {
    if ([self isExistAppliedFiltersIncludingPrices]) {
        [self.productController performSelector:@selector(showActiveFilterBadgeIcon)];
    } else {
        [self.productController performSelector:@selector(showNoActiveFilterBadgeIcon)];
    }
    [self.productController performSelector:@selector(applyFiltersWithLoadingProduct)];
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
