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
#import <Parse/Parse.h>
#import <ParseUI/ParseUI.h>
#import "Reminder.h"


@interface MapViewController () <MKMapViewDelegate, PFLogInViewControllerDelegate, PFSignUpViewControllerDelegate>
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
    [self login];
    [self setupMap];
}
-(void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [[[LocationController sharedLocation]delegate]self];
    [[[LocationController sharedLocation]locationManager]startUpdatingLocation];
    [self getReminders];
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [[[LocationController sharedLocation]locationManager]stopUpdatingLocation];
}

-(void)requestPermissions{
    [self setLocationManager:[[CLLocationManager alloc]init]];
    [self.locationManager requestAlwaysAuthorization];
    
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
-(void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation{
    CLLocationCoordinate2D location;
    location.latitude = userLocation.coordinate.latitude;
    location.longitude = userLocation.coordinate.longitude;
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(location, 500, 500);
    [_mapView setRegion:region animated:YES];
    
}

-(void)login{
    if (![PFUser currentUser]){
        PFLogInViewController *loginViewController = [[PFLogInViewController alloc]init];
        loginViewController.delegate = self;
        loginViewController.signUpController.delegate = self;
        [self presentViewController:loginViewController animated:YES completion:nil];
    } else {
        [self setupAdditionalUI];
    }
}
-(void)setupAdditionalUI{
    UIBarButtonItem *signoutButton = [[UIBarButtonItem alloc]initWithTitle:@"Sign Out" style:UIBarButtonItemStylePlain target:self action:@selector(signOut)];
    self.navigationItem.leftBarButtonItem = signoutButton;
}

-(void)signOut{
    [PFUser logOut];
    [self login];
}

-(void)logInViewController:(PFLogInViewController *)logInController didLogInUser:(PFUser *)user{
    [self dismissViewControllerAnimated:YES completion:nil];
    [self setupAdditionalUI];
}

-(void)signUpViewController:(PFSignUpViewController *)signUpController didSignUpUser:(PFUser *)user{
    [self dismissViewControllerAnimated:YES completion:nil];
    [self setupAdditionalUI];
}
  
  
  
  
- (IBAction)japonessaSelected:(UIButton *)sender {
    CLLocationCoordinate2D coordinate = CLLocationCoordinate2DMake(47.60818, -122.33938);
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(coordinate, 500, 500);
    [_mapView setRegion:region animated:TRUE];
    
}

- (IBAction)centuryLinkSelected:(UIButton *)sender {
    CLLocationCoordinate2D coordinate = CLLocationCoordinate2DMake(47.5952, -122.3316);
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(coordinate, 500, 500);
    [_mapView setRegion:region animated:TRUE];
}


- (IBAction)starbucksSelected:(UIButton *)sender {
    CLLocationCoordinate2D coordinate = CLLocationCoordinate2DMake(47.60998949, -122.34273612);
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(coordinate, 500, 500);
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
            MKPointAnnotation *annotation = (MKPointAnnotation *)annotationView.annotation;
            DetailViewController *detailViewController = (DetailViewController *)[segue destinationViewController];
            detailViewController.annotationTitle = annotationView.annotation.title;
            detailViewController.coordinate = annotationView.annotation.coordinate;
            __weak typeof (self) weakSelf = self;
            detailViewController.completion = ^(NSString *title, MKCircle *circle, CLCircularRegion* region){
                __strong typeof (self) strongSelf = weakSelf;
                [strongSelf.mapView addOverlay:circle];
                [strongSelf.locationManager startMonitoringForRegion:region];
                [annotation setTitle:title];
                
            };
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

-(MKOverlayRenderer *)mapView:(MKMapView *)mapView rendererForOverlay:(id<MKOverlay>)overlay{
    MKCircleRenderer *renderer = [[MKCircleRenderer alloc]initWithOverlay:overlay];
    renderer.strokeColor = [UIColor lightGrayColor];
    renderer.fillColor = [UIColor purpleColor];
    renderer.alpha = 0.5;
    return renderer;
}

-(void)getReminders{
    PFQuery *query = [PFQuery queryWithClassName:@"Reminder"];
    __weak typeof(self) weakSelf = self;
    [query findObjectsInBackgroundWithBlock:^(NSArray * _Nullable objects, NSError * _Nullable error) {
        __strong typeof(self) strongSelf = weakSelf;
        if(error == nil){
            NSMutableArray * points = [[NSMutableArray alloc]init];
            NSMutableArray *radius = [[NSMutableArray alloc]init];
            for (Reminder * object in objects){
                MKPointAnnotation * point = [[MKPointAnnotation alloc]init];
                CLLocationCoordinate2D location = CLLocationCoordinate2DMake(object.location.latitude, object.location.longitude);
                point.coordinate = location;
                point.title = object.name;
                [points addObject:point];
                MKCircle *circle= [MKCircle circleWithCenterCoordinate:location radius:object.radius.doubleValue];
                [radius addObject:circle];
              
            }
            [strongSelf.mapView addAnnotations:points];
            [strongSelf.mapView addOverlays:radius];
        }
    }];
}
@end






















