//
//  SearchTableViewController.m
//  MechtaApp
//
//  Created by Artem Demidovich on 2/17/16.
//  Copyright © 2016 Aphion Software. All rights reserved.
//

#import "SearchTableViewController.h"


@interface SearchTableViewController ()


@end

@implementation SearchTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _resultsTableController = [[SearchResultsTableViewController alloc] init];
    _searchController = [[UISearchController alloc] initWithSearchResultsController:self.resultsTableController];
    
    self.searchController.searchResultsUpdater = self;
    [self.searchController.searchBar sizeToFit];
    self.tableView.tableHeaderView = self.searchController.searchBar;
    
    self.resultsTableController.tableView.delegate = _resultsTableController;
    
    self.searchController.delegate = self;
    self.searchController.dimsBackgroundDuringPresentation = NO; // default is YES
    
    self.searchController.searchBar.delegate = self; // so we can monitor text changes + others
    
    self.searchController.searchBar.placeholder = @"Введите текст поиска";
    
    self.searchController.searchBar.layer.borderWidth = 1;
    self.searchController.searchBar.layer.borderColor = [[Constants SYSTEM_COLOR_PURPLE] CGColor];
    self.searchController.searchBar.translucent = NO;
    
    self.definesPresentationContext = YES;
    self.extendedLayoutIncludesOpaqueBars = YES;
    self.resultsTableController.extendedLayoutIncludesOpaqueBars = YES;
    
    self.loadSearchImageOperationQueue = [[NSOperationQueue alloc] init];
    [self.loadSearchImageOperationQueue setMaxConcurrentOperationCount:5];
    
    self.mainNavigationController = self.navigationController;
    self.resultsTableController.mainNavigationController = self.navigationController;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


- (void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    CGPoint contentOffset = self.tableView.contentOffset;
    contentOffset.y += CGRectGetHeight(self.tableView.tableHeaderView.frame);
    self.tableView.contentOffset = contentOffset;
    
    self.shownWithLoadedResults = YES;
}

- (void) viewDidAppear:(BOOL)animated   {
    [super viewDidAppear:animated];
    
    if (self.searchControllerWasActive) {
        self.searchController.active = self.searchControllerWasActive;
        _searchControllerWasActive = NO;
        
        if (self.searchControllerSearchFieldWasFirstResponder) {
            [self.searchController.searchBar becomeFirstResponder];
            _searchControllerSearchFieldWasFirstResponder = NO;
        }
    }
     
}

-(void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    [_loadSearchImageOperationQueue cancelAllOperations];
    [_loadSearchImageOperations removeAllObjects];
}

#pragma mark - UISearchBarDelegate

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    [searchBar resignFirstResponder];
}

#pragma mark - UISearchControllerDelegate

- (void)presentSearchController:(UISearchController *)searchController {
}

- (void)willPresentSearchController:(UISearchController *)searchController {
    // do something before the search controller is presented
}

- (void)didPresentSearchController:(UISearchController *)searchController {
    // do something after the search controller is presented
}

- (void)willDismissSearchController:(UISearchController *)searchController {
    // do something before the search controller is dismissed
}

- (void)didDismissSearchController:(UISearchController *)searchController {
    // do something after the search controller is dismissed
}


// Выполняет поиск асинхронно
- (void) searchByTextRemotely {
    NSLog(@"remote search text: %@", self.searchController.searchBar.text);
    CityModel *cityModel = [CityService getSelectedCityModel];
    
    [CatalogService searchProductsWithText:self.searchController.searchBar.text withPage:1 inCityId:cityModel.id onSuccess:^(ResponseWrapperModel *response) {
        
        [DejalBezelActivityView removeViewAnimated:YES];
        isLoadingViewShown = NO;
    
        NSMutableArray *models = (NSMutableArray*)response.data;
        SearchResultsTableViewController *tableController = (SearchResultsTableViewController *)self.searchController.searchResultsController;
        tableController.foundRecords = models;
        tableController.wasSearchQueryRequested = YES;
        
        if (response.countOfPages > 1) {
            tableController.hasMoreRecords = YES;
            tableController.searchedText = self.searchController.searchBar.text;
        }
        
        [tableController.tableView reloadData];
        
    } onFailure:^(NSError *error) {
        [DejalBezelActivityView removeViewAnimated:NO];
        // SHOW ERROR
        UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Ошибка"
                                                                       message:@"Не удалось выполнить поиск."
                                                                preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                              handler:^(UIAlertAction * action) {}];
        [alert addAction:defaultAction];
        [self presentViewController:alert animated:YES completion:nil];
    }];
    
}

#pragma mark - UISearchResultsUpdating

static BOOL isLoadingViewShown = NO;

- (void)updateSearchResultsForSearchController:(UISearchController *)searchController {
    NSString *searchText = searchController.searchBar.text;
    
    if (self.shownWithLoadedResults) {
        self.shownWithLoadedResults = NO;
        return;
    }
    
    if (self.searchDelayedTimer != nil) {
        [self.searchDelayedTimer invalidate];
    }
    
    if(searchText.length  < 3) {
        [DejalBezelActivityView removeViewAnimated:YES];
        isLoadingViewShown = NO;
        self.resultsTableController.wasSearchQueryRequested = NO;
        return;
    }
    
    if (isLoadingViewShown == NO) {
        [DejalBezelActivityView activityViewForView:self.resultsTableController.tableView withLabel:@"Подождите\nИдет загрузка..."];
        isLoadingViewShown = YES;
    }
    
    NSLog(@"search text: %@", searchText);
    self.searchDelayedTimer = [NSTimer scheduledTimerWithTimeInterval:1.5
                                                               target:self
                                                             selector:@selector(searchByTextRemotely)
                                                             userInfo:nil
                                                              repeats:NO];
}

- (void) viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    
    if (self.searchDelayedTimer != nil) {
        [self.searchDelayedTimer invalidate];
        self.searchDelayedTimer = nil;
    }
}

@end
