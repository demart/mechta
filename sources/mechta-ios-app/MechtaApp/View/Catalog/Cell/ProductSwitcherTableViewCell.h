//
//  ProductSwitcherTableViewCell.h
//  MechtaApp
//
//  Created by Artem Demidovich on 2/9/16.
//  Copyright © 2016 Aphion Software. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProductSwitcherTableViewCell : UITableViewCell
- (IBAction)switcherModeChanged:(id)sender;
@property (weak, nonatomic) IBOutlet UISegmentedControl *switcherSegmentControl;

@property UITableViewController *parentController;

@end
