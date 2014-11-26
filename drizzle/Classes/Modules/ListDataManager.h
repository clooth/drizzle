//
//  ListDataManager.h
//  drizzle
//
//  Created by Nico Hämäläinen on 25/11/14.
//  Copyright (c) 2014 sizeof.io. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CoreDataStore;

typedef void(^ListDataManagerFetchEntriesBlock)(NSArray *entries);

@interface ListDataManager : NSObject

@property (nonatomic, strong) CoreDataStore *dataStore;

- (void)locationsWithCompletion:(void (^)(NSArray *locations))block;

@end
