//
//  SearchProductTableViewCell.h
//  MechtaApp
//
//  Created by Artem Demidovich on 2/17/16.
//  Copyright © 2016 Aphion Software. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SearchProductTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *productImageView;
@property (weak, nonatomic) IBOutlet UILabel *productName;
@property (weak, nonatomic) IBOutlet UILabel *productDescription;
@property (weak, nonatomic) IBOutlet UILabel *productUpdatedDate;

@end
