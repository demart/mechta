//
//  ServiceCenterDetailMapViewTableViewCell.m
//  MechtaApp
//
//  Created by Artem Demidovich on 2/25/16.
//  Copyright © 2016 Aphion Software. All rights reserved.
//

#import "ServiceCenterDetailMapViewTableViewCell.h"
#import "ServiceCenterMapLocationModel.h"

@implementation ServiceCenterDetailMapViewTableViewCell

- (void)awakeFromNib {
    [self initButtonView:self.mapServiceCenterCallButton];
}

-(void) initButtonView:(UIView*) view {
    view.layer.cornerRadius = 3.0;
    //view.layer.masksToBounds = NO;
    //view.layer.shadowOffset = CGSizeMake(2, 2);
    //view.layer.shadowRadius = 2;
    //view.layer.shadowOpacity = 0.5;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

- (IBAction)mapServiceCenterCallAction:(UIButton *)sender {
}

- (void) initMapView:(ServiceCenterModel*)model {
    self.model = model;
    [self fillCellFiels];
    
    self.mapView.delegate = self;
    self.mapView.mapType = MKMapTypeStandard;
    
    double lat = model.latitude;
    double lon = model.longitude;
    CLLocationCoordinate2D coord = {
        .latitude = lat,
        .longitude =  lon};
    MKCoordinateSpan span = {.latitudeDelta =  0.01, .longitudeDelta = 0.01};
    MKCoordinateRegion region = {coord, span};
    [self.mapView setRegion:region animated:NO];
    
    CLLocationCoordinate2D coord1;
    coord1.latitude = lat;
    coord1.longitude = lon;
    ServiceCenterMapLocationModel *mapModel = [[ServiceCenterMapLocationModel alloc] initWithName:@"Магазин «Мечта»" address:model.name coordinate:coord1];
    [self.mapView addAnnotation:mapModel];
    
    if (model.distance != 0) {
        MKDistanceFormatter *df = [[MKDistanceFormatter alloc]init];
        df.unitStyle = MKDistanceFormatterUnitStyleAbbreviated;
        df.units = MKDistanceFormatterUnitsMetric;
        NSString *prettyString = [df stringFromDistance:model.distance];
        [self.mapDistanceField setText:prettyString];
    } else {
        [self.mapDistanceField setText:@""];
    }
    
    
    
}


- (void) fillCellFiels {
    [self.mapDistanceField setText:@"120 м."];
    [self.mapServiceCenterAddress setText:self.model.name];
    [self.mapServiceCenterPhoneField setText:self.model.telephones];
    [self.mapServiceCenterWorkhoursField setText:self.model.workhours];
}

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation {
    static NSString *identifier = @"MapLocationModel";
    MKAnnotationView *annotationView = (MKAnnotationView *) [self.mapView dequeueReusableAnnotationViewWithIdentifier:identifier];
    if (annotationView == nil) {
        annotationView = [[MKAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:identifier];
        annotationView.enabled = YES;
        annotationView.canShowCallout = NO;
        annotationView.image = [UIImage imageNamed:@"map_mechta_point_icon"];
    } else {
        annotationView.annotation = annotation;
    }
    //annotationView.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
    return annotationView;
}

- (void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control {
    ServiceCenterMapLocationModel *location = (ServiceCenterMapLocationModel*)view.annotation;
    NSLog(@"Clicked on localtion name %@", location.name);
}

- (void)mapView:(MKMapView *)mapView didSelectAnnotationView:(MKAnnotationView *)view NS_AVAILABLE(10_9, 4_0) {
    ServiceCenterMapLocationModel *location = (ServiceCenterMapLocationModel*)view.annotation;
    NSLog(@"Clicked on didSelectAnnotationView name %@", location.name);
}

@end
