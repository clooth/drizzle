//
//  CoreDataStore.m
//  drizzle
//
//  Created by Nico Hämäläinen on 25/11/14.
//  Copyright (c) 2014 sizeof.io. All rights reserved.
//

#import "CoreDataStore.h"
#import "ManagedLocationItem.h"

@interface CoreDataStore ()

@property (nonatomic, strong) NSPersistentStoreCoordinator *persistentStoreCoordinator;
@property (nonatomic, strong) NSManagedObjectModel *managedObjectModel;
@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;

@end

@implementation CoreDataStore

- (instancetype)init
{
    self = [super init];
    if (self) {
        // Initialize managed object model for coordinator
        _managedObjectModel = [NSManagedObjectModel mergedModelFromBundles:nil];

        // Initialize coordinator with above object model
        _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:_managedObjectModel];

        // Figure out the documents directory
        NSFileManager *fm = [NSFileManager defaultManager];
        NSURL *documentsDirectory = [fm URLsForDirectory:NSDocumentDirectory
                                               inDomains:NSUserDomainMask].lastObject;

        // Set up SQLiteStore
        NSError *error = nil;
        NSDictionary *options = @{NSMigratePersistentStoresAutomaticallyOption: @(YES),
                                  NSInferMappingModelAutomaticallyOption: @(YES)};
        NSURL *storeURL = [documentsDirectory URLByAppendingPathComponent:@"drizzle.sqlite"];

        [_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType
                                                  configuration:nil
                                                            URL:storeURL
                                                        options:options
                                                          error:&error];

        // Finally set up context
        _managedObjectContext = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
        _managedObjectContext.persistentStoreCoordinator = self.persistentStoreCoordinator;
        _managedObjectContext.undoManager = nil;
    }

    return self;
}

#pragma mark - Fetching items

- (void)fetchEntriesWithPredicate:(NSPredicate *)predicate
                  sortDescriptors:(NSArray *)sortDescriptors
                       completion:(DataStoreFetchCompletionBlock)block
{
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"Location"];
    fetchRequest.predicate = predicate;
    fetchRequest.sortDescriptors = nil;

    [self.managedObjectContext performBlock:^{
        NSArray *results = [self.managedObjectContext executeFetchRequest:fetchRequest
                                                                    error:NULL];

        if (block) {
            block(results);
        }
    }];
}

#pragma mark - Creating and saving items

- (ManagedLocationItem *)newLocationItem
{
    NSEntityDescription *entityDescription = [NSEntityDescription entityForName:@"Location" inManagedObjectContext:_managedObjectContext];

    ManagedLocationItem *newEntry = (ManagedLocationItem *)[[NSManagedObject alloc] initWithEntity:entityDescription insertIntoManagedObjectContext:_managedObjectContext];

    return newEntry;
}

- (void)save
{
    [_managedObjectContext save:NULL];
}

@end
