//
//  ShopsViewController.m
//  MechtaApp
//
//  Created by Artem Demidovich on 2/10/16.
//  Copyright © 2016 Aphion Software. All rights reserved.
//

#import "ShopsViewController.h"

#import "MapLocationModel.h"
#import "ShopDetailTableViewController.h"
#import "CityService.h"
#import "DejalActivityView.h"
#import "ShopCityTableViewCell.h"
#import "ShopDetailMiniTableViewCell.h"

static int VIEW_MODE_MAP = 0;
static int VIEW_MODE_LIST = 1;

@interface ShopsViewController ()

@property NSString *latitude;
@property NSString *longitude;

@property MapLocationModel *selectedLocation;

@property int viewMode;

/* Последняя зафиксированная геолокация */
@property CLLocation *location;

@end

@implementation ShopsViewController

/* Менеджер получения геолокации */
CLLocationManager *locationManager;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.mapView.delegate = self;
    self.mapView.mapType = MKMapTypeStandard;
    
    self.menuTableView.delegate = self;
    self.menuTableView.dataSource = self;
    
    self.shopTableView.delegate = self;
    self.shopTableView.dataSource = self;
    self.shopTableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    //self.shopTableView.separatorColor = [UIColor clearColor];
    
    self.viewMode = VIEW_MODE_MAP;
    
    locationManager = [[CLLocationManager alloc] init];
    locationManager.delegate = self;
    locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    locationManager.distanceFilter = kCLDistanceFilterNone;
}


- (void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self loadCityShops];
    [self.shopTableView reloadData];
    
    // enable location service
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0 &&
        [CLLocationManager authorizationStatus] != kCLAuthorizationStatusAuthorizedWhenInUse) {
        [locationManager requestWhenInUseAuthorization];
    } else {
        [locationManager startUpdatingLocation];
    }
}

- (void)locationManager:(CLLocationManager*)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status {
    switch (status) {
        case kCLAuthorizationStatusNotDetermined: {
            NSLog(@"User still thinking..");
        } break;
        case kCLAuthorizationStatusDenied: {
            NSLog(@"User hates you");
        } break;
        case kCLAuthorizationStatusAuthorizedWhenInUse:
        case kCLAuthorizationStatusAuthorizedAlways: {
            [locationManager startUpdatingLocation];
        } break;
        default:
            break;
    }
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
    NSLog(@"Location error");
}

- (void) locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations {
    CLLocation *lastLocation = [locations lastObject];
    NSLog(@"didUpdateToLocations: %@", lastLocation);
    self.location = lastLocation;
    [locationManager stopUpdatingLocation];
}

- (void) setNavigationBarTitle:(NSString*) cityName {
    CGSize titleSize = [cityName sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15.0]}];
    UIImage *image = [UIImage imageNamed:@"map_city_filter_arrow_icon"];
    CGRect frame = CGRectMake(0, 0, titleSize.width + (5 + image.size.width)*2, self.navigationController.navigationBar.frame.size.height);
    UIView *myView = [[UIView alloc] initWithFrame: frame];
    [myView setBackgroundColor:[UIColor  clearColor]];
    UIButton *btn = [[UIButton alloc] initWithFrame:frame];
    CGRect titleFrame = CGRectMake(0, 1, titleSize.width, self.navigationController.navigationBar.frame.size.height);
    UILabel *title = [[UILabel alloc] initWithFrame:titleFrame];
    title.text = cityName;
    [title setTextColor:[UIColor whiteColor]];
    [title setFont:[UIFont systemFontOfSize:15.0]];
    [title setBackgroundColor:[UIColor clearColor]];
    [title setTextAlignment:NSTextAlignmentLeft];
    [btn addSubview:title];
    UIImageView *myImageView = [[UIImageView alloc] initWithImage:image];
    CGRect arrowFrame = CGRectMake(titleSize.width + 5, self.navigationController.navigationBar.frame.size.height/2, image.size.width, image.size.height);
    myImageView.frame = arrowFrame;
    [btn addSubview:myImageView];
    [myView addSubview:btn];
    
    [btn addTarget:self action:@selector(showOrHideCityMenu) forControlEvents:UIControlEventTouchDown];
    
    self.navigationItem.titleView = myView;
}

- (void) showOrHideCityMenu {
    if (self.dropdownView.isOpen) {
        [self.dropdownView hide];
    } else {
        [self showDropDownView];
    }
}

- (void) loadCityShops {
    if ([CityService getCities] == nil) {
        [DejalBezelActivityView activityViewForView:self.view withLabel:@"Подождите\nИдет загрузка..."];
        [CityService retrieveCities:^(ResponseWrapperModel *response) {
            if (response.success) {
                // TODO: DO some operations
                [self fillPointsOnTheMap];
                [DejalBezelActivityView removeViewAnimated:YES];
            } else {
                [DejalBezelActivityView removeViewAnimated:NO];
                // SHOW ERROR
                UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Ошибка"
                                                                               message:@"Не удалось загрузить магазины."
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
                                                                           message:@"Не удалось загрузить  магазины."
                                                                    preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                                  handler:^(UIAlertAction * action) {}];
            [alert addAction:defaultAction];
            [self presentViewController:alert animated:YES completion:nil];
        }];
        
    } else {
        [self fillPointsOnTheMap];
    }
}

