//
//  ShopDetailTableViewController.h
//  MechtaApp
//
//  Created by Artem Demidovich on 2/10/16.
//  Copyright © 2016 Aphion Software. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ShopModel.h"

@interface ShopDetailTableViewController : UITableViewController

-(void) setSelectedShopModel:(ShopModel*) model;

@end
