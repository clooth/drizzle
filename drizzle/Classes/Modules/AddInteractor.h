//
//  AddInteractor.h
//  drizzle
//
//  Created by Nico Hämäläinen on 25/11/14.
//  Copyright (c) 2014 sizeof.io. All rights reserved.
//

@import Foundation;

@class AddDataManager;

@interface AddInteractor : NSObject

@property (nonatomic, strong) AddDataManager *addDataManager;

- (void)saveNewEntryWithLocationName:(NSString *)locationName;

@end
