//
//  AddWireframe.m
//  drizzle
//
//  Created by Nico Hämäläinen on 25/11/14.
//  Copyright (c) 2014 sizeof.io. All rights reserved.
//

#import "AddWireframe.h"

#import "AddPresenter.h"
#import "AddViewController.h"

static NSString *AddViewControllerIdentifier = @"AddViewController";

@interface AddWireframe () <UIViewControllerTransitioningDelegate>

@property (nonatomic, strong) UIViewController *presentedViewController;

@end

@implementation AddWireframe

- (void)presentAddInterfaceFromViewController:(UIViewController *)viewController
{
    AddViewController *addViewController = [self addViewController];
    addViewController.eventHandler = self.addPresenter;

    [viewController presentViewController:addViewController animated:YES completion:nil];

    self.presentedViewController = viewController;
}

- (void)dismissAddInterface
{
    [self.presentedViewController dismissViewControllerAnimated:YES completion:nil];
}

- (AddViewController *)addViewController
{
    UIStoryboard *storyboard = [self mainStoryboard];
    AddViewController *addViewController = [storyboard instantiateViewControllerWithIdentifier:AddViewControllerIdentifier];

    return addViewController;
}

- (UIStoryboard *)mainStoryboard
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main"
                                                         bundle:[NSBundle mainBundle]];

    return storyboard;
}

@end
