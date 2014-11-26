//
//  ListDataManager.m
//  drizzle
//
//  Created by Nico Hämäläinen on 25/11/14.
//  Copyright (c) 2014 sizeof.io. All rights reserved.
//

#import "ListDataManager.h"
#import "NSArray+Additions.h"

#import "CoreDataStore.h"
#import "ManagedLocationItem.h"
#import "LocationEntity.h"

@implementation ListDataManager

- (void)locationsWithCompletion:(void (^)(NSArray *))block
{
    __weak typeof(self) welf = self;

    [self.dataStore fetchEntriesWithPredicate:nil
                              sortDescriptors:@[]
                                   completion:^(NSArray *results) {
                                       if (block) {
                                           block([welf locationItemsFromDataStoreEntities:results]);
                                       }
                                   }];
}

- (NSArray *)locationItemsFromDataStoreEntities:(NSArray *)entries
{
    return [entries arrayFromObjectsCollectedWithBlock:^id(ManagedLocationItem *item) {
        return [LocationEntity locationWithLocationName:item.locationName];
    }];
}

@end
