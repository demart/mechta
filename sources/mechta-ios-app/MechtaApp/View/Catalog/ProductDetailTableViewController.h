//
//  ProductDetailTableViewController.h
//  MechtaApp
//
//  Created by Artem Demidovich on 2/5/16.
//  Copyright © 2016 Aphion Software. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ProductModel.h"

@interface ProductDetailTableViewController : UITableViewController

- (void) setProductModel:(ProductModel*)model;

@end
