//
//  ListInteractor.h
//  drizzle
//
//  Created by Nico Hämäläinen on 25/11/14.
//  Copyright (c) 2014 sizeof.io. All rights reserved.
//

@import Foundation;
#import "ListInteractorIO.h"

@class ListDataManager;

@interface ListInteractor : NSObject <ListInteractorInput>

@property (nonatomic, weak) id<ListInteractorOutput> output;

- (instancetype)initWithDataManager:(ListDataManager *)dataManager;

@end
