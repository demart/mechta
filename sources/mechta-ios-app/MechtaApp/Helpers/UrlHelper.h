//
//  UrlHelper.h
//  MechtaApp
//
//  Created by Artem Demidovich on 2/8/16.
//  Copyright © 2016 Aphion Software. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UrlHelper : NSObject

+ (NSString*) aphionUrl;

+ (NSString*) baseUrl;

+ (NSString*) citiesUrl;

+ (NSString*) cityShopsUrl;

+ (NSString*) categoriesUrlWithParentId:(long) parentId;

+ (NSString*) productsUrlWithCategoryId:(long) parentId withPage:(long)page inCityId:(long) cityId;

+ (NSString*) productDetailUrlWithId:(long)productId withCategoryId:(long)categoryId inCityId:(long)cityId;

+ (NSString*) searchUrlWithText:(NSString*)text withPage:(long)page inCity:(long)cityId;

+ (NSString *)urlEncode:(NSString*)input;

@end
