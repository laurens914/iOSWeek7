//
//  AppDelegate.m
//  LocationReminders
//
//  Created by Lauren Spatz on 3/14/16.
//  Copyright © 2016 Lauren Spatz. All rights reserved.
//

#import "AppDelegate.h"
#import <Parse/Parse.h>
#import "Reminder.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [self setupParse];
//    [self saveLocationToParse];
    [self getLocations];
    return YES;
}
-(void)setupParse{
    
    ParseClientConfiguration * configuration = [ParseClientConfiguration configurationWithBlock:^(id<ParseMutableClientConfiguration>  _Nonnull configuration) {
        configuration.applicationId = @"htrdfkyg";
        configuration.clientKey = @"gfckhjglk";
        configuration.server = @"http://localhost:1337/parse";
    }];
    [Parse initializeWithConfiguration:configuration];
    [Reminder registerSubclass];
}

-(void)saveLocationToParse
{
    PFGeoPoint *geoPoint = [PFGeoPoint geoPointWithLatitude:45.92 longitude:63.342];
    PFObject *gregorianStation = [PFObject objectWithClassName:@"Place"];
    gregorianStation[@"location"] = geoPoint;
    
    [gregorianStation saveInBackgroundWithBlock:^(BOOL succeeded, NSError * _Nullable error) {
        if (error){
            NSLog(@"%@", error);
        }if (succeeded){
            NSLog(@"success saving to database");
        }
    }];
}

-(void)getLocations{
    
    PFQuery *query = [PFQuery queryWithClassName:@"Place"];
    [query findObjectsInBackgroundWithBlock:^(NSArray * _Nullable objects, NSError * _Nullable error) {
        for (PFObject *object in objects) {
            PFGeoPoint *geoPoint = (PFGeoPoint *)object[@"location"];
            NSLog(@"GeoPoint is:%@", geoPoint);
        }
    }];
}

@end
