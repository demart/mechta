//
//  ShopDetailMiniTableViewCell.h
//  MechtaApp
//
//  Created by Artem Demidovich on 2/11/16.
//  Copyright © 2016 Aphion Software. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShopDetailMiniTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *shopDistanceField;
@property (weak, nonatomic) IBOutlet UIImageView *shopImageView;
@property (weak, nonatomic) IBOutlet UILabel *shopAddress;
@property (weak, nonatomic) IBOutlet UILabel *shopWorkhours;
@end
