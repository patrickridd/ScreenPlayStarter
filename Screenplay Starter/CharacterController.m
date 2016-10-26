//
//  CharacterController.m
//  Screenplay Starter
//
//  Created by Patrick Ridd on 10/23/16.
//  Copyright © 2016 PatrickRidd. All rights reserved.
//

#import "CharacterController.h"
#import <CoreData/CoreData.h>
#import "CoreDataStack.h"

@implementation CharacterController

+ (instancetype)sharedInstance
{
    static CharacterController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[CharacterController alloc] init];
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
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Character"];
    
    NSSortDescriptor *titleSort = [NSSortDescriptor sortDescriptorWithKey:@"name" ascending:NO];
    
    [request setSortDescriptors:@[titleSort]];
    
    NSManagedObjectContext *moc = [[CoreDataStack sharedInstance] managedObjectContext]; //Retrieve the main queue NSManagedObjectContext
    
    [self setFetchedResultsController:[[NSFetchedResultsController alloc] initWithFetchRequest:request managedObjectContext:moc sectionNameKeyPath:nil cacheName:nil]];
    
    NSError *error = nil;
    if (![[self fetchedResultsController] performFetch:&error]) {
        NSLog(@"Failed to initialize FetchedResultsController: %@\n%@", [error localizedDescription], [error userInfo]);
        abort();
    }
}


-(void)createCharacter:(NSString*)name characterDescription:(NSString*)characterDescription;
{
     NSManagedObjectContext *moc = [[CoreDataStack sharedInstance] managedObjectContext]; //Retrieve the main queue NSManagedObjectContext
    Character *character = [NSEntityDescription insertNewObjectForEntityForName:@"Character" inManagedObjectContext:moc];
    NSMutableString *newName = [[NSMutableString alloc]initWithString:name];
    NSMutableString *newCharacterDescription = [[NSMutableString alloc]initWithString:characterDescription];
    character.name = newName;
    character.charcterDescription = newCharacterDescription;
    
    [[CoreDataStack sharedInstance]saveContext];
}

-(void)removeCharacter:(Character*)character;
{
    NSManagedObjectContext *moc = [[CoreDataStack sharedInstance]managedObjectContext];
    [moc deleteObject:character];
    [[CoreDataStack sharedInstance]saveContext];
    
}

@end
