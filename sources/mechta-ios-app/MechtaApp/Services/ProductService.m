//
//  ProductService.m
//  MechtaApp
//
//  Created by Artem Demidovich on 2/5/16.
//  Copyright © 2016 Aphion Software. All rights reserved.
//

#import "ProductService.h"

@implementation ProductService

+ (NSMutableArray*) getProductsFromCategory:(long)categoryId fromPage:(long)page inCity:(long)cityId {
    NSMutableArray *prodcuts = [[NSMutableArray alloc] init];
    
    [prodcuts addObject:[ProductService createTempProductWithName:@"Пылесос SAMSUNG VC 19F50 VNCY" andPrice:56990]];
    [prodcuts addObject:[ProductService createTempProductWithName:@"Газовая плита DE LUXE 5040.36 Г (кр)" andPrice:53800]];
    [prodcuts addObject:[ProductService createTempProductWithName:@"Утюг PHILIPS GC 4926/00" andPrice:57990]];
    [prodcuts addObject:[ProductService createTempProductWithName:@"Микроволновая печь LG MG 6343 BMR" andPrice:57990]];
    [prodcuts addObject:[ProductService createTempProductWithName:@"Пылесос LG V K8810HUMR" andPrice:44990]];
    [prodcuts addObject:[ProductService createTempProductWithName:@"Микроволновая печь GORENJE MO 4250 CLI" andPrice:58690]];
    [prodcuts addObject:[ProductService createTempProductWithName:@"Швейная машина TOYOTA SUPER J 15" andPrice:59890]];
    
    return prodcuts;
}


+ (ProductModel*) createTempProductWithName:(NSString*)name andPrice:(long) price {
    ProductModel *model = [[ProductModel alloc] init];
    model.id = 0;
    model.name = name;
    model.price = price;
    model.picture = @"";
    model.availableInShop = nil;
    model.content = @"test description";
    
    return model;
}

@end
