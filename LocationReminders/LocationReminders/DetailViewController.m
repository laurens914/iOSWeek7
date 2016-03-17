//
//  DetailViewController.m
//  LocationReminders
//
//  Created by Lauren Spatz on 3/15/16.
//  Copyright © 2016 Lauren Spatz. All rights reserved.
//

#import "DetailViewController.h"
#import "Reminder.h"
#import "NSString+Additions.h"
#import "LocationController.h"

@interface DetailViewController ()
@property (weak, nonatomic) IBOutlet UITextField *reminderName;
@property (weak, nonatomic) IBOutlet UITextField *reminderRadius;
- (IBAction)saveButton:(id)sender;


@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
 
}


- (IBAction)saveButton:(id)sender {
    Reminder *reminder = [[Reminder alloc]init];
    reminder.name = self.reminderName.text;
    if(self.reminderRadius.text.isValidNumber){
        NSLog(@"valid number");
    }else {
        [self showAlertView];
        return;
    }
    NSNumberFormatter *numberString = [[NSNumberFormatter alloc]init];
    NSNumber * radiusNumber = [numberString numberFromString:self.reminderRadius.text];
    reminder.radius = radiusNumber;
    reminder.location = [PFGeoPoint geoPointWithLatitude:self.coordinate.latitude longitude:self.coordinate.longitude];
    if(self.completion){
        if([CLLocationManager isMonitoringAvailableForClass:[CLCircularRegion class]]) {
            CLCircularRegion *region = [[CLCircularRegion alloc]initWithCenter:self.coordinate radius:radiusNumber.doubleValue identifier:reminder.name];
            [[[LocationController sharedLocation]locationManager]startMonitoringForRegion:region];
            self.completion([MKCircle circleWithCenterCoordinate:self.coordinate radius:radiusNumber.doubleValue]);
            [[self navigationController]popViewControllerAnimated:YES];
        }
    }
}

-(void)showAlertView
{
    NSString *title = @"Error";
    NSString *message = @"please enter numeric value only";
    UIAlertController *controller = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
    [controller addAction:okAction];
    [self presentViewController:controller animated:YES completion:nil];
    
}
@end
