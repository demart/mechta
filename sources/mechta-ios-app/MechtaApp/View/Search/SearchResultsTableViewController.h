//
//  SearchResultsTableViewController.h
//  MechtaApp
//
//  Created by Artem Demidovich on 2/17/16.
//  Copyright © 2016 Aphion Software. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SearchProductTableViewCell.h"
#import "LoadMoreTableViewCell.h"
#import "LocalStorageService.h"
#import "CityService.h"
#import "CatalogService.h"
#import "DejalActivityView.h"

@interface SearchResultsTableViewController : UITableViewController

// Отфильтрованные пользователи
@property NSMutableArray *foundRecords;

// Был ли запрос поиска кого-то пользователем
@property BOOL wasSearchQueryRequested;

// Есть ли еще результаты поиска чтобы показать
@property BOOL hasMoreRecords;

// Текст по которому ищут что-то
@property NSString* searchedText;

@property int page;

@property NSMutableDictionary *loadImageOperations;
@property NSOperationQueue *loadImageOperationQueue;

@property UINavigationController *mainNavigationController;

@end
