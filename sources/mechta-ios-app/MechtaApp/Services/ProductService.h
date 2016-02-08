//
//  ProductService.h
//  MechtaApp
//
//  Created by Artem Demidovich on 2/5/16.
//  Copyright © 2016 Aphion Software. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ProductModel.h"

@interface ProductService : NSObject

+ (NSMutableArray*) getProductsFromCategory:(long)categoryId fromPage:(long)page inCity:(long)cityId;

@end
