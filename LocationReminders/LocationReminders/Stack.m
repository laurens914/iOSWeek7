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
// with linked list, not quite sure what to do here with a linked list. i know we want to remove the last object and then make the next to last object the tail, not sure if this is the right track.
    id popLLObjc = nil;
    if(self.tail){
        popLLObjc = self.tail.objc;
        self.tail = self.tail.node;
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
