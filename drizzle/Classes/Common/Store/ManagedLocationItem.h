//
//  ManagedLocationItem.h
//  drizzle
//
//  Created by Nico Hämäläinen on 25/11/14.
//  Copyright (c) 2014 sizeof.io. All rights reserved.
//

@import Foundation;
@import CoreData;
@import CoreLocation;

@interface ManagedLocationItem : NSManagedObject

// Weather city and country
@property (nonatomic, strong) NSString *locationName;

@end
