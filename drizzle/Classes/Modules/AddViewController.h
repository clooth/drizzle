//
//  AddViewController.h
//  drizzle
//
//  Created by Nico Hämäläinen on 26/11/14.
//  Copyright (c) 2014 sizeof.io. All rights reserved.
//

@import Foundation;
@import UIKit;

#import "AddModuleInterface.h"
#import "AddViewInterface.h"

@interface AddViewController : UIViewController <AddViewInterface>

@property (nonatomic, strong) id<AddModuleInterface> eventHandler;
@property (nonatomic, strong) UIView *transitioningBackgroundView;

@end
