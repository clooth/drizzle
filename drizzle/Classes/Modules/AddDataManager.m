//
//  AddDataManager.m
//  drizzle
//
//  Created by Nico Hämäläinen on 25/11/14.
//  Copyright (c) 2014 sizeof.io. All rights reserved.
//

#import "AddDataManager.h"

#import "ManagedLocationItem.h"
#import "CoreDataStore.h"
#import "LocationEntity.h"

@implementation AddDataManager

- (void)addNewEntry:(LocationEntity *)entry
{
    ManagedLocationItem *newEntry = [self.dataStore newLocationItem];
    newEntry.locationName = entry.locationName;

    [self.dataStore save];
}

@end
