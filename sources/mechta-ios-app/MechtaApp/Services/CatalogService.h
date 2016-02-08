//
//  CatalogService.h
//  MechtaApp
//
//  Created by Artem Demidovich on 2/5/16.
//  Copyright © 2016 Aphion Software. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CategoryModel.h"
#import "ResponseWrapperModel.h"
#import "UrlHelper.h"
#import "DataModelHelper.h"

@interface CatalogService : NSObject

+ (NSMutableArray*) getCategoriesWithParent:(NSString*) parentName;


// Загрузить категории
+ (void) retrieveCategoriesWithParentId:(long)parentId onSuccess:(void (^)(ResponseWrapperModel *response))success onFailure:(void (^)(NSError *error))failure;


@end
