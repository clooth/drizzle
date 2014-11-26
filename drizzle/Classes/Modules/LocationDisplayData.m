//
//  LocationDisplayData.m
//  drizzle
//
//  Created by Nico Hämäläinen on 25/11/14.
//  Copyright (c) 2014 sizeof.io. All rights reserved.
//

#import "LocationDisplayData.h"

@interface LocationDisplayData ()

@property (nonatomic, copy) NSArray *locations;

@end

@implementation LocationDisplayData

+ (instancetype)locationDisplayDataWithLocations:(NSArray *)locations
{
    LocationDisplayData *data = [LocationDisplayData new];
    data.locations = locations;
    return data;
}

- (BOOL)isEqualToLocationDisplayData:(LocationDisplayData *)data
{
    if (!data) {
        return NO;
    }

    return [self.locations isEqualToArray:data.locations];
}

- (BOOL)isEqual:(id)other
{
    if (other == self) {
        return YES;
    }

    if (![other isKindOfClass:[LocationDisplayData class]]) {
        return NO;
    }

    return [self isEqualToLocationDisplayData:other];
}

- (NSUInteger)hash
{
    return [self.locations hash];
}

@end
