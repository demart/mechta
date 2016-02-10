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

@property float latitude;

@property float longitude;

@property NSString* telephones;

@property CityModel *city;

@end