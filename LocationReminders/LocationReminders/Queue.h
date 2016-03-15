//
//  Queue.h
//  LocationReminders
//
//  Created by Lauren Spatz on 3/14/16.
//  Copyright © 2016 Lauren Spatz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LLNode.h"

@interface Queue : NSObject
{
    NSMutableArray *queueArray;
    NSInteger count;
}
@property LLNode *head;
@property LLNode *tail;


-(void)enqueue:(id)object;
-(void)clear;
-(id)dequeue;

@end
