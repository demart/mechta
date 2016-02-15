//
//  ProductCharacteristicTableViewCell.h
//  MechtaApp
//
//  Created by Artem Demidovich on 2/9/16.
//  Copyright © 2016 Aphion Software. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProductCharacteristicTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *characteristicKeyField;
@property (weak, nonatomic) IBOutlet UILabel *characteristicValueField;

@end
