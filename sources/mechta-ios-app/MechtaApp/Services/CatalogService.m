//
//  CatalogService.m
//  MechtaApp
//
//  Created by Artem Demidovich on 2/5/16.
//  Copyright © 2016 Aphion Software. All rights reserved.
//

#import "CatalogService.h"

@implementation CatalogService

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


@end
