//
//  AnnouncementsTableViewController.m
//  MechtaApp
//
//  Created by Artem Demidovich on 2/25/16.
//  Copyright © 2016 Aphion Software. All rights reserved.
//

#import "AnnouncementsTableViewController.h"
#import "CityService.h"
#import "DejalActivityView.h"
#import "LoadMoreTableViewCell.h"
#import "AnnouncementTableViewCell.h"
#import "AnnouncementModel.h"
#import "LocalStorageService.h"

@interface AnnouncementsTableViewController ()

@property int mode;
@property NSMutableArray *announcements;
@property int page;
@property BOOL hasMoreRecords;

@property NSMutableDictionary *loadImageOperations;
@property NSOperationQueue *loadImageOperationQueue;

@end

@implementation AnnouncementsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.page = 1;
    self.announcements = [[NSMutableArray alloc] init];
    
    self.loadImageOperationQueue = [[NSOperationQueue alloc] init];
    [self.loadImageOperationQueue setMaxConcurrentOperationCount:5];
    
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    [self.tableView setSeparatorInset:UIEdgeInsetsZero];
    
    [DejalBezelActivityView activityViewForView:self.view withLabel:@"Подождите\nИдет загрузка..."];
    [self loadAnnouncements];
}

- (void) viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    [_loadImageOperationQueue cancelAllOperations];
    [_loadImageOperations removeAllObjects];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void) setAnnouncementMode:(int)mode {
    self.mode = mode;
    if (self.mode == ANNOUNCEMENT_MODE_NEWS) {
        [self.navigationItem setTitle:@"Новости"];
    } else {
        [self.navigationItem setTitle:@"Акции"];
    }
}

-(void) loadAnnouncements {
    CityModel *cityModel = [CityService getSelectedCityModel];
    
    
    [CityService retrieveCityAnnouncementsWithType:self.mode withPage:self.page inCityId:cityModel.id onSuccess:^(ResponseWrapperModel *response) {
        if (response.success) {
            NSMutableArray *records = (NSMutableArray*)response.data;
            if (records == nil || [records count] < 1) {
                self.hasMoreRecords = NO;
            } else {
                [self.announcements addObjectsFromArray:records];
                if (response.countOfPages > self.page) {
                    self.page = self.page + 1;
                    self.hasMoreRecords = YES;
                } else {
                    self.hasMoreRecords = NO;
                }
            }
            [self.tableView reloadData];
        }
        
        [DejalBezelActivityView removeViewAnimated:YES];
    } onFailure:^(NSError *error) {
        [DejalBezelActivityView removeViewAnimated:NO];
        UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Ошибка"
                                                                       message:@"Не удалось загрузить данные."
                                                                preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                              handler:^(UIAlertAction * action) {}];
        [alert addAction:defaultAction];
        [self presentViewController:alert animated:YES completion:nil];
    }];
}



- (void) loadAnnouncementImageInCell:(AnnouncementTableViewCell*) cell onIndexPath:(NSIndexPath*)indexPath withImageUrl:(NSString*)imageUrl {
    UIImage *loadedImage =(UIImage *)[LocalStorageService  loadImageFromLocalCache:imageUrl];
    
    if (loadedImage != nil) {
        cell.announcementImageView.image = loadedImage;
    } else {
        NSBlockOperation *loadImageOperation = [[NSBlockOperation alloc] init];
        __weak NSBlockOperation *weakOperation = loadImageOperation;
        
        [loadImageOperation addExecutionBlock:^(void){
            UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:
                                                                                   imageUrl
                                                                                   ]]];
            [[NSOperationQueue mainQueue] addOperationWithBlock:^(void) {
                if (! weakOperation.isCancelled) {
                    AnnouncementTableViewCell *updateCell = (AnnouncementTableViewCell*)[self.tableView cellForRowAtIndexPath:indexPath];
                    if (updateCell != nil && image != nil) {
                        updateCell.announcementImageView.image = image;
                    }
                    
                    if (image != nil) {
                        [LocalStorageService  saveImageToLocalCache:imageUrl withData:image];
                    } else {
                        cell.announcementImageView.image = [UIImage imageNamed:@"no_photo_icon"];
                    }
                    [self.loadImageOperations removeObjectForKey:indexPath];
                }
            }];
        }];
        
        [_loadImageOperations setObject: loadImageOperation forKey:indexPath];
        if (loadImageOperation) {
            [_loadImageOperationQueue addOperation:loadImageOperation];
        }
    }
}





#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (self.announcements != nil) {
        if (self.hasMoreRecords) {
            return [self.announcements count] + 1;
        } else {
            return [self.announcements count];
        }
    }
    return 0;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row > [self.announcements count] - 1) {
        // Extra
        LoadMoreTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LoadMoreCell"];
        if (!cell) {
            [tableView registerNib:[UINib nibWithNibName:@"LoadMoreTableViewCell" bundle:nil]forCellReuseIdentifier:@"LoadMoreCell"];
            cell = [tableView dequeueReusableCellWithIdentifier:@"LoadMoreCell"];
        }
        [cell.loadingActivityIndicator startAnimating];
        
        [self loadAnnouncements];
        
        return cell;
        
    } else {
        
        AnnouncementTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"AnnouncementCell"];
        if (!cell) {
            [tableView registerNib:[UINib nibWithNibName:@"AnnouncementTableViewCell" bundle:nil]forCellReuseIdentifier:@"AnnouncementCell"];
            cell = [tableView dequeueReusableCellWithIdentifier:@"AnnouncementCell"];
        }
        
        AnnouncementModel *model = self.announcements[indexPath.row];
        
        [cell.announcementTitle setText:model.name];
        [cell.announcementDate setText:model.date];
        [cell.announcementDescription setText:model.content];

        [self loadAnnouncementImageInCell:cell onIndexPath:indexPath withImageUrl:model.imageUrl];
        
        return cell;
    }
}


- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.announcements != nil && indexPath.row > [self.announcements count] - 1)
        return 40;
    return 110;
}


- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // TODO PASS PRODUCT ID
    if (self.announcements != nil && indexPath.row > [self.announcements count] - 1)
        return;
    
    //[self performSegueWithIdentifier:@"showProductDetailSergue" sender:self];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
