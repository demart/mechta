//
//  ProductService.m
//  MechtaApp
//
//  Created by Artem Demidovich on 2/5/16.
//  Copyright © 2016 Aphion Software. All rights reserved.
//

#import "ProductService.h"

@implementation ProductService

+ (void) retrieveProductsWithCategoryId:(long)parentId withPage:(long)page inCityId:(long)cityId onSuccess:(void (^)(ResponseWrapperModel *response))success onFailure:(void (^)(NSError *error))failure {
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:[[NSURL alloc] initWithString:[UrlHelper productsUrlWithCategoryId:parentId withPage:page inCityId:cityId]] ];
    
    RKResponseDescriptor *responseWrapperDescriptor = [DataModelHelper buildResponseDescriptorForProducts];
    
    RKObjectRequestOperation *objectRequestOperation = [[RKObjectRequestOperation alloc] initWithRequest:request responseDescriptors:@[ responseWrapperDescriptor ]];
    [objectRequestOperation setCompletionBlockWithSuccess:^(RKObjectRequestOperation *operation, RKMappingResult *mappingResult) {
        ResponseWrapperModel *response = (ResponseWrapperModel*)[mappingResult.array objectAtIndex:0];
        
        NSLog(@"Success: %i", response.success);
        NSLog(@"Data: %@", response.data);
        NSLog(@"Count: %i", response.count);
        NSLog(@"CountOfPages: %i", response.countOfPages);
        NSLog(@"CountOfProducts: %i", response.countOfProducts);
        
        success(response);
        
    } failure:^(RKObjectRequestOperation *operation, NSError *error) {
        NSLog(@"Operation failed with error: %@", error);
        failure(error);
    }];
    
    [objectRequestOperation start];

}

@end
