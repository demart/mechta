//
//  CategoryModel.h
//  MechtaApp
//
//  Created by Artem Demidovich on 2/5/16.
//  Copyright © 2016 Aphion Software. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CategoryModel : NSObject

@property long id;

@property long numberOnSite;

@property NSString* name;

@property int order;

@property BOOL hasChildren;

@property NSString* imageUrl;

@end
