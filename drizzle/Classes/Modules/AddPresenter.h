//
//  AddPresenter.h
//  drizzle
//
//  Created by Nico Hämäläinen on 25/11/14.
//  Copyright (c) 2014 sizeof.io. All rights reserved.
//

@import Foundation;

#import "AddModuleInterface.h"

@class AddInteractor;
@class AddWireframe;

@protocol AddModuleDelegate;
@protocol AddViewInterface;

@interface AddPresenter : NSObject <AddModuleInterface>

@property (nonatomic, strong) AddInteractor *addInteractor;
@property (nonatomic, strong) AddWireframe  *addWireframe;

@property (nonatomic, weak) id<AddModuleDelegate> addModuleDelegate;

@end
