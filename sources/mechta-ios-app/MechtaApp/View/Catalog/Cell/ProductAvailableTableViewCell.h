//
//  ProductAvailableTableViewCell.h
//  MechtaApp
//
//  Created by Artem Demidovich on 2/9/16.
//  Copyright © 2016 Aphion Software. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProductAvailableTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *shopNameField;
@property (weak, nonatomic) IBOutlet UILabel *shopAmountField;

@end
