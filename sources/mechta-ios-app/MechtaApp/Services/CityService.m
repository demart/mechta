//
//  CityService.m
//  MechtaApp
//
//  Created by Artem Demidovich on 2/5/16.
//  Copyright © 2016 Aphion Software. All rights reserved.
//

#import "CityService.h"


@implementation CityService

static NSString* city;

+ (NSString*) getSelectedCity {
    if (city == nil)
        return [CityService getCities][0];
    return city;
}

+ (void) selectCityWithName:(NSString*) cityName {
    city = cityName;
}

+ (NSMutableArray*) getCities {
    NSMutableArray *cities = [[NSMutableArray alloc] init];
    [cities addObject:@"Астана"];
    [cities addObject:@"Алматы"];
    [cities addObject:@"Актау"];
    [cities addObject:@"Караганда"];
    [cities addObject:@"Кокшетау"];
    [cities addObject:@"Костанай"];
    [cities addObject:@"Павлодар"];
    [cities addObject:@"Петропавловск"];
    [cities addObject:@"Семей"];
    [cities addObject:@"Уральск"];
    [cities addObject:@"Усть-Каменогорск"];
    [cities addObject:@"Шымкент"];
    return cities;
}


+ (CityModel*) getCityModelWithName:(NSString*)name {
    CityModel *model = [[CityModel alloc] init];
    model.name = name;
    
    return model;
}


@end
