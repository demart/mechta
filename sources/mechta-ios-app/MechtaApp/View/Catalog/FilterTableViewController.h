//
//  FilterTableViewController.h
//  MechtaApp
//
//  Created by Artem Demidovich on 2/12/16.
//  Copyright © 2016 Aphion Software. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ResponseWrapperModel.h"

@interface FilterTableViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (strong, nonatomic) IBOutlet UIView *activeteSearchView;

- (IBAction)hideFiltersView:(UIBarButtonItem *)sender;

- (IBAction)applyFiltersAction:(UIBarButtonItem *)sender;

- (void) setFilterParameters:(FiltersModel*)filtersModel withAppliedFilters:(FiltersModel*)appliedFilters forViewController:(UITableViewController*) productController;

@end