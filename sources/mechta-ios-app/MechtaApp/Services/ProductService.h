//
//  ProductService.h
//  MechtaApp
//
//  Created by Artem Demidovich on 2/5/16.
//  Copyright © 2016 Aphion Software. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ProductModel.h"
#import "ResponseWrapperModel.h"
#import "UrlHelper.h"
#import "DataModelHelper.h"

@interface ProductService : NSObject

+ (void) retrieveProductsWithCategoryId:(long)parentId withPage:(long)page inCityId:(long)cityId onSuccess:(void (^)(ResponseWrapperModel *response))success onFailure:(void (^)(NSError *error))failure;

+ (void) retrieveProductDetailWithId:(long)productId inCategory:(long)categoryId inCityId:(long)cityId onSuccess:(void (^)(ResponseWrapperModel *response))success onFailure:(void (^)(NSError *error))failure;

+ (ProductModel*) mockProduct;

@end
