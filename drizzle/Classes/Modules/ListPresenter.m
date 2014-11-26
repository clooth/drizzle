//
//  ListPresenter.m
//  drizzle
//
//  Created by Nico Hämäläinen on 25/11/14.
//  Copyright (c) 2014 sizeof.io. All rights reserved.
//

#import "ListPresenter.h"

#import "ListInteractor.h"
#import "ListViewInterface.h"
#import "ListWireframe.h"
#import "LocationDisplayDataCollector.h"

@implementation ListPresenter

- (void)updateView
{
    [self.listInteractor findLocations];
}

#pragma mark - ListInteractorOutput

- (void)foundLocations:(NSArray *)locations
{
    if (locations.count == 0) {
        [self.userInterface showNoContentMessage];
    }
    else {
        [self updateUserInterfaceWithLocations:locations];
    }
}

- (void)updateUserInterfaceWithLocations:(NSArray *)locations
{
    [self.userInterface showLocationDisplayData:[self locationDisplayDataWithItems:locations]];
}

- (LocationDisplayData *)locationDisplayDataWithItems:(NSArray *)locations
{
    LocationDisplayDataCollector *collector = [LocationDisplayDataCollector new];
    [collector addLocations:locations];
    return [collector collectedDisplayData];
}

#pragma mark - 

- (void)addNewEntry
{
    [self.listWireframe presentAddInterface];
}

- (void)addModuleDidCancelAddAction
{
    // No action required
}

- (void)addModuleDidSaveAddAction
{
    [self updateView];
}

@end
