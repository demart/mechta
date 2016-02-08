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

+ (NSString*) categoriesUrlWithParentId:(long) parentId;

@end