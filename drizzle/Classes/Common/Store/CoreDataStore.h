//
//  CoreDataStore.h
//  drizzle
//
//  Created by Nico Hämäläinen on 25/11/14.
//  Copyright (c) 2014 sizeof.io. All rights reserved.
//

@import Foundation;
@import CoreData;

@class ManagedLocationItem;

typedef void(^DataStoreFetchCompletionBlock)(NSArray *results);

@interface CoreDataStore : NSObject

- (void)fetchEntriesWithPredicate:(NSPredicate *)predicate
                  sortDescriptors:(NSArray *)sortDescriptors
                       completion:(DataStoreFetchCompletionBlock)block;

- (ManagedLocationItem *)newLocationItem;

- (void)save;

@end
