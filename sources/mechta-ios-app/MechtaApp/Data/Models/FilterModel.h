//
//  FilterModel.h
//  MechtaApp
//
//  Created by Artem Demidovich on 2/12/16.
//  Copyright © 2016 Aphion Software. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FilterOptionModel.h"

@interface FilterModel : NSObject

@property NSString* name;

@property int index;

@property NSMutableArray * options;

@end
