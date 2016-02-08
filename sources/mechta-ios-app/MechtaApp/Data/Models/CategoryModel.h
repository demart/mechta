//
//  CategoryModel.h
//  MechtaApp
//
//  Created by Artem Demidovich on 2/5/16.
//  Copyright © 2016 Aphion Software. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CategoryModel : NSObject

@property int id;

@property NSString* name;

@property int order;

@property BOOL hasChildren;

@property NSMutableArray *children;

@property CategoryModel *parent;

@end
