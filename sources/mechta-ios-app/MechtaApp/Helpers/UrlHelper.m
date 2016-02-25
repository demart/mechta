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
    //return @"http://localhost:9000/rest";
    return @"http://54.201.103.165:8081/rest";
    
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

+ (NSString*) cityShopsUrl {
    return [[NSString alloc] initWithFormat:@"%@/stores", UrlHelper.baseUrl];
}

+ (NSString*) cityServiceCentersUrl {
    return [[NSString alloc] initWithFormat:@"%@/service/stores", UrlHelper.baseUrl];
}

+ (NSString*) announcementsUrlWithType:(long) type andPage:(long)page inCityId:(long)cityId {
    return [[NSString alloc] initWithFormat:@"%@/news?cityId=%li&type=%li&page=%li", UrlHelper.baseUrl, cityId, type, page];
}

+(NSString*) categoriesUrlWithParentId:(long) parentId {
    if (parentId < 1) {
        return [[NSString alloc] initWithFormat:@"%@/categories", UrlHelper.baseUrl];
    } else {
        return [[NSString alloc] initWithFormat:@"%@/categories?parentId=%li", UrlHelper.baseUrl, parentId];
    }
}

+ (NSString*) productsUrlWithCategoryId:(long) categoryId withPage:(long)page inCityId:(long) cityId {
    return [[NSString alloc] initWithFormat:@"%@/products?numberOnSiteCategory=%li&page=%li&cityId=%li", UrlHelper.baseUrl, categoryId, page, cityId];
}


+ (NSString*) productDetailUrlWithId:(long)productId withCategoryId:(long)categoryId inCityId:(long)cityId {
    return [[NSString alloc] initWithFormat:@"%@/product/information?numberOnSiteCategory=%li&cityId=%li&numberOnSite=%li", UrlHelper.baseUrl, categoryId, cityId, productId];
}

// search/product?cityId=1&text=холодильник
+ (NSString*) searchUrlWithText:(NSString*)text withPage:(long)page inCity:(long)cityId {
    NSString *encodedString = [UrlHelper urlEncode:text];
    return [[NSString alloc] initWithFormat:@"%@/search/product?cityId=%li&page=%li&text=%@", UrlHelper.baseUrl, cityId, page, encodedString];
}

+ (NSString *)urlEncode:(NSString*)input {
    NSMutableString *output = [NSMutableString string];
    const unsigned char *source = (const unsigned char *)[input UTF8String];
    int sourceLen = strlen((const char *)source);
    for (int i = 0; i < sourceLen; ++i) {
        const unsigned char thisChar = source[i];
        if (thisChar == ' '){
            [output appendString:@"+"];
        } else if (thisChar == '.' || thisChar == '-' || thisChar == '_' || thisChar == '~' ||
                   (thisChar >= 'a' && thisChar <= 'z') ||
                   (thisChar >= 'A' && thisChar <= 'Z') ||
                   (thisChar >= '0' && thisChar <= '9')) {
            [output appendFormat:@"%c", thisChar];
        } else {
            [output appendFormat:@"%%%02X", thisChar];
        }
    }
    return output;
}

@end
