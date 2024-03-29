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


- (NSString*) formattedCost {
    NSString* cost = [[NSString alloc] initWithFormat:@"%li", self.cost];
    NSString* formatterCost = @"";
    if ([cost length] > 3) {
        int z = 0;
        for (long i = [cost length] -1; i >= 0; i--) {
            z+=1;
            formatterCost = [[NSString alloc] initWithFormat:@"%@%@", [cost substringWithRange:NSMakeRange(i,1)],formatterCost];
            if (z == 3) {
                formatterCost = [[NSString alloc] initWithFormat:@" %@", formatterCost];
                z = 0;
            }
        }
    } else {
        formatterCost = cost;
    }
    return formatterCost;
}

@end
