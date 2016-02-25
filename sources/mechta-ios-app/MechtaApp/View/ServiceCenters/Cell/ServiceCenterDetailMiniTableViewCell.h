//
//  ServiceCenterDetailMiniTableViewCell.h
//  MechtaApp
//
//  Created by Artem Demidovich on 2/25/16.
//  Copyright © 2016 Aphion Software. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ServiceCenterDetailMiniTableViewCell : UITableViewCell


@property (weak, nonatomic) IBOutlet UILabel *serviceCenterDistanceField;
@property (weak, nonatomic) IBOutlet UIImageView *serviceCenterImageView;
@property (weak, nonatomic) IBOutlet UILabel *serviceCenterAddress;
@property (weak, nonatomic) IBOutlet UILabel *serviceCenterWorkhours;

@end
