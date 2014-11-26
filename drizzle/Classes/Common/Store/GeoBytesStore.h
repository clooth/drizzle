//
//  GeoBytesStore.h
//  drizzle
//
//  Created by Nico Hämäläinen on 26/11/14.
//  Copyright (c) 2014 sizeof.io. All rights reserved.
//

@import Foundation;

typedef void(^GeoBytesFetchCompletionBlock)(NSArray *results);

@interface GeoBytesStore : NSObject

- (void)fetchCitiesWithQuery:(NSString *)queryString
                  completion:(GeoBytesFetchCompletionBlock)block;

@end
