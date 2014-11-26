//
//  ListWireframe.h
//  drizzle
//
//  Created by Nico Hämäläinen on 25/11/14.
//  Copyright (c) 2014 sizeof.io. All rights reserved.
//

@import Foundation;
@import UIKit;

@class AddWireframe;
@class ListPresenter;
@class ListViewController;
@class RootWireframe;

@interface ListWireframe : NSObject

@property (nonatomic, strong) AddWireframe  *addWireframe;
@property (nonatomic, strong) ListPresenter *listPresenter;
@property (nonatomic, strong) RootWireframe *rootWireframe;

- (void)presentListInterfaceFromWindow:(UIWindow *)window;
- (void)presentAddInterface;

@end
