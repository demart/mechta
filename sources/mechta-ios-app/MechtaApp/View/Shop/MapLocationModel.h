//
//  MapLocationModel.h
//  MechtaApp
//
//  Created by Artem Demidovich on 2/10/16.
//  Copyright © 2016 Aphion Software. All rights reserved.
//

#import <MapKit/MapKit.h>
#import <Foundation/Foundation.h>
#import <AddressBook/AddressBook.h>
#import "ShopModel.h"

@interface MapLocationModel : NSObject <MKAnnotation>

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *address;
@property (nonatomic, assign) CLLocationCoordinate2D theCoordinate;

@property ShopModel *shop;

- (id)initWithName:(NSString*)name address:(NSString*)address coordinate:(CLLocationCoordinate2D)coordinate;
- (MKMapItem*)mapItem;

@end
