//
//  ShopModel.h
//  MechtaApp
//
//  Created by Artem Demidovich on 2/5/16.
//  Copyright © 2016 Aphion Software. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CityModel.h"

@interface ShopModel : NSObject

@property int id;

@property NSString* name;

@property NSString* workhours;

@property double latitude;

@property double longitude;

/* Вычисляемое на основе месположения пользователя */
@property double distance;

@property NSString* telephones;

@property CityModel *city;

@end