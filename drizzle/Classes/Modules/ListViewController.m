//
//  ListViewController.m
//  drizzle
//
//  Created by Nico Hämäläinen on 25/11/14.
//  Copyright (c) 2014 sizeof.io. All rights reserved.
//

#import "ListViewController.h"
#import "LocationEntity.h"
#import "LocationDisplayData.h"
#import "LocationDisplayItem.h"

static NSString* const ListEntryCellIdentifier = @"ListEntryCell";

@interface ListViewController () <UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) LocationDisplayData *data;
@property (nonatomic, strong) UICollectionView *strongCollectionView;

@end

@implementation ListViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.strongCollectionView = self.collectionView;
    [self configureView];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.eventHandler updateView];
}

- (void)configureView
{
    self.navigationItem.title = @"Drizzle";

    UIBarButtonItem *addItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                                                                             target:self
                                                                             action:@selector(didTapAddButton:)];
    self.navigationItem.rightBarButtonItem = addItem;
}

- (void)didTapAddButton:(id)sender
{
    [self.eventHandler addNewEntry];
}

- (void)showNoContentMessage
{
    self.view = self.noContentView;
}

- (void)showLocationDisplayData:(LocationDisplayData *)data
{
    self.view = self.strongCollectionView;
    self.data = data;

    [self reloadEntries];
}

- (void)reloadEntries
{
    [self.collectionView reloadData];
}

#pragma mark - UICollectionViewDelegate and DataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.data.locations.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    LocationDisplayItem *item  = self.data.locations[indexPath.item];

    UICollectionViewCell *cell = [self.collectionView dequeueReusableCellWithReuseIdentifier:ListEntryCellIdentifier
                                                                                forIndexPath:indexPath];

    UILabel *cityLabel    = (UILabel *)[cell viewWithTag:101];

    cityLabel.text = item.locationName;

    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(self.view.frame.size.width, 160.0);
}

@end
