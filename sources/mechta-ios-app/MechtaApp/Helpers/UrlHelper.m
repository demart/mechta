//
//  UrlHelper.m
//  MechtaApp
//
//  Created by Artem Demidovich on 2/8/16.
//  Copyright © 2016 Aphion Software. All rights reserved.
//

#import "UrlHelper.h"

@implementation UrlHelper

+ (NSString*) aphionUrl {
    return @"http://aphion.kz?source=mecha-app";
}


+(NSString*) baseUrl {
#if DEBUG
    return @"http://localhost:9000/rest";
    //return @"http://ec2-54-69-182-222.us-west-2.compute.amazonaws.com:8080";
    //    return @"http://localhost:9000";
    //return @"http://aphion.kz/mechta/rest";
    //return @"http://192.168.1.106:9000";
    //return @"http://192.168.0.94:8080";
    //return @"http://api.sushimi.kz/rest-api";
#else
    return @"http://localhost:9000/rest";
    //return @"http://aphion.kz/mechta/rest";
    //return @"http://ec2-54-69-182-222.us-west-2.compute.amazonaws.com:8080";
    //return @"http://172.20.10.2";
#endif
}


+(NSString*) citiesUrl {
    return [[NSString alloc] initWithFormat:@"%@/cities", UrlHelper.baseUrl];
}


+(NSString*) categoriesUrlWithParentId:(long) parentId {
    if (parentId < 1) {
        return [[NSString alloc] initWithFormat:@"%@/categories", UrlHelper.baseUrl];
    } else {
        return [[NSString alloc] initWithFormat:@"%@/categories?parentId=%li", UrlHelper.baseUrl, parentId];
    }
}




@end
