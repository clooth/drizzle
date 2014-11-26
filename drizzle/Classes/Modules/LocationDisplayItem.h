//
//  LocationDisplayItem.h
//  drizzle
//
//  Created by Nico Hämäläinen on 25/11/14.
//  Copyright (c) 2014 sizeof.io. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LocationDisplayItem : NSObject

@property (nonatomic, readonly, copy) NSString *locationName;

+ (instancetype)locationDisplayItemWithLocationName:(NSString *)locationName;

@end
