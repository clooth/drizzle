//
//  ListInteractor.m
//  drizzle
//
//  Created by Nico Hämäläinen on 25/11/14.
//  Copyright (c) 2014 sizeof.io. All rights reserved.
//

#import "ListInteractor.h"
#import "ListDataManager.h"
#import "LocationEntity.h"
#import "NSArray+Additions.h"

@interface ListInteractor ()

@property (nonatomic, strong) ListDataManager *dataManager;

@end

@implementation ListInteractor

- (instancetype)initWithDataManager:(ListDataManager *)dataManager
{
    self = [super init];
    if (self) {
        _dataManager = dataManager;
    }
    return self;
}

#pragma mark - Finding items

- (void)findLocations
{
    __weak typeof(self) welf = self;

    [self.dataManager locationsWithCompletion:^(NSArray *locations) {
        [welf.output foundLocations:locations];
    }];
}

@end
