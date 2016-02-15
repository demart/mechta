//
//  FiltersModel.m
//  MechtaApp
//
//  Created by Artem Demidovich on 2/12/16.
//  Copyright © 2016 Aphion Software. All rights reserved.
//

#import "FiltersModel.h"

@implementation FiltersModel

- (NSString*) buildFilterOptionsQueryParam {
    if (self.filters == nil)
        return nil;
    
    NSString *queryParam = nil;
    
    for (FilterModel *model in self.filters) {
        for (FilterOptionModel *option in model.options) {
            if (queryParam == nil)
                queryParam = @"";
            
            queryParam = [[NSString alloc] initWithFormat:@"%@%i:%@;", queryParam, model.index, option.key];
        }
    }
    return queryParam;
}

@end
