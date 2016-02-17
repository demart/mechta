//
//  SearchTableViewController.h
//  MechtaApp
//
//  Created by Artem Demidovich on 2/17/16.
//  Copyright © 2016 Aphion Software. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SearchResultsTableViewController.h"
#import "Constants.h"
#import "DejalActivityView.h"
#import "CatalogService.h"
#import "CityService.h"

@interface SearchTableViewController : UITableViewController<UISearchBarDelegate, UISearchControllerDelegate, UISearchResultsUpdating>

@property (nonatomic, strong) UISearchController *searchController;

// our secondary search results table view
@property (nonatomic, strong) SearchResultsTableViewController *resultsTableController;

// for state restoration
@property BOOL searchControllerWasActive;
@property BOOL searchControllerSearchFieldWasFirstResponder;

// Таймер для отсрочки поиска для того чтобы не отправлять на сервер кучу запросов
@property NSTimer *searchDelayedTimer;

@property NSMutableDictionary *loadSearchImageOperations;
@property NSOperationQueue *loadSearchImageOperationQueue;

@property UINavigationController *mainNavigationController;
@property BOOL shownWithLoadedResults;

@end
