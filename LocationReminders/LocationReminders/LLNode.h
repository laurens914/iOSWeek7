//
//  LLNode.h
//  LocationReminders
//
//  Created by Lauren Spatz on 3/14/16.
//  Copyright © 2016 Lauren Spatz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LLNode : NSObject
@property id objc;
@property LLNode * node;

-(instancetype)initWithobjc:(id) objc;

@end
