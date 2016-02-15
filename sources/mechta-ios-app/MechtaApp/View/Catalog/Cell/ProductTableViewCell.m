//
//  ProductTableViewCell.m
//  MechtaApp
//
//  Created by Artem Demidovich on 2/5/16.
//  Copyright © 2016 Aphion Software. All rights reserved.
//

#import "ProductTableViewCell.h"
#import "Constants.h"

@implementation ProductTableViewCell

- (void)awakeFromNib {
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

-(void) setFormattedPrice:(NSString *)formattedPrice {
    [self.productPriceField setText:[[NSString alloc] initWithFormat:@"%@ тг.", formattedPrice]];
    [self.productPriceField setTextColor:[Constants SYSTEM_COLOR_PURPLE]];
}

-(void) setPrice:(long)productPrice {
    [self.productPriceField setText:[[NSString alloc] initWithFormat:@"%li тг.", productPrice]];
    [self.productPriceField setTextColor:[Constants SYSTEM_COLOR_PURPLE]];
}

-(void) setUnavailable {
    [self.productPriceField setText:@"Нет в наличии"];
    [self.productPriceField setTextColor:[Constants SYSTEM_COLOR_DARK_GREY]];
}

@end
