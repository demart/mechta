//
//  ServiceCenterDetailTableViewController.h
//  MechtaApp
//
//  Created by Artem Demidovich on 2/25/16.
//  Copyright © 2016 Aphion Software. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ServiceCenterModel.h"

@interface ServiceCenterDetailTableViewController : UITableViewController

-(void) setSelectedServiceCetnerModel:(ServiceCenterModel*) model;

@end
