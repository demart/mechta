//
//  ProductsTableViewController.h
//  MechtaApp
//
//  Created by Artem Demidovich on 2/5/16.
//  Copyright © 2016 Aphion Software. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SearchTableViewController.h"

@interface ProductsTableViewController : SearchTableViewController

- (void) setProductsCategory:(long)categoryId;
- (IBAction)showFilterAction:(UIBarButtonItem *)sender;

@end
