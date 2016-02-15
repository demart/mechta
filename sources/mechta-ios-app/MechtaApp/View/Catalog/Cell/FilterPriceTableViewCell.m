//
//  FilterPriceTableViewCell.m
//  MechtaApp
//
//  Created by Artem Demidovich on 2/12/16.
//  Copyright © 2016 Aphion Software. All rights reserved.
//

#import "FilterPriceTableViewCell.h"

@implementation FilterPriceTableViewCell

- (void)awakeFromNib {
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

- (void) updateSliderLabels{
    NSString *lowerValue = [NSString stringWithFormat:@"от %@ тг.", [self formattedCost:self.filterPriceSlider.lowerValue]];
    self.filterLowerPriceLabel.text = lowerValue;
    
    NSString *highValue = [NSString stringWithFormat:@"до %@ тг.", [self formattedCost:self.filterPriceSlider.upperValue]];
    self.filterHighPriceLabel.text = highValue;
}

- (IBAction)filterPriceSliderValueChanged:(NMRangeSlider *)sender {
    [self updateSliderLabels];
    if (self.filtersModel != nil) {
        self.filtersModel.selectedCostLeft = self.filterPriceSlider.lowerValue;
        self.filtersModel.selectedCostRight = self.filterPriceSlider.upperValue;
    }
}


- (NSString*) formattedCost:(int)price {
    NSString* cost = [[NSString alloc] initWithFormat:@"%i", price];
    NSString* formatterCost = @"";
    if ([cost length] > 3) {
        int z = 0;
        for (long i = [cost length] -1; i >= 0; i--) {
            z+=1;
            formatterCost = [[NSString alloc] initWithFormat:@"%@%@", [cost substringWithRange:NSMakeRange(i,1)],formatterCost];
            if (z == 3) {
                formatterCost = [[NSString alloc] initWithFormat:@" %@", formatterCost];
                z = 0;
            }
        }
    } else {
        formatterCost = cost;
    }
    return formatterCost;
}
@end
