//
//  LocationDisplayData.h
//  drizzle
//
//  Created by Nico Hämäläinen on 25/11/14.
//  Copyright (c) 2014 sizeof.io. All rights reserved.
//

@import Foundation;

@interface LocationDisplayData : NSObject

@property (copy, readonly, nonatomic) NSArray *locations;

+ (instancetype)locationDisplayDataWithLocations:(NSArray *)locations;

@end
