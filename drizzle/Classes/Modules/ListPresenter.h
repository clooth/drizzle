//
//  ListPresenter.h
//  drizzle
//
//  Created by Nico Hämäläinen on 25/11/14.
//  Copyright (c) 2014 sizeof.io. All rights reserved.
//

@import Foundation;

#import "AddModuleDelegateInterface.h"
#import "ListModuleInterface.h"
#import "ListInteractorIO.h"
#import "ListWireframe.h"

@protocol ListViewInterface;

@interface ListPresenter : NSObject <ListInteractorOutput, ListModuleInterface, AddModuleDelegate>

@property (nonatomic, strong) id<ListInteractorInput> listInteractor;
@property (nonatomic, strong) ListWireframe *listWireframe;

@property (nonatomic, strong) UIViewController<ListViewInterface> *userInterface;

@end
