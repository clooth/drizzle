//
//  LocationDisplayDataCollector.m
//  drizzle
//
//  Created by Nico Hämäläinen on 25/11/14.
//  Copyright (c) 2014 sizeof.io. All rights reserved.
//

#import "LocationDisplayDataCollector.h"
#import "LocationDisplayData.h"
#import "LocationDisplayItem.h"
#import "LocationEntity.h"

#import "NSArray+Additions.h"

@interface LocationDisplayDataCollector ()

@property (nonatomic, strong) NSMutableArray *locations;

@end

@implementation LocationDisplayDataCollector

- (void)addLocations:(NSArray *)locations
{
    __block typeof(self) welf = self;

    [locations enumerateObjectsUsingBlock:^(LocationEntity *entity, NSUInteger idx, BOOL *stop) {
        [welf addLocation:entity];
    }];
}

- (void)addLocation:(LocationEntity *)item
{
    LocationDisplayItem *displayItem = [self displayItemForLocationItem:item];
    NSMutableArray *locations = self.locations;
    [locations addObject:displayItem];
}

#pragma mark - Display Items

- (LocationDisplayItem *)displayItemForLocationItem:(LocationEntity *)item
{
    return [LocationDisplayItem locationDisplayItemWithLocationName:item.locationName];
}

- (LocationDisplayData *)collectedDisplayData
{
    return [LocationDisplayData locationDisplayDataWithLocations:_locations];
}

#pragma mark - Lazy Properties

- (NSMutableArray *)locations
{
    if (_locations == nil) {
        _locations = [NSMutableArray array];
    }

    return _locations;
}


@end