- (void) fillPointsOnTheMap {
    CityModel *cityModel = [CityService getSelectedCityModel];
    [self.mapView removeAnnotations:self.mapView.annotations];
    
    // TODO CENTER MAP TO ANOTHER CITY CETNER
    if (cityModel == nil) {
        [self setNavigationBarTitle:@"Укажите город"];
        
        // CENTER OF KAZAKHSTAN
        self.latitude = @"48";
        self.longitude = @"68";
        
        double lat = [self.latitude doubleValue];
        double lon = [self.longitude doubleValue];
        CLLocationCoordinate2D coord = {
            .latitude = lat,
            .longitude =  lon};
        MKCoordinateSpan span = {.latitudeDelta =  40, .longitudeDelta = 40};
        MKCoordinateRegion region = {coord, span};
        [self.mapView setRegion:region animated:YES];
        
        for (CityModel *city in [CityService getCities]) {
            if (city.shops != nil || [city.shops count] < 1) {
                for (ShopModel *shopModel in city.shops) {
                    [self addShopOnTheMap:shopModel withCity:city];
                }
            }
        }
        
    } else {
        
        [self setNavigationBarTitle:cityModel.name];
        
        double lat = cityModel.latitude;
        double lon = cityModel.longitude;
        CLLocationCoordinate2D coord = {
            .latitude = lat,
            .longitude =  lon};
        MKCoordinateSpan span = {.latitudeDelta =  0.13, .longitudeDelta = 0.13};
        MKCoordinateRegion region = {coord, span};
        [self.mapView setRegion:region animated:YES];
        
        if (cityModel == nil) {
            // SHOP MESSAGE "PLESAE CHOOSE CITY" or set default
            return;
        }
        if (cityModel.shops != nil || [cityModel.shops count] < 1) {
            for (ShopModel *shopModel in cityModel.shops) {
                [self addShopOnTheMap:shopModel withCity:cityModel];
            }
        }
        
    }
    
    [DejalBezelActivityView removeViewAnimated:YES];
}


