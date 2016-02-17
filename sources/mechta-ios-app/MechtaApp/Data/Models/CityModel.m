//
//  CityModel.m
//  MechtaApp
//
//  Created by Artem Demidovich on 2/5/16.
//  Copyright © 2016 Aphion Software. All rights reserved.
//

#import "CityModel.h"

@implementation CityModel

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeInt:self.id forKey:@"id"];
    [aCoder encodeObject:self.name forKey:@"name"];
    [aCoder encodeDouble:self.latitude forKey:@"latitude"];
    [aCoder encodeDouble:self.longitude forKey:@"longitude"];
    [aCoder encodeObject:self.shops forKey:@"shops"];
}
- (nullable instancetype)initWithCoder:(NSCoder *)aDecoder {
    self.id = [aDecoder decodeIntForKey:@"id"];
    self.name = [aDecoder decodeObjectForKey:@"name"];
    self.latitude = [aDecoder decodeDoubleForKey:@"latitude"];
    self.longitude = [aDecoder decodeDoubleForKey:@"longitude"];
    self.shops = [aDecoder decodeObjectForKey:@"shops"];
    return self;
}

@end
