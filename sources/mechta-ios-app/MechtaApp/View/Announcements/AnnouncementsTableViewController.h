//
//  AnnouncementsTableViewController.h
//  MechtaApp
//
//  Created by Artem Demidovich on 2/25/16.
//  Copyright © 2016 Aphion Software. All rights reserved.
//

#import <UIKit/UIKit.h>


static int ANNOUNCEMENT_MODE_NEWS = 0;
static int ANNOUNCEMENT_MODE_ACTIONS = 1;


@interface AnnouncementsTableViewController : UITableViewController
@property (weak, nonatomic) IBOutlet UINavigationItem *announcementTitle;

- (void) setAnnouncementMode:(int)mode;


@end
