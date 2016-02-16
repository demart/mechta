//
//  FilterSortOptionsTableViewCell.h
//  MechtaApp
//
//  Created by Artem Demidovich on 2/16/16.
//  Copyright © 2016 Aphion Software. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FiltersModel.h"

@interface FilterSortOptionsTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UISegmentedControl *sortSegmentForPrice;
@property (weak, nonatomic) IBOutlet UISegmentedControl *sortSegmentForName;
@property (weak, nonatomic) IBOutlet UISegmentedControl *sortSegmentForDate;
- (IBAction)sortSegmentValueChanged:(UISegmentedControl *)sender;

@property FiltersModel *filtersModel;

- (void) setAppliedFiltersModel:(FiltersModel*)filters;

@end
