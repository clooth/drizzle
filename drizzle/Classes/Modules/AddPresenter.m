//
//  AddPresenter.m
//  drizzle
//
//  Created by Nico Hämäläinen on 25/11/14.
//  Copyright (c) 2014 sizeof.io. All rights reserved.
//

#import "AddPresenter.h"

#import "AddModuleDelegateInterface.h"

#import "AddInteractor.h"
#import "AddViewInterface.h"
#import "AddWireframe.h"

@implementation AddPresenter

- (void)cancelAddAction
{
    [self.addWireframe dismissAddInterface];
    [self.addModuleDelegate addModuleDidCancelAddAction];
}

- (void)saveAddActionWithLocationName:(NSString *)locationName
{
    [self.addInteractor saveNewEntryWithLocationName:locationName];
    [self.addWireframe dismissAddInterface];
    [self.addModuleDelegate addModuleDidSaveAddAction];
}

@end
