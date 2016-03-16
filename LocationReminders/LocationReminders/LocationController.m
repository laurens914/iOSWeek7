//
//  LocationController.m
//  LocationReminders
//
//  Created by Lauren Spatz on 3/15/16.
//  Copyright © 2016 Lauren Spatz. All rights reserved.
//

#import "LocationController.h"

@interface LocationController () <CLLocationManagerDelegate>
@end


@implementation LocationController
static LocationController *sharedLocation = nil;

+(LocationController *) sharedLocation{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
    sharedLocation = [[[self class]alloc]init];
    });
    return sharedLocation;

}

-(instancetype) init{
    self = [super init];
    if (self){
        _locationManager = [[CLLocationManager alloc]init];
        _locationManager.delegate = self;
        _locationManager.desiredAccuracy = kCLLocationAccuracyBest;
        _locationManager.distanceFilter = 100.0;
    }
    return self;
}

-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations{
    [self.delegate locationControllerDidUpdateLocation:[locations lastObject]];
    [self setLocation:[locations lastObject]];
    
}
@end
