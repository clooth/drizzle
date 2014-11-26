//
//  LocationEntity.m
//  drizzle
//
//  Created by Nico Hämäläinen on 25/11/14.
//  Copyright (c) 2014 sizeof.io. All rights reserved.
//

#import "LocationEntity.h"

@implementation LocationEntity

+ (instancetype)locationWithLocationName:(NSString *)locationName
{
    LocationEntity *entity = [self new];
    entity.locationName = locationName;
    return entity;
}

@end
