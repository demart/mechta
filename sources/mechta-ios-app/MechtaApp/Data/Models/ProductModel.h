//
//  ProductModel.h
//  MechtaApp
//
//  Created by Artem Demidovich on 2/5/16.
//  Copyright © 2016 Aphion Software. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ProductModel : NSObject

@property long id;

@property NSString* name;

@property long price;

@property NSString* picture;

// Список где можно купить
@property NSMutableArray *availableInShop;

@property NSString* content;

@end
