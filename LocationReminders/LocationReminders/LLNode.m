//
//  LLNode.m
//  LocationReminders
//
//  Created by Lauren Spatz on 3/14/16.
//  Copyright © 2016 Lauren Spatz. All rights reserved.
//

#import "LLNode.h"

@implementation LLNode

-(instancetype)initWithobjc:(id)objc{
    self = [super init];
    if (self){
        self.objc = objc;
    }
    return self; 
}


@end
