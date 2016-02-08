//
//  ProductModel.h
//  MechtaApp
//
//  Created by Artem Demidovich on 2/5/16.
//  Copyright © 2016 Aphion Software. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ProductAvailableInShopModel.h"
#import "ProductCharacteristicGroupModel.h"

@interface ProductModel : NSObject

//@property long id;

@property long numberOnSite;

@property NSString* name;

@property NSString* imageUrl;

@property NSString* content;

@property long cost;

@property long previousCost;

@property long numberOnSiteCategory;

// Список где можно купить
@property NSMutableArray *productAvailability;

@property NSMutableArray *characteristics;

@end