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
#import "DetailViewController.h"
#import "LocationController.h"

@interface MapViewController () <MKMapViewDelegate>
@property (strong, nonatomic) CLLocationManager *locationManager;
@property (weak, nonatomic) IBOutlet MKMapView *mapView;

- (IBAction)japonessaSelected:(UIButton *)sender;
- (IBAction)centuryLinkSelected:(UIButton *)sender;
- (IBAction)starbucksSelected:(UIButton *)sender;
- (IBAction)longPressGesture:(UILongPressGestureRecognizer *)sender;

@end

@implementation MapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupMap];
}
-(void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [[[LocationController sharedLocation]delegate]self];
    [[[LocationController sharedLocation]locationManager]startUpdatingLocation];
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [[[LocationController sharedLocation]locationManager]stopUpdatingLocation];
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
    _mapView.delegate = self;
}

-(void)locationControllerDidUpdateLocation{
    
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

- (IBAction)longPressGesture:(UILongPressGestureRecognizer *)sender {
    if (sender.state == UIGestureRecognizerStateBegan){
        CGPoint touchPoint = [sender locationInView:self.mapView];
        CLLocationCoordinate2D coordinate = [self.mapView convertPoint:touchPoint toCoordinateFromView:self.mapView];
        MKPointAnnotation * newPoint = [[MKPointAnnotation alloc]init];
        newPoint.coordinate = coordinate;
        newPoint.title = @"New Location";
        
        [self.mapView addAnnotation:newPoint];
        
    }
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"DetailViewController"]){
        if ([sender isKindOfClass:[MKAnnotationView class]]){
            MKAnnotationView *annotationView = (MKAnnotationView *)sender;
            DetailViewController *detailViewController = (DetailViewController *)[segue destinationViewController];
            detailViewController.annotationTitle = annotationView.annotation.title;
            detailViewController.coordinate = annotationView.annotation.coordinate;
        }
    }
}

-(MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation
{
    if ([annotation isKindOfClass:[MKUserLocation class]]){
        return nil;
    }
    MKPinAnnotationView *annotationView = [[MKPinAnnotationView alloc]initWithAnnotation:annotation  reuseIdentifier:@"mapview"];
    annotationView.annotation = annotation;
    if (!annotation) {
        annotationView = (MKPinAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:@"mapview"];
    }
    annotationView.canShowCallout = YES;
    UIButton *rightButtonCallout = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
    annotationView.rightCalloutAccessoryView = rightButtonCallout;
    return annotationView;
}

-(void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control{
    [self performSegueWithIdentifier:@"DetailViewController" sender:view];
}
@end






















