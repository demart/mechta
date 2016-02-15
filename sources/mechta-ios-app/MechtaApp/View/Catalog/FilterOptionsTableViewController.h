//
//  FilterOptionsTableViewController.h
//  MechtaApp
//
//  Created by Artem Demidovich on 2/13/16.
//  Copyright © 2016 Aphion Software. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ResponseWrapperModel.h"

@interface FilterOptionsTableViewController : UITableViewController
- (IBAction)applyFilterOptions:(UIBarButtonItem *)sender;


- (void) setFilterParameters:(FilterModel*) filterModel withAppliedFilters:(FiltersModel*)appliedFilters;

@end
