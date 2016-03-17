//
//  Reminder.m
//  LocationReminders
//
//  Created by Lauren Spatz on 3/16/16.
//  Copyright © 2016 Lauren Spatz. All rights reserved.
//

#import "Reminder.h"
#import <Parse/PFObject+Subclass.h>

@implementation Reminder

@dynamic name,location,radius;

+(void)load{
    [self registerSubclass];
}

+(NSString *)parseClassName {
    return @"Reminder";
}

@end
