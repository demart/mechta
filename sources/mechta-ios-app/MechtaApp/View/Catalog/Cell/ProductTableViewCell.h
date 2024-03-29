//
//  ProductTableViewCell.h
//  MechtaApp
//
//  Created by Artem Demidovich on 2/5/16.
//  Copyright © 2016 Aphion Software. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProductTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *productImageView;
@property (weak, nonatomic) IBOutlet UILabel *productNameField;
@property (weak, nonatomic) IBOutlet UILabel *productPriceField;
@property (weak, nonatomic) IBOutlet UILabel *productDescriptionField;

-(void) setFormattedPrice:(NSString *)formattedPrice;
-(void) setPrice:(long)productPrice;
-(void) setUnavailable;

@end
