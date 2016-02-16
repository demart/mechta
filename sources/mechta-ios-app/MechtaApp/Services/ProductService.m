//
//  ProductService.m
//  MechtaApp
//
//  Created by Artem Demidovich on 2/5/16.
//  Copyright © 2016 Aphion Software. All rights reserved.
//

#import "ProductService.h"

@implementation ProductService

+ (void) retrieveProductsWithCategoryId:(long)parentId withPage:(long)page withFilter:(FiltersModel*)filtersModel withFilterCount:(long)filterCount inCityId:(long)cityId onSuccess:(void (^)(ResponseWrapperModel *response))success onFailure:(void (^)(NSError *error))failure {
    
    /*
    ResponseWrapperModel *wrapper = [[ResponseWrapperModel alloc] init];
    NSMutableArray *arr = [[NSMutableArray alloc] init];
    [arr addObject:[ProductService mockProduct]];
    wrapper.success = YES;
    wrapper.data = arr;
    success(wrapper);
    return;
     */
    
    // Long typeOrder, String filter, String costLeft, String costRight, Integer countOfFilters
    
    
    NSMutableURLRequest *request = nil;
    if (filtersModel != nil) {
        int selectedCostLeft = filtersModel.selectedCostLeft == filtersModel.costLeft ? 0 : filtersModel.selectedCostLeft;
        int selectedCostRight = filtersModel.selectedCostRight == filtersModel.costRight ? 0 : filtersModel.selectedCostRight;
        NSString *queryParam = [filtersModel buildFilterOptionsQueryParam];

        NSString *baseUrl = [UrlHelper productsUrlWithCategoryId:parentId withPage:page inCityId:cityId];
        if (queryParam != nil && ![queryParam isEqualToString:@""]){
            baseUrl = [[NSString alloc] initWithFormat:@"%@&filter=%@&countOfFilters=%li", baseUrl, queryParam, filterCount];
        }
        if (selectedCostLeft > 0){
            baseUrl = [[NSString alloc] initWithFormat:@"%@&costLeft=%i", baseUrl, selectedCostLeft];
        }
        if (selectedCostRight > 0){
            baseUrl = [[NSString alloc] initWithFormat:@"%@&costRight=%i", baseUrl, selectedCostRight];
        }
        
        if (filtersModel.sortOrder > 0) {
            baseUrl = [[NSString alloc] initWithFormat:@"%@&typeOrder=%i", baseUrl, filtersModel.sortOrder];
        }
        
        request = [[NSMutableURLRequest alloc] initWithURL:[[NSURL alloc] initWithString: baseUrl]];
    } else {
        request = [[NSMutableURLRequest alloc] initWithURL:[[NSURL alloc] initWithString:[UrlHelper productsUrlWithCategoryId:parentId withPage:page inCityId:cityId]] ];
    }
    
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


+ (void) retrieveProductDetailWithId:(long)productId inCategory:(long)categoryId inCityId:(long)cityId onSuccess:(void (^)(ResponseWrapperModel *response))success onFailure:(void (^)(NSError *error))failure {
    
    /*
    ResponseWrapperModel *wrapper = [[ResponseWrapperModel alloc] init];
    wrapper.success = YES;
    wrapper.data = [ProductService mockProduct];
    success(wrapper);
    return;
    */
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:[[NSURL alloc] initWithString:[UrlHelper productDetailUrlWithId:productId withCategoryId:categoryId inCityId:cityId]] ];
    
    RKResponseDescriptor *responseWrapperDescriptor = [DataModelHelper buildResponseDescriptorForProductDetail];
    
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

+ (ProductModel*) mockProduct {
    ProductModel *model = [[ProductModel alloc] init];
    model.numberOnSite = 10;
    model.numberOnSiteCategory = 10;
    model.cost = 34543;
    model.previousCost = 445443;
    model.name = @"Холодильник PH 293 Холодильник PH 293";
    model.imageUrl = @"http://mechta.kz/images/bla-bla-bla";
    model.content = @"Дохрена всякого описания товара который можно здесь расхвалить, так как сайт мечты вечно не работает Дохрена всякого описания товара который можно здесь расхвалить, так как сайт мечты вечно не работает Дохрена всякого описания товара который можно здесь расхвалить, так как сайт мечты вечно не работает Дохрена всякого описания товара который можно здесь расхвалить, так как сайт мечты вечно не работает";
    
    model.productAvailability = [[NSMutableArray alloc] init];
    ProductAvailableInShopModel *shop = [[ProductAvailableInShopModel alloc] init];
    shop.name = @"ул Аммана 14";
    shop.amount = @"Мало";
    [model.productAvailability addObject:shop];
    
    ProductAvailableInShopModel *shop1 = [[ProductAvailableInShopModel alloc] init];
    shop1.name = @"ул Республика 41";
    shop1.amount = @"1 шт.";
    [model.productAvailability addObject:shop1];
    
    
    ProductCharacteristicGroupModel *group = [[ProductCharacteristicGroupModel alloc] init];
    group.name = @"Размеры";
    group.characteristics = [[NSMutableArray alloc] init];
    
    ProductCharacteristicModel *grModel1 = [[ProductCharacteristicModel alloc] init];
    grModel1.key = @"Ширина";
    grModel1.key = @"23 см";
    [group.characteristics addObject:grModel1];
    
    ProductCharacteristicModel *grModel2 = [[ProductCharacteristicModel alloc] init];
    grModel2.key = @"Высота";
    grModel2.key = @"1223 см";
    [group.characteristics addObject:grModel2];
    
    model.characteristics = [[NSMutableArray alloc] init];
    [model.characteristics addObject:group];
    [model.characteristics addObject:group];
    
    return model;
}


@end
