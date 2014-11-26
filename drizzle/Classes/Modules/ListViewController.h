//
//  ListViewController.h
//  drizzle
//
//  Created by Nico Hämäläinen on 25/11/14.
//  Copyright (c) 2014 sizeof.io. All rights reserved.
//

@import UIKit;

#import "ListViewInterface.h"
#import "ListModuleInterface.h"

@interface ListViewController : UICollectionViewController <ListViewInterface>

@property (nonatomic, strong) IBOutlet UIView *noContentView;
@property (nonatomic, strong) id<ListModuleInterface> eventHandler;

@end
