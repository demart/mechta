//
//  CatalogService.h
//  MechtaApp
//
//  Created by Artem Demidovich on 2/5/16.
//  Copyright © 2016 Aphion Software. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CategoryModel.h"

@interface CatalogService : NSObject

+ (NSMutableArray*) getCategoriesWithParent:(NSString*) parentName;

@end
