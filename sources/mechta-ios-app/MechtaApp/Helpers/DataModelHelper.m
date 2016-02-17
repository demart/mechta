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
    RKObjectMapping* filterOptionModelMapping = [RKObjectMapping mappingForClass:[FilterOptionModel class]];
    [filterOptionModelMapping addAttributeMappingsFromDictionary:@{
                                                                   @"key": @"key",
                                                                   @"value": @"value",
                                                                   }];
    
    
    RKObjectMapping* filterModelMapping = [RKObjectMapping mappingForClass:[FilterModel class]];
    [filterModelMapping addAttributeMappingsFromDictionary:@{
                                                             @"name": @"name",
                                                             @"index": @"index",
                                                             }];
    
    [filterModelMapping addPropertyMapping:[RKRelationshipMapping relationshipMappingFromKeyPath:@"keyValue"
                                                                                       toKeyPath:@"options"
                                                                                     withMapping:filterOptionModelMapping]];
    
    RKObjectMapping* filtersModelMapping = [RKObjectMapping mappingForClass:[FiltersModel class]];
    [filtersModelMapping addAttributeMappingsFromDictionary:@{
                                                              @"costLeft": @"costLeft",
                                                              @"costRight": @"costRight",
                                                              }];
    
    [filtersModelMapping addPropertyMapping:[RKRelationshipMapping relationshipMappingFromKeyPath:@"filters"
                                                                                        toKeyPath:@"filters"
                                                                                      withMapping:filterModelMapping]];
    
    
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

    
    [wrapperMapping addPropertyMapping:[RKRelationshipMapping relationshipMappingFromKeyPath:@"filters"
                                                                                   toKeyPath:@"filters"
                                                                                 withMapping:filtersModelMapping]];
    
    
    return wrapperMapping;
}



+ (RKObjectMapping*) getObjectMappingForProduct {
    RKObjectMapping* productImageMapping = [RKObjectMapping mappingForClass:[ProductImageModel class]];
    [productImageMapping addAttributeMappingsFromDictionary:@{
                                                                       @"url": @"url",
                                                                       }];
    
    RKObjectMapping* productCharacteristicMapping = [RKObjectMapping mappingForClass:[ProductCharacteristicModel class]];
    [productCharacteristicMapping addAttributeMappingsFromDictionary:@{
                                                                            @"key": @"key",
                                                                            @"value": @"value",
                                                                            }];
    
    RKObjectMapping* productCharacteristicGroupMapping = [RKObjectMapping mappingForClass:[ProductCharacteristicGroupModel class]];
    [productCharacteristicGroupMapping addAttributeMappingsFromDictionary:@{
                                                                        @"name": @"name",
                                                                        }];
    [productCharacteristicGroupMapping addPropertyMapping:[RKRelationshipMapping relationshipMappingFromKeyPath:@"keyValue" toKeyPath:@"characteristics"  withMapping:productCharacteristicMapping]];
    
    
    RKObjectMapping* shopModel = [RKObjectMapping mappingForClass:[ShopModel class]];
    [shopModel addAttributeMappingsFromDictionary:@{
                                                                        @"id": @"id",
                                                                        @"name": @"name",
                                                                        @"latitude": @"latitude",
                                                                        @"longitude": @"longitude",
                                                                        @"schedule": @"workhours",
                                                                        @"telephones": @"telephones",
                                                                        }];
    
    RKObjectMapping* productAvailableInShopMapping = [RKObjectMapping mappingForClass:[ProductAvailableInShopModel class]];
    [productAvailableInShopMapping addAttributeMappingsFromDictionary:@{
                                                         @"name": @"name",
                                                         @"count": @"amount",
                                                         }];
    
    [productAvailableInShopMapping addPropertyMapping:[RKRelationshipMapping relationshipMappingFromKeyPath:@"store" toKeyPath:@"shop"  withMapping:shopModel]];
    
    
    RKObjectMapping* productMapping = [RKObjectMapping mappingForClass:[ProductModel class]];
    [productMapping addAttributeMappingsFromDictionary:@{
                                                         //@"id": @"id",
                                                         @"numberOnSite": @"numberOnSite",
                                                         @"name": @"name",
                                                         @"imageUrl": @"imageUrl",
                                                         @"description": @"content",
                                                         @"cost": @"cost",
                                                         @"previousCost": @"previousCost",
                                                         @"numberOnSiteCategory": @"numberOnSiteCategory"
                                                         }];
    
    [productMapping addPropertyMapping:[RKRelationshipMapping relationshipMappingFromKeyPath:@"productAvailability" toKeyPath:@"productAvailability"  withMapping:productAvailableInShopMapping]];
    
    [productMapping addPropertyMapping:[RKRelationshipMapping relationshipMappingFromKeyPath:@"characteristics" toKeyPath:@"characteristics"  withMapping:productCharacteristicGroupMapping]];
    
    [productMapping addPropertyMapping:[RKRelationshipMapping relationshipMappingFromKeyPath:@"images" toKeyPath:@"images"  withMapping:productImageMapping]];
    
    return productMapping;
}




