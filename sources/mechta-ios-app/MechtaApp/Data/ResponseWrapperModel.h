//
//  ResponseWrapperModel.h
//  MechtaApp
//
//  Created by Artem Demidovich on 2/8/16.
//  Copyright © 2016 Aphion Software. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ResponseWrapperModel : NSObject

@property BOOL success;

@property NSObject *data;

@property int countOfPages;

@property int countOfProducts;

@property int currentPage;

@property int count;

@end