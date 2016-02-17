//
//  DataModelHelper.h
//  MechtaApp
//
//  Created by Artem Demidovich on 2/8/16.
//  Copyright © 2016 Aphion Software. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ResponseWrapperModel.h"
#import "CityModel.h"
#import "CategoryModel.h"
#import "ProductModel.h"
#import "SearchObjectModel.h"

#import "RKObjectManager.h"
#import "RKObjectMapping.h"
#import "RKResponseDescriptor.h"
#import "RKObjectRequestOperation.h"
#import "RKRelationshipMapping.h"
#import "RKRequestDescriptor.h"
#import "RKLog.h"
#import "RKMIMETypes.h"


@interface DataModelHelper : NSObject

+ (RKResponseDescriptor*) buildResponseDescriptorForCities;

+ (RKResponseDescriptor*) buildResponseDescriptorForCityShops;

+ (RKResponseDescriptor*) buildResponseDescriptorForCategories;

+ (RKResponseDescriptor*) buildResponseDescriptorForProducts;

+ (RKResponseDescriptor*) buildResponseDescriptorForProductDetail;

+ (RKResponseDescriptor*) buildResponseDescriptorForSearch;

@end