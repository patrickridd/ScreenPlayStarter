//
//  ScreenplayController.m
//  Screenplay Starter
//
//  Created by Patrick Ridd on 10/23/16.
//  Copyright © 2016 PatrickRidd. All rights reserved.
//

#import "ScreenplayController.h"
#import "CoreDataStack.h"

@implementation ScreenplayController


+ (instancetype)sharedInstance
{
    static ScreenplayController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[ScreenplayController alloc] init];
    });
    return sharedInstance;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [CoreDataStack initialize];
        [self initializeFetchedResultsController];
    }
    return self;
}

- (void)initializeFetchedResultsController
{
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Screenplay"];
    
     NSSortDescriptor *titleSort = [NSSortDescriptor sortDescriptorWithKey:@"title" ascending:NO];
    
    [request setSortDescriptors:@[titleSort]];
    
    NSManagedObjectContext *moc = [[CoreDataStack sharedInstance] managedObjectContext]; //Retrieve the main queue NSManagedObjectContext
    
    [self setFetchedResultsController:[[NSFetchedResultsController alloc] initWithFetchRequest:request managedObjectContext:moc sectionNameKeyPath:nil cacheName:nil]];
    
    NSError *error = nil;
    if (![[self fetchedResultsController] performFetch:&error]) {
        NSLog(@"Failed to initialize FetchedResultsController: %@\n%@", [error localizedDescription], [error userInfo]);
        abort();
    }
}

-(void)createScreenplay:(NSMutableString*)title description:(NSMutableString*)description;
{
    NSManagedObjectContext *moc = [[CoreDataStack sharedInstance] managedObjectContext]; //Retrieve the main queue NSManagedObjectContext
    Screenplay *screenplay = [NSEntityDescription insertNewObjectForEntityForName:@"Screenplay" inManagedObjectContext:moc];
    screenplay.title = title;
    screenplay.basicDescription = description;
    
    [[CoreDataStack sharedInstance] saveContext];
    
}

-(void)removeScreenplay:(Screenplay*)screenplay;
{
    NSManagedObjectContext *moc = [[CoreDataStack sharedInstance]managedObjectContext];
    [moc deleteObject:screenplay];
    [[CoreDataStack sharedInstance]saveContext];
    
}



@end
