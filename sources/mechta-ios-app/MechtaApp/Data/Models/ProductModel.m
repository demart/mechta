//
//  ProductModel.m
//  MechtaApp
//
//  Created by Artem Demidovich on 2/5/16.
//  Copyright © 2016 Aphion Software. All rights reserved.
//

#import "ProductModel.h"

@implementation ProductModel


- (NSMutableArray*) getCharacteristicsList {
    if (self.characteristicsPlainList == nil) {
        self.characteristicsPlainList = [[NSMutableArray alloc] init];
    } else {
        return self.characteristicsPlainList;
    }
    
    if (self.characteristics != nil)
        for (ProductCharacteristicGroupModel *group in self.characteristics) {
            [self.characteristicsPlainList addObject:group];
            if (group.characteristics != nil)
                for (ProductCharacteristicModel *model in group.characteristics) {
                    [self.characteristicsPlainList addObject:model];
                }
        }
    
    return self.characteristicsPlainList;
}

- (NSMutableArray*) distinctImageUrls {
    if (self.distinctImageUrlList == nil) {
        self.distinctImageUrlList = [[NSMutableArray alloc] init];
    } else {
        return self.distinctImageUrlList;
    }
    
    if (self.imageUrl != nil) {
        [self.distinctImageUrlList addObject:self.imageUrl];
    }
    
    if (self.images != nil) {
        for (ProductImageModel *imageModel in self.images) {
            BOOL found = NO;
            for (NSString* imageUrl in self.distinctImageUrlList) {
                if ([imageModel.url isEqualToString:imageUrl]) {
                    found = YES;
                    break;
                }
            }
            
            if (found == NO) {
                [self.distinctImageUrlList addObject:imageModel.url];
            }
                
        }
    }
    
    return self.distinctImageUrlList;
}

@end
