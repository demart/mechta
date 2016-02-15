//
//  FilterPriceTableViewCell.h
//  MechtaApp
//
//  Created by Artem Demidovich on 2/12/16.
//  Copyright © 2016 Aphion Software. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NMRangeSlider.h"
#import "FiltersModel.h"

@interface FilterPriceTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet NMRangeSlider *filterPriceSlider;
@property (weak, nonatomic) IBOutlet UILabel *filterLowerPriceLabel;
@property (weak, nonatomic) IBOutlet UILabel *filterHighPriceLabel;

@property FiltersModel *filtersModel;

- (IBAction)filterPriceSliderValueChanged:(NMRangeSlider *)sender;

- (void) updateSliderLabels;

@end