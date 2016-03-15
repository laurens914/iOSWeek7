//
//  Stack.h
//  LocationReminders
//
//  Created by Lauren Spatz on 3/14/16.
//  Copyright © 2016 Lauren Spatz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LLNode.h"
@interface Stack : NSObject
{
    NSMutableArray * stackArray;
    NSInteger count;
}

@property LLNode *head;
@property LLNode *tail;

-(void)push: (id) value;
-(id)pop;
-(void)clear;

@end
