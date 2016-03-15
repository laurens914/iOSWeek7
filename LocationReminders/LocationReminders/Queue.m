//
//  Queue.m
//  LocationReminders
//
//  Created by Lauren Spatz on 3/14/16.
//  Copyright © 2016 Lauren Spatz. All rights reserved.
//

#import "Queue.h"
#import "LLNode.h"

@implementation Queue


-(id)init
{
    count = 0;
    queueArray = [[NSMutableArray alloc]init];
    return self;
    
}

-(void)enqueue:(id)object
{
    [queueArray addObject:object];
}

-(void)clear
{
    [queueArray removeAllObjects];
}

-(id)dequeue
{
   if([queueArray count] != 0)
   {
       id objc = [queueArray objectAtIndex:0];
       [queueArray removeObjectAtIndex:0];
       return objc;
   }
   else {
       return nil;
   }
}
@end
