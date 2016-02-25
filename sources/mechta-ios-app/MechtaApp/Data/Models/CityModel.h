//
//  CityModel.h
//  MechtaApp
//
//  Created by Artem Demidovich on 2/5/16.
//  Copyright © 2016 Aphion Software. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CityModel : NSObject<NSCoding>

@property int id;

@property NSString* name;

@property double latitude;

@property double longitude;

@property NSMutableArray *shops;

@property NSMutableArray *serviceCenters;

@end
