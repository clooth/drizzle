//
//  AppDelegate.m
//  drizzle
//
//  Created by Nico Hämäläinen on 25/11/14.
//  Copyright (c) 2014 sizeof.io. All rights reserved.
//

#import "AppDelegate.h"
#import "AppDependencies.h"

@interface AppDelegate ()

@property (nonatomic, strong) AppDependencies *dependencies;

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    AppDependencies *dependencies = [AppDependencies new];
    self.dependencies = dependencies;

    [self.dependencies installRootViewControllerIntoWindow:self.window];

    return YES;
}

@end
