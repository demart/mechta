//
//  CityService.h
//  MechtaApp
//
//  Created by Artem Demidovich on 2/5/16.
//  Copyright © 2016 Aphion Software. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ResponseWrapperModel.h"
#import "CityModel.h"

@interface CityService : NSObject

// Выбрать город
+ (void) selectCityModel:(CityModel*)model;

// Возвращает выбранный город
+ (CityModel*) getSelectedCityModel;

// Возвращает загруженные города
+ (NSMutableArray*) getCities;

// Возвращает загруженные города и магазины
+ (NSMutableArray*) getCityShops;

// Загружает города с сайта
+ (void) retrieveCities:(void (^)(ResponseWrapperModel *response))success onFailure:(void (^)(NSError *error))failure;

// загрузить магазины города
+ (void) retrieveCityShops:(void (^)(ResponseWrapperModel *response))success onFailure:(void (^)(NSError *error))failure;

@end
