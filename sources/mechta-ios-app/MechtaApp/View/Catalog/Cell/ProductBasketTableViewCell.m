//
//  ProductBasketTableViewCell.m
//  MechtaApp
//
//  Created by Artem Demidovich on 2/9/16.
//  Copyright © 2016 Aphion Software. All rights reserved.
//

#import "ProductBasketTableViewCell.h"

@implementation ProductBasketTableViewCell

- (void)awakeFromNib {
    [self initButtonView:self.addProductButton];
}

-(void) initButtonView:(UIView*) view {
    view.layer.cornerRadius = 3.0;
    //view.layer.masksToBounds = NO;
    //view.layer.shadowOffset = CGSizeMake(2, 2);
    //view.layer.shadowRadius = 2;
    //view.layer.shadowOpacity = 0.5;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
