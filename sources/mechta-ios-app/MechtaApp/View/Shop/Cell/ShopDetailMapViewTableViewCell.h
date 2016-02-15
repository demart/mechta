//
//  ShopDetailMapViewTableViewCell.h
//  MechtaApp
//
//  Created by Artem Demidovich on 2/11/16.
//  Copyright © 2016 Aphion Software. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "ShopModel.h"

@interface ShopDetailMapViewTableViewCell : UITableViewCell<MKMapViewDelegate>

@property ShopModel *model;

@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (weak, nonatomic) IBOutlet UILabel *mapDistanceField;
@property (weak, nonatomic) IBOutlet UILabel *mapShopNameField;
@property (weak, nonatomic) IBOutlet UILabel *mapShopAddress;
@property (weak, nonatomic) IBOutlet UILabel *mapShopPhoneField;
@property (weak, nonatomic) IBOutlet UILabel *mapShopWorkhoursField;
@property (weak, nonatomic) IBOutlet UIButton *mapShopCallButton;

- (IBAction)mapShopCallAction:(UIButton *)sender;

- (void) initMapView:(ShopModel*)model;

@end
