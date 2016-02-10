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

@interface ShopsViewController ()

@property NSString *latitude;
@property NSString *longitude;

@property MapLocationModel *selectedLocation;

@end

@implementation ShopsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.mapView.delegate = self;
    self.menuTableView.delegate = self;
    self.menuTableView.dataSource = self;
    
    self.mapView.mapType = MKMapTypeStandard;
    
    /*
    self.latitude = @"51.149013355686";
    self.longitude = @"71.445580959844";
    
    self.mapView.mapType = MKMapTypeStandard;
    double lat = [self.latitude doubleValue];
    double lon = [self.longitude doubleValue];
    CLLocationCoordinate2D coord = {
        .latitude = lat,
        .longitude =  lon};
    MKCoordinateSpan span = {.latitudeDelta =  0.15, .longitudeDelta = 0.15};
    MKCoordinateRegion region = {coord, span};
    [self.mapView setRegion:region animated:YES];
    */
    /*
     
    CLLocationCoordinate2D coord1;
    coord1.latitude = 51.149013355686f;
    coord1.longitude = 71.445580959844f;
    MapLocationModel *model = [[MapLocationModel alloc] initWithName:@"Магазин «Мечта»" address:@"Астана, ул. Амман, 14" coordinate:coord1];
    [self.mapView addAnnotation:model];
    
    CLLocationCoordinate2D coord2;
    coord2.latitude = 51.176400372519f;
    coord2.longitude = 71.414299965036f;
    MapLocationModel *model2 = [[MapLocationModel alloc] initWithName:@"Магазин «Мечта»" address:@"Астана, пр. Богенбая, 39" coordinate:coord2];
    [self.mapView addAnnotation:model2];
   
    CLLocationCoordinate2D coord3;
    coord3.latitude = 51.147115409405f;
    coord3.longitude = 71.471057653689f;
    MapLocationModel *model3 = [[MapLocationModel alloc] initWithName:@"Магазин «Мечта»" address:@"Астана, ул. Мирзояна, 13" coordinate:coord3];
    [self.mapView addAnnotation:model3];
    
    CLLocationCoordinate2D coord4;
    coord4.latitude = 51.175092113314f;
    coord4.longitude = 71.423861503536f;
    MapLocationModel *model4 = [[MapLocationModel alloc] initWithName:@"Магазин «Мечта»" address:@"Астана, пр. Республики, 45" coordinate:coord4];
    [self.mapView addAnnotation:model4];
    
    CLLocationCoordinate2D coord5;
    coord5.latitude = 51.153091657027f;
    coord5.longitude = 71.487380504477f;
    MapLocationModel *model5 = [[MapLocationModel alloc] initWithName:@"Магазин «Мечта»" address:@"Астана, ул. Куйши Дина, д. 31, ЖК «Мирас», район «Встречи»" coordinate:coord5];
    [self.mapView addAnnotation:model5];
    
    CLLocationCoordinate2D coord6;
    coord6.latitude = 51.149013355686f;
    coord6.longitude = 71.445580959844f;
    MapLocationModel *model6 = [[MapLocationModel alloc] initWithName:@"Магазин «Мечта»" address:@"Астана, Интернет-магазин" coordinate:coord6];
    [self.mapView addAnnotation:model6];
     
     */
}


-(void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self loadCityShops];
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
    
    // TODO CENTER MAP TO ANOTHER CITY CETNER
    if (cityModel == nil) {
        // 1. SHOW BIT MAP
        // 2. SHOW ALL SHOPS
        // 3. SET TITLE "CHOOSE CITY"
        [self.topCityTitleNavigationItem setTitle:@"Укажите город"];
        
    } else {
        
        [self.topCityTitleNavigationItem setTitle:cityModel.name];
        
        self.latitude = @"51.149013355686";
        self.longitude = @"71.445580959844";

        double lat = [self.latitude doubleValue];
        double lon = [self.longitude doubleValue];
        CLLocationCoordinate2D coord = {
            .latitude = lat,
            .longitude =  lon};
        MKCoordinateSpan span = {.latitudeDelta =  0.15, .longitudeDelta = 0.15};
        MKCoordinateRegion region = {coord, span};
        [self.mapView setRegion:region animated:YES];
        
    }
    
    [self.mapView removeAnnotations:self.mapView.annotations];
    CityModel *city = [CityService getSelectedCityModel];
    if (city == nil) {
        // SHOP MESSAGE "PLESAE CHOOSE CITY" or set default
        return;
    }
    if (city.shops != nil || [city.shops count] < 1) {
        for (ShopModel *shopModel in city.shops) {
            [self addShopOnTheMap:shopModel withCity:city];
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
        
        // Customize Dropdown style
        /*
        self.dropdownView.closedScale = 0.95;
        self.dropdownView.blurRadius = 5;
        self.dropdownView.blackMaskAlpha = 0.5;
        self.dropdownView.animationDuration = 0.5;
        self.dropdownView.animationBounceHeight = 10;
         */
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
    return [[CityService getCities] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ShopCityTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ShopCityCell"];
    if (!cell) {
        [tableView registerNib:[UINib nibWithNibName:@"ShopCityTableViewCell" bundle:nil]forCellReuseIdentifier:@"ShopCityCell"];
        cell = [tableView dequeueReusableCellWithIdentifier:@"ShopCityCell"];
    }
    
    CityModel *cityModel = [CityService getCities][indexPath.row];
    [cell.cityNameField setText:cityModel.name];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    [CityService selectCityModel:[CityService getCities][indexPath.row]];
    [self.dropdownView hide];
    [DejalBezelActivityView activityViewForView:self.view withLabel:@"Подождите\nИдет загрузка..."];
    [self fillPointsOnTheMap];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 40;
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.destinationViewController isKindOfClass:[ShopDetailTableViewController class]]) {
        ShopDetailTableViewController *viewController = (ShopDetailTableViewController*)segue.destinationViewController;
        [viewController setSelectedShopModel:self.selectedLocation.shop];
    }

}

- (IBAction)changeMavViewAction:(UIBarButtonItem *)sender {
    [self showDropDownView];
}
@end
