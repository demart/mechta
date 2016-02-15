//
//  FilterGroupTableViewCell.h
//  MechtaApp
//
//  Created by Artem Demidovich on 2/12/16.
//  Copyright © 2016 Aphion Software. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FilterGroupTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *filterGroupTitle;
@property (weak, nonatomic) IBOutlet UIImageView *filterAppliedImageView;

@end
