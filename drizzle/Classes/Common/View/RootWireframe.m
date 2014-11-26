//
//  RootWireframe.m
//  drizzle
//
//  Created by Nico Hämäläinen on 25/11/14.
//  Copyright (c) 2014 sizeof.io. All rights reserved.
//

#import "RootWireframe.h"

@implementation RootWireframe

- (void)showRootViewController:(UIViewController *)viewController
                      inWindow:(UIWindow *)window
{
    UINavigationController *navigationController;
    navigationController = [self navigationControllerFromWindow:window];
    navigationController.viewControllers = @[viewController];
}

- (UINavigationController *)navigationControllerFromWindow:(UIWindow *)window
{
    return (UINavigationController *)window.rootViewController;
}

@end
