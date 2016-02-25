//
//  ServiceCenterModel.h
//  MechtaApp
//
//  Created by Artem Demidovich on 2/25/16.
//  Copyright © 2016 Aphion Software. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ShopModel.h"

@interface ServiceCenterModel : ShopModel

@property NSString* content; // description

@property NSString* street;

@end