- (void) addShopOnTheMap:(ShopModel*)shopModel withCity:(CityModel*)cityModel {
    if (shopModel == nil)
        return;
    CLLocationCoordinate2D coord;
    coord.latitude = shopModel.latitude;
    coord.longitude = shopModel.longitude;
    NSString* address = [[NSString alloc] initWithFormat:@"%@, %@", cityModel.name, shopModel.name];
    MapLocationModel *model = [[MapLocationModel alloc] initWithName:@"Магазин «Мечта»" address:address coordinate:coord];
    model.shop = shopModel;
    [self.mapView addAnnotation:model];
}

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation {
    static NSString *identifier = @"MapLocationModel";
        MKAnnotationView *annotationView = (MKAnnotationView *) [self.mapView dequeueReusableAnnotationViewWithIdentifier:identifier];
        if (annotationView == nil) {
            annotationView = [[MKAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:identifier];
            annotationView.enabled = YES;
            annotationView.canShowCallout = YES;
            annotationView.image = [UIImage imageNamed:@"map_mechta_point_icon"];
        } else {
            annotationView.annotation = annotation;
        }
        annotationView.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
        return annotationView;
}

- (void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control {
    MapLocationModel *location = (MapLocationModel*)view.annotation;
    self.selectedLocation = location;
    [self performSegueWithIdentifier:@"showShopDetailSergue" sender:self];
    NSLog(@"Clicked on localtion name %@", location.name);
}

- (void)mapView:(MKMapView *)mapView didSelectAnnotationView:(MKAnnotationView *)view NS_AVAILABLE(10_9, 4_0) {
    MapLocationModel *location = (MapLocationModel*)view.annotation;
    NSLog(@"Clicked on didSelectAnnotationView name %@", location.name);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


#pragma mark - DROPDOWN VIEW

- (void)showDropDownView {
    // Init dropdown view
    if (!self.dropdownView) {
        self.dropdownView = [LMDropdownView dropdownView];
        self.dropdownView.delegate = self;
        
        self.dropdownView.closedScale = 1;
        self.dropdownView.blurRadius = 10;
        self.dropdownView.blackMaskAlpha = 0.2;
        self.dropdownView.animationDuration = 0.5;
        self.dropdownView.animationBounceHeight = 10;
        
        self.dropdownView.contentBackgroundColor = [UIColor whiteColor];
    }
    
    // Show/hide dropdown view
    if ([self.dropdownView isOpen]) {
        [self.dropdownView hide];
    }
    else {
        [self.menuTableView setFrame:CGRectMake(0,
                                                0,
                                                CGRectGetWidth(self.view.bounds),
                                                MIN(CGRectGetHeight(self.view.bounds)*0.8, [CityService getCities].count * 40))];
        
        [self.menuTableView reloadData];
        [self.dropdownView showFromNavigationController:self.navigationController withContentView:self.menuTableView];
    }
}

- (void)dropdownViewWillShow:(LMDropdownView *)dropdownView {
}

- (void)dropdownViewDidShow:(LMDropdownView *)dropdownView {
}

- (void)dropdownViewWillHide:(LMDropdownView *)dropdownView {
}

- (void)dropdownViewDidHide:(LMDropdownView *)dropdownView {
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (self.shopTableView == tableView) {
        CityModel *model = [CityService getSelectedCityModel];
        if (model != nil && model.shops != nil) {
            return [model.shops count];
        }
        return 0;
    }
    
    return [[CityService getCities] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.menuTableView == tableView) {
        ShopCityTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ShopCityCell"];
        if (!cell) {
            [tableView registerNib:[UINib nibWithNibName:@"ShopCityTableViewCell" bundle:nil]forCellReuseIdentifier:@"ShopCityCell"];
            cell = [tableView dequeueReusableCellWithIdentifier:@"ShopCityCell"];
        }
        
        CityModel *cityModel = [CityService getCities][indexPath.row];
        [cell.cityNameField setText:cityModel.name];
        return cell;
    } else {
        
        ShopDetailMiniTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ShopDetailMiniCell"];
        if (!cell) {
            [tableView registerNib:[UINib nibWithNibName:@"ShopDetailMiniTableViewCell" bundle:nil]forCellReuseIdentifier:@"ShopDetailMiniCell"];
            cell = [tableView dequeueReusableCellWithIdentifier:@"ShopDetailMiniCell"];
        }
        
        CityModel *model = [CityService getSelectedCityModel];
        ShopModel *shopModel = model.shops[indexPath.row];
        [cell.shopAddress setText:[[NSString alloc] initWithFormat:@"%@, %@", model.name, shopModel.name]];
        [cell.shopWorkhours setText:[[NSString alloc] initWithFormat:@"Режим работы: %@", shopModel.workhours]];

        if (self.location != nil && shopModel.distance == 0) {
            CLLocation *current = [[CLLocation alloc] initWithLatitude:shopModel.latitude longitude:shopModel.longitude];
            CLLocationDistance distance = [self.location distanceFromLocation:current];
            shopModel.distance = distance;
        }

        if (shopModel.distance != 0) {
            MKDistanceFormatter *df = [[MKDistanceFormatter alloc]init];
            df.unitStyle = MKDistanceFormatterUnitStyleAbbreviated;
            df.units = MKDistanceFormatterUnitsMetric;
            NSString *prettyString = [df stringFromDistance:shopModel.distance];
            [cell.shopDistanceField setText:prettyString];
        } else {
            [cell.shopDistanceField setText:@""];
        }
       
        return cell;
        
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.menuTableView == tableView) {
        [CityService selectCityModel:[CityService getCities][indexPath.row]];
        [self.dropdownView hide];
        [self.shopTableView reloadData];
        [DejalBezelActivityView activityViewForView:self.view withLabel:@"Подождите\nИдет загрузка..."];
        [self fillPointsOnTheMap];
    } else {
        [self performSegueWithIdentifier:@"showShopDetailSergue" sender:self];
    }
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.menuTableView == tableView) {
        return 40;
    }
    
    if (self.shopTableView == tableView) {
        return 70;
    }
    
    return 40;
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.destinationViewController isKindOfClass:[ShopDetailTableViewController class]]) {
        ShopDetailTableViewController *viewController = (ShopDetailTableViewController*)segue.destinationViewController;
        
        if (self.viewMode == VIEW_MODE_MAP) {
            [viewController setSelectedShopModel:self.selectedLocation.shop];
        } else {
            NSIndexPath *indexPath = [self.shopTableView indexPathForSelectedRow];
            ShopModel *model = [CityService getSelectedCityModel].shops[indexPath.row];
            [viewController setSelectedShopModel:model];
        }
    }
}

- (IBAction)changeMavViewAction:(UIBarButtonItem *)sender {
    if (self.viewMode == VIEW_MODE_MAP) {
        self.viewMode = VIEW_MODE_LIST;
        [self.changeMapViewItem setTitle:@"Карта"];

        [UIView transitionWithView:self.view
                          duration:0.6
                           options:UIViewAnimationOptionTransitionFlipFromLeft
                        animations:^{
                            self.mapView.hidden = YES;
                            self.shopTableView.hidden = NO;
                        } completion:^(BOOL finished) {
                            [self.shopTableView reloadData];
                        }];
        
    } else {
        self.viewMode = VIEW_MODE_MAP;
        [self.changeMapViewItem setTitle:@"Список"];
        
        [UIView transitionWithView:self.view
                          duration:0.6
                           options:UIViewAnimationOptionTransitionFlipFromRight
                        animations:^{
                            self.mapView.hidden = NO;
                            self.shopTableView.hidden = YES;
                        } completion:^(BOOL finished) {
                        }];
    }
}
@end
