//
//  DataModelHelper.m
//  MechtaApp
//
//  Created by Artem Demidovich on 2/8/16.
//  Copyright © 2016 Aphion Software. All rights reserved.
//

#import "DataModelHelper.h"

@implementation DataModelHelper


+ (RKObjectMapping*) getObjectMappingForResponseWrapperModelWithDataMapping:(RKObjectMapping*)dataModel {
    RKObjectMapping* wrapperMapping = [RKObjectMapping mappingForClass:[ResponseWrapperModel class]];
    [wrapperMapping addAttributeMappingsFromDictionary:@{
                                                         @"success": @"success",
                                                         @"countOfPages": @"countOfPages",
                                                         @"countOfProducts": @"countOfProducts",
                                                         @"currentPage": @"currentPage",
                                                         @"count": @"count",
                                                         }];
    
    [wrapperMapping addPropertyMapping:[RKRelationshipMapping relationshipMappingFromKeyPath:@"data"
                                                                                  toKeyPath:@"data"
                                                                                withMapping:dataModel]];

    return wrapperMapping;
}



+ (RKResponseDescriptor*) buildResponseDescriptorForCities {
    RKObjectMapping* cityModel = [RKObjectMapping mappingForClass:[CityModel class]];
    [cityModel addAttributeMappingsFromDictionary:@{
                                                          @"id": @"id",
                                                          @"name": @"name",
                                                          }];
    
    RKObjectMapping* wrapperMapping = [DataModelHelper getObjectMappingForResponseWrapperModelWithDataMapping:cityModel];
    
    RKResponseDescriptor *responseWrapperDescriptor = [RKResponseDescriptor responseDescriptorWithMapping:wrapperMapping method:RKRequestMethodAny pathPattern:nil keyPath:@"" statusCodes:RKStatusCodeIndexSetForClass(RKStatusCodeClassSuccessful) ];
    
    return responseWrapperDescriptor;
}


+ (RKResponseDescriptor*) buildResponseDescriptorForCategories {
    RKObjectMapping* categoryModel = [RKObjectMapping mappingForClass:[CategoryModel class]];
    [categoryModel addAttributeMappingsFromDictionary:@{
                                                    @"id": @"id",
                                                    @"name": @"name",
                                                    @"order": @"order",
                                                    @"hasChildren": @"children",
                                                    }];
    
    RKObjectMapping* wrapperMapping = [DataModelHelper getObjectMappingForResponseWrapperModelWithDataMapping:categoryModel];
    
    RKResponseDescriptor *responseWrapperDescriptor = [RKResponseDescriptor responseDescriptorWithMapping:wrapperMapping method:RKRequestMethodAny pathPattern:nil keyPath:@"" statusCodes:RKStatusCodeIndexSetForClass(RKStatusCodeClassSuccessful) ];
    
    return responseWrapperDescriptor;
}


@end
