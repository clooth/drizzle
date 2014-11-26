//
//  AddModuleDelegateInterface.h
//  drizzle
//
//  Created by Nico Hämäläinen on 25/11/14.
//  Copyright (c) 2014 sizeof.io. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol AddModuleDelegate <NSObject>

- (void)addModuleDidCancelAddAction;
- (void)addModuleDidSaveAddAction;

@end
