//
//  CharacterController.h
//  Screenplay Starter
//
//  Created by Patrick Ridd on 10/23/16.
//  Copyright © 2016 PatrickRidd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CoreDataStack.h"
#import "Character.h"

@interface CharacterController : NSObject

@property (nonatomic, strong) NSFetchedResultsController *fetchedResultsController;
+ (instancetype)sharedInstance;
-(void)removeCharacter:(Character*)character;
-(void)createCharacter:(NSString*)name characterDescription:(NSString*)characterDescription;


@end
