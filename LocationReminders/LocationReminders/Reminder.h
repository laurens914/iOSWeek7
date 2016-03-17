//
//  Reminder.h
//  LocationReminders
//
//  Created by Lauren Spatz on 3/16/16.
//  Copyright © 2016 Lauren Spatz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Parse/Parse.h>


@interface Reminder : PFObject <PFSubclassing>
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) PFGeoPoint *location;
@property (strong, nonatomic) NSNumber *radius;


@end
