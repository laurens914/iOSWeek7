//
//  NSString+Additions.m
//  LocationReminders
//
//  Created by Lauren Spatz on 3/16/16.
//  Copyright © 2016 Lauren Spatz. All rights reserved.
//

#import "NSString+Additions.h"

@implementation NSString (Additions)

-(BOOL)isValidNumber{
    return [[NSPredicate predicateWithFormat:@"SELF MATCHES %@", @"^[0-9]+$"]evaluateWithObject:self];
}
@end
