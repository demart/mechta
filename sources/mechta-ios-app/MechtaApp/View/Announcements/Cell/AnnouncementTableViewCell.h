//
//  AnnouncementTableViewCell.h
//  MechtaApp
//
//  Created by Artem Demidovich on 2/25/16.
//  Copyright © 2016 Aphion Software. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AnnouncementTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *announcementImageView;
@property (weak, nonatomic) IBOutlet UILabel *announcementTitle;
@property (weak, nonatomic) IBOutlet UILabel *announcementDescription;
@property (weak, nonatomic) IBOutlet UILabel *announcementDate;

@end