+ (RKResponseDescriptor*) buildResponseDescriptorForCities {
    RKObjectMapping* shopModel = [RKObjectMapping mappingForClass:[ShopModel class]];
    [shopModel addAttributeMappingsFromDictionary:@{
                                                    @"id": @"id",
                                                    @"name": @"name",
                                                    @"latitude": @"latitude",
                                                    @"longitude": @"longitude",
                                                    @"schedule": @"workhours",
                                                    @"telephones": @"telephones",
                                                    }];
    
    RKObjectMapping* cityModel = [RKObjectMapping mappingForClass:[CityModel class]];
    [cityModel addAttributeMappingsFromDictionary:@{
                                                          @"id": @"id",
                                                          @"name": @"name",
                                                          @"latitude": @"latitude",
                                                          @"longitude": @"longitude",
                                                          }];
    [cityModel addPropertyMapping:[RKRelationshipMapping relationshipMappingFromKeyPath:@"stores" toKeyPath:@"shops"  withMapping:shopModel]];
    
    RKObjectMapping* wrapperMapping = [DataModelHelper getObjectMappingForResponseWrapperModelWithDataMapping:cityModel];
    
    RKResponseDescriptor *responseWrapperDescriptor = [RKResponseDescriptor responseDescriptorWithMapping:wrapperMapping method:RKRequestMethodAny pathPattern:nil keyPath:@"" statusCodes:RKStatusCodeIndexSetForClass(RKStatusCodeClassSuccessful) ];
    
    return responseWrapperDescriptor;
}


+ (RKResponseDescriptor*) buildResponseDescriptorForCategories {
    RKObjectMapping* categoryModel = [RKObjectMapping mappingForClass:[CategoryModel class]];
    [categoryModel addAttributeMappingsFromDictionary:@{
                                                    @"id": @"id",
                                                    @"numberOnSite": @"numberOnSite",
                                                    @"name": @"name",
                                                    @"order": @"order",
                                                    @"hasChildren": @"hasChildren",
                                                    @"imageUrl": @"imageUrl",
                                                    }];
    
    RKObjectMapping* wrapperMapping = [DataModelHelper getObjectMappingForResponseWrapperModelWithDataMapping:categoryModel];
    
    RKResponseDescriptor *responseWrapperDescriptor = [RKResponseDescriptor responseDescriptorWithMapping:wrapperMapping method:RKRequestMethodAny pathPattern:nil keyPath:@"" statusCodes:RKStatusCodeIndexSetForClass(RKStatusCodeClassSuccessful) ];
    
    return responseWrapperDescriptor;
}


+ (RKResponseDescriptor*) buildResponseDescriptorForProducts {
    RKObjectMapping* productMapping = [DataModelHelper getObjectMappingForProduct];
    
    RKObjectMapping* wrapperMapping = [DataModelHelper getObjectMappingForResponseWrapperModelWithDataMapping:productMapping];
    
    RKResponseDescriptor *responseWrapperDescriptor = [RKResponseDescriptor responseDescriptorWithMapping:wrapperMapping method:RKRequestMethodAny pathPattern:nil keyPath:@"" statusCodes:RKStatusCodeIndexSetForClass(RKStatusCodeClassSuccessful) ];
    
    return responseWrapperDescriptor;
}

+ (RKResponseDescriptor*) buildResponseDescriptorForProductDetail {
    RKObjectMapping* productMapping = [DataModelHelper getObjectMappingForProduct];
    
    RKObjectMapping* wrapperMapping = [DataModelHelper getObjectMappingForResponseWrapperModelWithDataMapping:productMapping];
    
    RKResponseDescriptor *responseWrapperDescriptor = [RKResponseDescriptor responseDescriptorWithMapping:wrapperMapping method:RKRequestMethodAny pathPattern:nil keyPath:@"" statusCodes:RKStatusCodeIndexSetForClass(RKStatusCodeClassSuccessful) ];
    
    return responseWrapperDescriptor;
}

+ (RKResponseDescriptor*) buildResponseDescriptorForCityShops {
    return [DataModelHelper buildResponseDescriptorForCities];
}


+ (RKResponseDescriptor*) buildResponseDescriptorForSearch {
    RKObjectMapping* searchObjectModel = [RKObjectMapping mappingForClass:[SearchObjectModel class]];
    [searchObjectModel addAttributeMappingsFromDictionary:@{
                                                        @"numberOnSite": @"numberOnSite",
                                                        @"name": @"name",
                                                        @"imageUrl": @"imageUrl",
                                                        @"numberOnSiteCategory": @"numberOnSiteCategory",
                                                        @"description": @"content",
                                                        @"date": @"date",
                                                        }];
    
    RKObjectMapping* wrapperMapping = [DataModelHelper getObjectMappingForResponseWrapperModelWithDataMapping:searchObjectModel];
    
    RKResponseDescriptor *responseWrapperDescriptor = [RKResponseDescriptor responseDescriptorWithMapping:wrapperMapping method:RKRequestMethodAny pathPattern:nil keyPath:@"" statusCodes:RKStatusCodeIndexSetForClass(RKStatusCodeClassSuccessful) ];
    
    return responseWrapperDescriptor;
}


@end
