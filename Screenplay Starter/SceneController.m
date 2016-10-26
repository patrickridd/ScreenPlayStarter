//
//  SceneController.m
//  Screenplay Starter
//
//  Created by Patrick Ridd on 10/23/16.
//  Copyright © 2016 PatrickRidd. All rights reserved.
//

#import "SceneController.h"


@implementation SceneController


-(void)createScene:(NSString *)title withDescription:(NSString*)description withIndex:(int)sceneIndex;
{
    NSMutableString *sceneTitle = [[NSMutableString alloc]initWithString:title];
    NSMutableString *sceneDescription = [[NSMutableString alloc]initWithString:description];
   
    NSManagedObjectContext *moc = [[CoreDataStack sharedInstance]managedObjectContext];
  
    Scene *scene =  [NSEntityDescription insertNewObjectForEntityForName:@"Scene" inManagedObjectContext:moc];
   
    scene.title = sceneTitle;
    scene.sceneDescription = sceneDescription;
    scene.index = sceneIndex;
    
    
    
}



@end
