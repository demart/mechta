//
//  ServiceCenterViewController.h
//  MechtaApp
//
//  Created by Artem Demidovich on 2/25/16.
//  Copyright © 2016 Aphion Software. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "LMDropdownView.h"
#import <CoreLocation/CoreLocation.h>

@interface ServiceCenterViewController : UIViewController<MKMapViewDelegate,LMDropdownViewDelegate,UITableViewDelegate, UITableViewDataSource, CLLocationManagerDelegate>

@property (weak, nonatomic) IBOutlet MKMapView *mapView;

// Выпадающий список типов подразделений
@property (strong, nonatomic) IBOutlet UITableView *menuTableView;

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (strong, nonatomic) LMDropdownView *dropdownView;

@property (weak, nonatomic) IBOutlet UIBarButtonItem *changeMapViewItem;
- (IBAction)changeMavViewAction:(UIBarButtonItem *)sender;

@property (weak, nonatomic) IBOutlet UINavigationItem *topCityTitleNavigationItem;

@end
