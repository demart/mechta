//
//  FilterSortOptionsTableViewCell.m
//  MechtaApp
//
//  Created by Artem Demidovich on 2/16/16.
//  Copyright © 2016 Aphion Software. All rights reserved.
//

#import "FilterSortOptionsTableViewCell.h"

@implementation FilterSortOptionsTableViewCell

- (void)awakeFromNib {
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

- (void) setAppliedFiltersModel:(FiltersModel*)filters {
    self.filtersModel = filters;
    [self initSegmentsWithAppliedFilter];
}


- (void) initSegmentsWithAppliedFilter {
    switch (self.filtersModel.sortOrder) {
        case 0:
            [self.sortSegmentForDate setSelectedSegmentIndex:0];
            [self.sortSegmentForName setSelectedSegmentIndex:0];
            [self.sortSegmentForPrice setSelectedSegmentIndex:0];
            break;
            
        case 1: // NAME ASC
            [self.sortSegmentForDate setSelectedSegmentIndex:0];
            [self.sortSegmentForName setSelectedSegmentIndex:1];
            [self.sortSegmentForPrice setSelectedSegmentIndex:0];
            break;
        case 2: // NAME DESC
            [self.sortSegmentForDate setSelectedSegmentIndex:0];
            [self.sortSegmentForName setSelectedSegmentIndex:2];
            [self.sortSegmentForPrice setSelectedSegmentIndex:0];
            break;
            
        case 3: // DATE ASC
            [self.sortSegmentForDate setSelectedSegmentIndex:1];
            [self.sortSegmentForName setSelectedSegmentIndex:0];
            [self.sortSegmentForPrice setSelectedSegmentIndex:0];
            break;
        case 4: // DATE DESC
            [self.sortSegmentForDate setSelectedSegmentIndex:2];
            [self.sortSegmentForName setSelectedSegmentIndex:0];
            [self.sortSegmentForPrice setSelectedSegmentIndex:0];
            break;
            
        case 5: // PRICE ASC
            [self.sortSegmentForDate setSelectedSegmentIndex:0];
            [self.sortSegmentForName setSelectedSegmentIndex:0];
            [self.sortSegmentForPrice setSelectedSegmentIndex:1];
            break;
        case 6: // PRICE DESC
            [self.sortSegmentForDate setSelectedSegmentIndex:0];
            [self.sortSegmentForName setSelectedSegmentIndex:0];
            [self.sortSegmentForPrice setSelectedSegmentIndex:2];
            break;
        default:
            break;
    }
}


- (IBAction)sortSegmentValueChanged:(UISegmentedControl *)sender {
    if (sender == self.sortSegmentForPrice) {
        if (sender.selectedSegmentIndex == 0)
            self.filtersModel.sortOrder = 0;
        if (sender.selectedSegmentIndex == 1)
            self.filtersModel.sortOrder = 5;
        if (sender.selectedSegmentIndex == 2)
            self.filtersModel.sortOrder = 6;
    }
    
    if (sender == self.sortSegmentForDate) {
        if (sender.selectedSegmentIndex == 0)
            self.filtersModel.sortOrder = 0;
        if (sender.selectedSegmentIndex == 1)
            self.filtersModel.sortOrder = 3;
        if (sender.selectedSegmentIndex == 2)
            self.filtersModel.sortOrder = 4;
    }
    
    if (sender == self.sortSegmentForName) {
        if (sender.selectedSegmentIndex == 0)
            self.filtersModel.sortOrder = 0;
        if (sender.selectedSegmentIndex == 1)
            self.filtersModel.sortOrder = 1;
        if (sender.selectedSegmentIndex == 2)
            self.filtersModel.sortOrder = 2;
    }
    [self initSegmentsWithAppliedFilter];
}
@end
