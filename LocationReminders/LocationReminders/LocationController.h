//
//  LocationController.h
//  LocationReminders
//
//  Created by Lauren Spatz on 3/15/16.
//  Copyright © 2016 Lauren Spatz. All rights reserved.
//

#import <Foundation/Foundation.h>
@import MapKit;
#import "DetailViewController.h"

@protocol LocationControllerDelegate
-(void)locationControllerDidUpdateLocation:(CLLocation *)location;
@end
@interface LocationController : NSObject 
@property (strong, nonatomic) CLLocationManager *locationManager;
@property (strong, nonatomic) CLLocation *location;
@property (weak, nonatomic) id delegate;

+(LocationController *)sharedLocation;

@end
