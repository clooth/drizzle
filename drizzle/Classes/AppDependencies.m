//
//  AppDependencies.m
//  drizzle
//
//  Created by Nico Hämäläinen on 25/11/14.
//  Copyright (c) 2014 sizeof.io. All rights reserved.
//

#import "AppDependencies.h"

#import "RootWireframe.h"

#import "CoreDataStore.h"


#import "ListDataManager.h"
#import "ListInteractor.h"
#import "ListPresenter.h"
#import "ListWireframe.h"

#import "AddDataManager.h"
#import "AddInteractor.h"
#import "AddPresenter.h"
#import "AddWireframe.h"

@interface AppDependencies ()

@property (nonatomic, strong) ListWireframe *listWireframe;

@end

@implementation AppDependencies

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self configureDependencies];
    }
    return self;
}

- (void)installRootViewControllerIntoWindow:(UIWindow *)window
{
    [self.listWireframe presentListInterfaceFromWindow:window];
}

- (void)configureDependencies
{
    // Root Level Classes
    CoreDataStore *dataStore     = [CoreDataStore new];
    RootWireframe *rootWireframe = [RootWireframe new];

    // List Module's Classes
    ListWireframe *listWireframe     = [ListWireframe new];
    ListPresenter *listPresenter     = [ListPresenter new];
    ListDataManager *listDataManager = [ListDataManager new];
    ListInteractor *listInteractor   = [[ListInteractor alloc] initWithDataManager:listDataManager];

    // Add Module's Classes
    AddWireframe *addWireframe     = [AddWireframe new];
    AddInteractor *addInteractor   = [AddInteractor new];
    AddPresenter *addPresenter     = [AddPresenter new];
    AddDataManager *addDataManager = [AddDataManager new];

    // List Module Classes
    listInteractor.output        = listPresenter;

    listPresenter.listInteractor = listInteractor;
    listPresenter.listWireframe  = listWireframe;

    listWireframe.addWireframe   = addWireframe;
    listWireframe.listPresenter  = listPresenter;
    listWireframe.rootWireframe  = rootWireframe;
    self.listWireframe           = listWireframe;

    listDataManager.dataStore    = dataStore;

    // Add Module Classes
    addInteractor.addDataManager = addDataManager;

    addPresenter.addInteractor = addInteractor;

    addWireframe.addPresenter = addPresenter;

    addPresenter.addWireframe = addWireframe;
    addPresenter.addModuleDelegate = listPresenter;

    addDataManager.dataStore = dataStore;
}

@end
