//
//  ShopModel.m
//  MechtaApp
//
//  Created by Artem Demidovich on 2/5/16.
//  Copyright © 2016 Aphion Software. All rights reserved.
//

#import "ShopModel.h"

@implementation ShopModel

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeInt:self.id forKey:@"id"];
    [aCoder encodeObject:self.name forKey:@"name"];
    [aCoder encodeObject:self.workhours forKey:@"workhours"];
    [aCoder encodeDouble:self.latitude forKey:@"latitude"];
    [aCoder encodeDouble:self.longitude forKey:@"longitude"];
    [aCoder encodeObject:self.telephones forKey:@"telephones"];
}
- (nullable instancetype)initWithCoder:(NSCoder *)aDecoder {
    self.id = [aDecoder decodeIntForKey:@"id"];
    self.name = [aDecoder decodeObjectForKey:@"name"];
    self.workhours = [aDecoder decodeObjectForKey:@"workhours"];
    self.latitude = [aDecoder decodeDoubleForKey:@"latitude"];
    self.longitude = [aDecoder decodeDoubleForKey:@"longitude"];
    self.telephones = [aDecoder decodeObjectForKey:@"telephones"];
    return self;
}

@end
