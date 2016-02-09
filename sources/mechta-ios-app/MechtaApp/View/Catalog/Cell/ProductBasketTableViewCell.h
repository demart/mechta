//
//  ProductBasketTableViewCell.h
//  MechtaApp
//
//  Created by Artem Demidovich on 2/9/16.
//  Copyright © 2016 Aphion Software. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProductBasketTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *productNameField;

@property (weak, nonatomic) IBOutlet UILabel *productPriceField;

@property (weak, nonatomic) IBOutlet UIButton *addProductButton;

@end
