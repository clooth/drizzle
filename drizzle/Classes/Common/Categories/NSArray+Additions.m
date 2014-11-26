//
//  NSArray+Additions.m
//  drizzle
//
//  Created by Nico Hämäläinen on 25/11/14.
//  Copyright (c) 2014 sizeof.io. All rights reserved.
//

#import "NSArray+Additions.h"

@implementation NSArray (Additions)

- (NSArray *)arrayFromObjectsCollectedWithBlock:(id(^)(id object))block
{
    __block NSMutableArray *collection = [NSMutableArray arrayWithCapacity:self.count];

    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        [collection addObject:block(obj)];
    }];

    return collection;
}

@end
