//
//  ServiceCenterDetailMapViewTableViewCell.h
//  MechtaApp
//
//  Created by Artem Demidovich on 2/25/16.
//  Copyright © 2016 Aphion Software. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "ServiceCenterModel.h"

@interface ServiceCenterDetailMapViewTableViewCell : UITableViewCell<MKMapViewDelegate>

@property ServiceCenterModel *model;

@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (weak, nonatomic) IBOutlet UILabel *mapDistanceField;
@property (weak, nonatomic) IBOutlet UILabel *mapServiceCenterNameField;
@property (weak, nonatomic) IBOutlet UILabel *mapServiceCenterAddress;
@property (weak, nonatomic) IBOutlet UILabel *mapServiceCenterPhoneField;
@property (weak, nonatomic) IBOutlet UILabel *mapServiceCenterWorkhoursField;
@property (weak, nonatomic) IBOutlet UIButton *mapServiceCenterCallButton;

- (IBAction)mapServiceCenterCallAction:(UIButton *)sender;

- (void) initMapView:(ServiceCenterModel*)model;

@end
