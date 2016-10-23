//
//  ScreenplayController.h
//  Screenplay Starter
//
//  Created by Patrick Ridd on 10/23/16.
//  Copyright © 2016 PatrickRidd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "Screenplay.h"

@interface ScreenplayController : NSObject

@property (nonatomic, strong) NSFetchedResultsController *fetchedResultsController;
+ (instancetype)sharedInstance;
-(void)createScreenplay:(NSMutableString*)title;


@end
