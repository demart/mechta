//
//  CatalogTableViewController.h
//  MechtaApp
//
//  Created by Artem Demidovich on 2/5/16.
//  Copyright © 2016 Aphion Software. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CatalogTableViewController : UITableViewController

@property (weak, nonatomic) IBOutlet UIBarButtonItem *cityChoiceButton;

- (IBAction)cityChoiceButtonAction:(UIBarButtonItem *)sender;

@end
