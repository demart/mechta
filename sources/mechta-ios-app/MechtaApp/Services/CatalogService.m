//
//  CatalogService.m
//  MechtaApp
//
//  Created by Artem Demidovich on 2/5/16.
//  Copyright © 2016 Aphion Software. All rights reserved.
//

#import "CatalogService.h"

@implementation CatalogService

static NSMutableDictionary *categories = nil;

+ (NSMutableDictionary*) getCategoriesDictionary {
    if (categories == nil)
        categories = [[NSMutableDictionary alloc] init];
    return categories;
}

+ (NSMutableArray*) getCategoriesByParentId:(long) parentId {
    NSMutableArray *categories = [[CatalogService getCategoriesDictionary] valueForKey:[[NSString alloc] initWithFormat:@"C_%li", parentId]];
    return categories;
}

+ (void) addCategories:(NSMutableArray*)categories withParentId:(long) parentId {
    [[CatalogService getCategoriesDictionary] setValue:categories forKey:[[NSString alloc] initWithFormat:@"C_%li", parentId]];
}

+ (NSMutableArray*) getCategoriesWithParent:(NSString*) parentName {
    
    NSMutableArray *catalog = [[NSMutableArray alloc] init];
    
    if (parentName == nil) {
        [catalog addObject:[CatalogService createCategoryWithName:@"Бытовая техника" withHasChildren:YES] ];
        [catalog addObject:[CatalogService createCategoryWithName:@"Климат техника" withHasChildren:YES] ];
        [catalog addObject:[CatalogService createCategoryWithName:@"Планшеты, Ноутбуки, Комьютеры" withHasChildren:YES] ];
        [catalog addObject:[CatalogService createCategoryWithName:@"Телевизоры, Аудио, Видео" withHasChildren:YES] ];
        [catalog addObject:[CatalogService createCategoryWithName:@"Телефоны" withHasChildren:YES] ];
        [catalog addObject:[CatalogService createCategoryWithName:@"Фото, Видеокамеры, Оптика" withHasChildren:YES] ];
        [catalog addObject:[CatalogService createCategoryWithName:@"Игры, Приставки, Игрушки" withHasChildren:YES] ];
        [catalog addObject:[CatalogService createCategoryWithName:@"Красота и здоровье" withHasChildren:YES] ];
        [catalog addObject:[CatalogService createCategoryWithName:@"Автоаксессуары" withHasChildren:YES] ];
        [catalog addObject:[CatalogService createCategoryWithName:@"Активный отдых" withHasChildren:YES] ];
    }
    
    if ([parentName isEqualToString:@"Бытовая техника"]) {
        [catalog addObject:[CatalogService createCategoryWithName:@"Техника для дома" withHasChildren:NO] ];
        [catalog addObject:[CatalogService createCategoryWithName:@"Кухонная техника" withHasChildren:NO] ];
        [catalog addObject:[CatalogService createCategoryWithName:@"Встраиваемая техника" withHasChildren:NO] ];
        [catalog addObject:[CatalogService createCategoryWithName:@"Посуда" withHasChildren:NO] ];
    }
    
    if ([parentName isEqualToString:@"Планшеты, Ноутбуки, Комьютеры"]) {
        [catalog addObject:[CatalogService createCategoryWithName:@"Планшеты" withHasChildren:NO] ];
        [catalog addObject:[CatalogService createCategoryWithName:@"Ноутбуки" withHasChildren:NO] ];
        [catalog addObject:[CatalogService createCategoryWithName:@"Планшетные компьютеры" withHasChildren:NO] ];
        [catalog addObject:[CatalogService createCategoryWithName:@"Персональные компьютеры" withHasChildren:NO] ];
        [catalog addObject:[CatalogService createCategoryWithName:@"Периферия" withHasChildren:NO] ];
        [catalog addObject:[CatalogService createCategoryWithName:@"Электронные книги" withHasChildren:NO] ];
        [catalog addObject:[CatalogService createCategoryWithName:@"Компьютерные аксессуары" withHasChildren:NO] ];
    }
    
    if ([parentName isEqualToString:@"Климат техника"]) {
        [catalog addObject:[CatalogService createCategoryWithName:@"Кондиционеры" withHasChildren:NO] ];
        [catalog addObject:[CatalogService createCategoryWithName:@"Обогреватели" withHasChildren:NO] ];
        [catalog addObject:[CatalogService createCategoryWithName:@"Кулеры" withHasChildren:NO] ];
        [catalog addObject:[CatalogService createCategoryWithName:@"Электронагреватели" withHasChildren:NO] ];
        [catalog addObject:[CatalogService createCategoryWithName:@"Аксессуары для кондиционеров" withHasChildren:NO] ];
        [catalog addObject:[CatalogService createCategoryWithName:@"Увлажнители, осушители, воздухоочистители" withHasChildren:NO] ];
        [catalog addObject:[CatalogService createCategoryWithName:@"Сушилка для рук/обуви" withHasChildren:NO] ];
        [catalog addObject:[CatalogService createCategoryWithName:@"Вентиляторы" withHasChildren:NO] ];
        [catalog addObject:[CatalogService createCategoryWithName:@"Погодные измерительные приборы" withHasChildren:NO] ];
        [catalog addObject:[CatalogService createCategoryWithName:@"Водонагреватели" withHasChildren:NO] ];
    }
    
    if ([catalog count] == 0) {
        [catalog addObject:[CatalogService createCategoryWithName:@"Телевизоры" withHasChildren:NO] ];
        [catalog addObject:[CatalogService createCategoryWithName:@"Тумбы и кронштейны" withHasChildren:NO] ];
        [catalog addObject:[CatalogService createCategoryWithName:@"Аксессуары к ТВ" withHasChildren:NO] ];
        [catalog addObject:[CatalogService createCategoryWithName:@"Аудио, Видео" withHasChildren:NO] ];
    }
    
    return catalog;
}

