//
//  WednesdayCodingChallenge.m
//  LocationReminders
//
//  Created by Lauren Spatz on 3/16/16.
//  Copyright © 2016 Lauren Spatz. All rights reserved.
//

#import "WednesdayCodingChallenge.h"

@implementation WednesdayCodingChallenge

+(int)sumOfNumbersOnly:(NSString *)testString{
    NSCharacterSet *characters = [NSCharacterSet characterSetWithCharactersInString:@"abcdefghijklomnopqrstuv +-*,/!@#$%^()'?<>=_:;."];
    NSArray *values = [testString componentsSeparatedByCharactersInSet:characters];
    int sum = 0;
    for (NSString *number in values){
        sum += [number intValue];
    }
    NSLog(@"%d",sum);
    return sum;
}

//+(int)sumNum:(NSString *)string2{
//    NSNumberFormatter *numberString = [[NSNumberFormatter alloc]init];
//    NSNumber * number = [numberString numberFromString:string2];
//    NSArray *values = [[NSArray alloc]init];
//    NSLog(@"%@", number);
//    int sum = 0;
//    for(NSNumber * numbers in values){
//        sum += [numbers intValue];
//    }
//    NSLog(@"%d",sum);
//    return sum;
//}

@end
