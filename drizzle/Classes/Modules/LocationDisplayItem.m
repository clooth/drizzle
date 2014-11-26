//
//  LocationDisplayItem.m
//  drizzle
//
//  Created by Nico Hämäläinen on 25/11/14.
//  Copyright (c) 2014 sizeof.io. All rights reserved.
//

#import "LocationDisplayItem.h"

@interface LocationDisplayItem ()

@property (nonatomic, copy) NSString *locationName;

@end

@implementation LocationDisplayItem

+ (instancetype)locationDisplayItemWithLocationName:(NSString *)locationName
{
    LocationDisplayItem *item = [LocationDisplayItem new];
    item.locationName = locationName;
    return item;
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"%@    %@",
            [super description],
            self.locationName];
}

- (BOOL)isEqualToLocationDisplayItem:(LocationDisplayItem *)item
{
    if (!item) {
        return NO;
    }

    return [self.locationName isEqualToString:item.locationName];
}

- (BOOL)isEqual:(id)object
{
    if (self == object) {
        return YES;
    }

    if (![object isKindOfClass:[LocationDisplayItem class]]) {
        return NO;
    }

    return [self isEqualToLocationDisplayItem:object];
}

- (NSUInteger)hash
{
    return [self.locationName hash];
}

@end
