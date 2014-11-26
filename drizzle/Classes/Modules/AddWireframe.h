//
//  AddWireframe.h
//  drizzle
//
//  Created by Nico Hämäläinen on 25/11/14.
//  Copyright (c) 2014 sizeof.io. All rights reserved.
//

@import Foundation;
@import UIKit;

@class AddPresenter;

@interface AddWireframe : NSObject

@property (nonatomic, strong) AddPresenter *addPresenter;

- (void)presentAddInterfaceFromViewController:(UIViewController *)viewController;
- (void)dismissAddInterface;

@end
