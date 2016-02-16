//
//  FiltersModel.h
//  MechtaApp
//
//  Created by Artem Demidovich on 2/12/16.
//  Copyright © 2016 Aphion Software. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FilterModel.h"

@interface FiltersModel : NSObject

@property int costLeft;
@property int costRight;

@property int selectedCostLeft;
@property int selectedCostRight;

@property NSMutableArray *filters;

/*
  1 - name asc
  2 - name desc
  3 - created_date asc
  4 - created_date desc
  5 - price asc
  6 - price desc
 */
@property int sortOrder;

- (NSString*) buildFilterOptionsQueryParam;


@end
