//
//  ListInteractorIO.h
//  drizzle
//
//  Created by Nico Hämäläinen on 25/11/14.
//  Copyright (c) 2014 sizeof.io. All rights reserved.
//

@import Foundation;

@protocol ListInteractorInput <NSObject>

- (void)findLocations;

@end


@protocol ListInteractorOutput <NSObject>

- (void)foundLocations:(NSArray *)locations;

@end
