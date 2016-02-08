//
//  CityService.h
//  MechtaApp
//
//  Created by Artem Demidovich on 2/5/16.
//  Copyright © 2016 Aphion Software. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CityModel.h"

@interface CityService : NSObject

+ (NSString*) getSelectedCity;

+ (void) selectCityWithName:(NSString*) cityName;

+ (NSMutableArray*) getCities;


@end
