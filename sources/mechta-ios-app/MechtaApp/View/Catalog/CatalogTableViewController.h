//
//  CatalogTableViewController.h
//  MechtaApp
//
//  Created by Artem Demidovich on 2/5/16.
//  Copyright © 2016 Aphion Software. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SearchTableViewController.h"

@interface CatalogTableViewController : SearchTableViewController

@property (weak, nonatomic) IBOutlet UIBarButtonItem *cityChoiceButton;

- (IBAction)cityChoiceButtonAction:(UIBarButtonItem *)sender;

@end
