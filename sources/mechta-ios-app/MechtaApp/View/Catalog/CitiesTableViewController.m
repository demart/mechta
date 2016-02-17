//
//  CitiesTableViewController.m
//  MechtaApp
//
//  Created by Artem Demidovich on 2/5/16.
//  Copyright © 2016 Aphion Software. All rights reserved.
//

#import "CitiesTableViewController.h"
#import "CityTableViewCell.h"

#import "DejalActivityView.h"

#import "CityService.h"

@interface CitiesTableViewController ()

@end

@implementation CitiesTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


-(void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
    
    [self loadCities];
}


#pragma mark - Loading data from Server

- (void) loadCities {
    if ([CityService getCities] == nil) {
        [DejalBezelActivityView activityViewForView:self.view withLabel:@"Подождите\nИдет загрузка..."];
        [CityService retrieveCities:^(ResponseWrapperModel *response) {
            if (response.success) {
                [self.tableView reloadData];
                [DejalBezelActivityView removeViewAnimated:YES];
            } else {
                [DejalBezelActivityView removeViewAnimated:NO];
                // SHOW ERROR
                UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Ошибка"
                                                                               message:@"Не удалось загрузить список городов."
                                                                        preferredStyle:UIAlertControllerStyleAlert];
                UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                                      handler:^(UIAlertAction * action) {}];
                [alert addAction:defaultAction];
                [self presentViewController:alert animated:YES completion:nil];
            }
        } onFailure:^(NSError *error) {
            [DejalBezelActivityView removeViewAnimated:NO];
            // SHOW ERROR
            UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Ошибка"
                                                                           message:@"Не удалось загрузить список городов."
                                                                    preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                                  handler:^(UIAlertAction * action) {}];
            [alert addAction:defaultAction];
            [self presentViewController:alert animated:YES completion:nil];
        }];
        
    } else {
        [self.tableView reloadData];
    }
}



#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [CityService getCities].count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CityTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CityCell"];
    if (!cell) {
        [tableView registerNib:[UINib nibWithNibName:@"CityTableViewCell" bundle:nil]forCellReuseIdentifier:@"CityCell"];
        cell = [tableView dequeueReusableCellWithIdentifier:@"CityCell"];
    }
    
    CityModel *cityModel = [CityService getCities][indexPath.row];
    if ([CityService getSelectedCityModel].id == cityModel.id) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
        cell.accessoryView = [self addMarkButton];
    } else {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    
    [cell.cityNameField setText:cityModel.name];
    
    return cell;
}

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [CityService selectCityModel:[CityService getCities][indexPath.row]];
    [self.tableView reloadData];
    [self.navigationController popViewControllerAnimated:YES];
}

- (UIView*) addMarkButton {
    UIImage *image = [UIImage imageNamed:@"filter_mark_checked_green"];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 0, 15, 15);
    [button setImage:image forState:UIControlStateNormal];
    return button;
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