+ (CategoryModel*) createCategoryWithName:(NSString*)name withHasChildren:(BOOL)hasChildren {
    CategoryModel *model = [[CategoryModel alloc] init];
    model.name = name;
    model.hasChildren = hasChildren;
    
    return model;
}


// Загрузить категории
+ (void) retrieveCategoriesWithParentId:(long)parentId onSuccess:(void (^)(ResponseWrapperModel *response))success onFailure:(void (^)(NSError *error))failure {
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:[[NSURL alloc] initWithString:[UrlHelper categoriesUrlWithParentId:parentId]] ];
    
    RKResponseDescriptor *responseWrapperDescriptor = [DataModelHelper buildResponseDescriptorForCategories];
    
    RKObjectRequestOperation *objectRequestOperation = [[RKObjectRequestOperation alloc] initWithRequest:request responseDescriptors:@[ responseWrapperDescriptor ]];
    [objectRequestOperation setCompletionBlockWithSuccess:^(RKObjectRequestOperation *operation, RKMappingResult *mappingResult) {
        ResponseWrapperModel *response = (ResponseWrapperModel*)[mappingResult.array objectAtIndex:0];
        
        NSLog(@"Success: %i", response.success);
        NSLog(@"Data: %@", response.data);
        NSLog(@"Count: %i", response.count);
        NSLog(@"CountOfPages: %i", response.countOfPages);
        NSLog(@"CountOfProducts: %i", response.countOfProducts);
        
        if (response.success){
            [CatalogService addCategories:(NSMutableArray*)response.data withParentId:parentId];
        }
        
        success(response);
        
    } failure:^(RKObjectRequestOperation *operation, NSError *error) {
        NSLog(@"Operation failed with error: %@", error);
        failure(error);
    }];
    
    [objectRequestOperation start];
    
}



@end
