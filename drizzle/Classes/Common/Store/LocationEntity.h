//
//  LocationEntity.h
//  drizzle
//
//  Created by Nico Hämäläinen on 25/11/14.
//  Copyright (c) 2014 sizeof.io. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LocationEntity : NSObject

@property (nonatomic, copy) NSString *locationName;

+ (instancetype)locationWithLocationName:(NSString *)locationName;

@end
