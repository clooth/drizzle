//
//  AddDataManager.h
//  drizzle
//
//  Created by Nico Hämäläinen on 25/11/14.
//  Copyright (c) 2014 sizeof.io. All rights reserved.
//

@import Foundation;

@class CoreDataStore;
@class LocationEntity;

@interface AddDataManager : NSObject

@property (nonatomic, strong) CoreDataStore *dataStore;

- (void)addNewEntry:(LocationEntity *)entry;

@end
