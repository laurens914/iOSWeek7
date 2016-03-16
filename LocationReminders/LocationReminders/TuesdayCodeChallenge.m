//
//  TuesdayCodeChallenge.m
//  LocationReminders
//
//  Created by Lauren Spatz on 3/15/16.
//  Copyright © 2016 Lauren Spatz. All rights reserved.
//

#import "TuesdayCodeChallenge.h"

@implementation TuesdayCodeChallenge


+(BOOL)anagrams:(NSString *)stringOne stringTwo:(NSString *)stringTwo
{
    NSUInteger stringLength = stringOne.length;
    if (stringLength != stringTwo.length){
        NSLog(@"not anagrams");
        return NO;
    }

    
    for (int a = 0; a < stringLength; a ++)
    {
        for(int b = 0; b < stringLength; b ++){
            if ([stringOne characterAtIndex:a] == [stringTwo characterAtIndex:b]){
                continue;
            } if ([stringTwo characterAtIndex:b] == [stringOne characterAtIndex:a]){
                continue;
            }
        }
    }
    NSLog(@"yes");
    return YES;
}

@end
