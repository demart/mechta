//
//  ProductSwitcherTableViewCell.m
//  MechtaApp
//
//  Created by Artem Demidovich on 2/9/16.
//  Copyright © 2016 Aphion Software. All rights reserved.
//

#import "ProductSwitcherTableViewCell.h"

@implementation ProductSwitcherTableViewCell

- (void)awakeFromNib {
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

- (IBAction)switcherModeChanged:(id)sender {
    [self.parentController performSelector:@selector(modeWasChanged:) withObject:sender];
}
@end
