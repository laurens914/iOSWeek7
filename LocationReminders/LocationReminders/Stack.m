//
//  Stack.m
//  LocationReminders
//
//  Created by Lauren Spatz on 3/14/16.
//  Copyright © 2016 Lauren Spatz. All rights reserved.
//

#import "Stack.h"
#import "LLNode.h"

@implementation Stack

-(id)init
{
    count = 0;
    stackArray = [[NSMutableArray alloc]init];
    self.head = nil;
    return self;
    
}

-(void)push:(id)object
{
//with linked list
    LLNode *new = [[LLNode alloc]init];
        new.node = self.head;
        self.head = new;
//with array
    [stackArray addObject:object];
    count = [stackArray count];
}


-(id)pop
{
// with linked list
    id popLLObjc = nil;
    if(self.head){
        popLLObjc = self.head.objc;
        self.head = self.head.node;
    }
    return popLLObjc;
    
//with array
    id popObjc = [stackArray objectAtIndex:([stackArray count]-1)];
    [stackArray removeLastObject];
    count = count-1;
    return popObjc;
}

-(void)clear
{
    [stackArray removeAllObjects];
    count = 0;
}
@end
