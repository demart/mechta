//
//  ProductAvailableInShopModel.h
//  MechtaApp
//
//  Created by Artem Demidovich on 2/5/16.
//  Copyright © 2016 Aphion Software. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ProductModel.h"
#import "ShopModel.h"

@interface ProductAvailableInShopModel : NSObject

@property int id;

@property ProductModel *product;

@property ShopModel *shop;

@property NSString* amount;

@end
