//
//  AppDelegate.m
//  LocationReminders
//
//  Created by Lauren Spatz on 3/14/16.
//  Copyright © 2016 Lauren Spatz. All rights reserved.
//

#import "AppDelegate.h"
#import <Parse/Parse.h>

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    return YES;
}
-(void)setupParse{
    ParseClientConfiguration * configuration = [ParseClientConfiguration configurationWithBlock:^(id<ParseMutableClientConfiguration>  _Nonnull configuration) {
        configuration.applicationId = @"htrdfkyg";
        configuration.clientKey = @"gfckhjglk";
        configuration.server = @"http://localhost:1337/parse";
    }];
    [Parse initializeWithConfiguration:configuration];
}

@end
