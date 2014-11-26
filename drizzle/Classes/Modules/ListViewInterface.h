//
//  ListViewInterface.h
//  drizzle
//
//  Created by Nico Hämäläinen on 25/11/14.
//  Copyright (c) 2014 sizeof.io. All rights reserved.
//

@import Foundation;

@class LocationDisplayData;

@protocol ListViewInterface <NSObject>

- (void)showNoContentMessage;
- (void)showLocationDisplayData:(LocationDisplayData *)data;
- (void)reloadEntries;

@end
