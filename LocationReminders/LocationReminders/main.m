//
//  main.m
//  LocationReminders
//
//  Created by Lauren Spatz on 3/14/16.
//  Copyright © 2016 Lauren Spatz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "TuesdayCodeChallenge.h"

int main(int argc, char * argv[]) {
    @autoreleasepool {
        NSString *stringOne = @"selves";
        NSString *stringTwo = @"vessel";
        NSString *stringThree = @"seahawks";
        NSString *stringFour =@"mariners";
    [TuesdayCodeChallenge anagrams:stringOne stringTwo:stringTwo];
    [TuesdayCodeChallenge anagrams:stringThree stringTwo:stringFour];
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));

    }
}


