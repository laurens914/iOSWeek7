//
//  ViewController.m
//  LocationReminders
//
//  Created by Lauren Spatz on 3/14/16.
//  Copyright © 2016 Lauren Spatz. All rights reserved.
//

#import "MapViewController.h"
@import MapKit;
@import CoreLocation;

@interface MapViewController ()
@property (strong, nonatomic) CLLocationManager *locationManager;
@property (weak, nonatomic) IBOutlet MKMapView *mapView;

- (IBAction)japonessaSelected:(UIButton *)sender;
- (IBAction)centuryLinkSelected:(UIButton *)sender;
- (IBAction)starbucksSelected:(UIButton *)sender;

@end

@implementation MapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

-(void)requestPermissions{
    [self setLocationManager:[[CLLocationManager alloc]init]];
    [self.locationManager requestWhenInUseAuthorization];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self requestPermissions];
    
}
-(void) setupMap {
    _mapView.showsUserLocation = TRUE;
    _mapView.layer.cornerRadius = 25.0;
}
- (IBAction)japonessaSelected:(UIButton *)sender {
    CLLocationCoordinate2D coordinate = CLLocationCoordinate2DMake(47.60818, -122.33938);
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(coordinate, 400, 400);
    [_mapView setRegion:region animated:TRUE];
    
}

- (IBAction)centuryLinkSelected:(UIButton *)sender {
    CLLocationCoordinate2D coordinate = CLLocationCoordinate2DMake(47.5952, -122.3316);
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(coordinate, 400, 400);
    [_mapView setRegion:region animated:TRUE];
}


- (IBAction)starbucksSelected:(UIButton *)sender {
    CLLocationCoordinate2D coordinate = CLLocationCoordinate2DMake(47.60998949, -122.34273612);
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(coordinate, 400, 400);
    [_mapView setRegion:region animated:TRUE];
}
@end
