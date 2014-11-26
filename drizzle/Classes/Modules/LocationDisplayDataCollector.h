//
//  LocationDisplayDataCollector.h
//  drizzle
//
//  Created by Nico Hämäläinen on 25/11/14.
//  Copyright (c) 2014 sizeof.io. All rights reserved.
//

@import Foundation;

@class LocationDisplayData;

@interface LocationDisplayDataCollector : NSObject

- (void)addLocations:(NSArray *)locations;
- (LocationDisplayData *)collectedDisplayData;

@end
