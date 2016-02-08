//
//  CatalogTableViewCell.h
//  MechtaApp
//
//  Created by Artem Demidovich on 2/5/16.
//  Copyright © 2016 Aphion Software. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CatalogTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *catalogNameField;

@property (weak, nonatomic) IBOutlet UIImageView *categoryImageView;

@end
