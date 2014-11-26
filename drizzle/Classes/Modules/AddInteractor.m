//
//  AddInteractor.m
//  drizzle
//
//  Created by Nico Hämäläinen on 25/11/14.
//  Copyright (c) 2014 sizeof.io. All rights reserved.
//

#import "AddInteractor.h"

#import "AddDataManager.h"
#import "LocationEntity.h"

@implementation AddInteractor

- (void)saveNewEntryWithLocationName:(NSString *)locationName
{
    LocationEntity *newEntry = [LocationEntity new];
    newEntry.locationName = locationName;

    [self.addDataManager addNewEntry:newEntry];
}

@end
