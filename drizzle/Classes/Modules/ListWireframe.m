//
//  ListWireframe.m
//  drizzle
//
//  Created by Nico Hämäläinen on 25/11/14.
//  Copyright (c) 2014 sizeof.io. All rights reserved.
//

#import "ListWireframe.h"

#import "AddWireframe.h"
#import "ListPresenter.h"
#import "ListViewController.h"
#import "RootWireframe.h"

#import "LocationDisplayData.h"
#import "LocationDisplayItem.h"

static NSString *ListViewControllerIdentifier = @"ListViewController";

@interface ListWireframe ()

@property (nonatomic, strong) ListViewController *listViewController;

@end

@implementation ListWireframe


- (void)presentListInterfaceFromWindow:(UIWindow *)window
{
    ListViewController *listViewController = [self listViewControllerFromStoryboard];
    listViewController.eventHandler = self.listPresenter;

    self.listPresenter.userInterface = listViewController;
    self.listViewController = listViewController;

    [self.rootWireframe showRootViewController:listViewController
                                      inWindow:window];
}

- (void)presentAddInterface
{
    [self.addWireframe presentAddInterfaceFromViewController:self.listViewController];
}

- (ListViewController *)listViewControllerFromStoryboard
{
    UIStoryboard *storyboard = [self mainStoryboard];

    ListViewController *viewController = [storyboard instantiateViewControllerWithIdentifier:ListViewControllerIdentifier];
    return viewController;
}

- (UIStoryboard *)mainStoryboard
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main"
                                                         bundle:[NSBundle mainBundle]];

    return storyboard;
}

@end
