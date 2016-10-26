//
//  Scene.h
//  Screenplay Starter
//
//  Created by Patrick Ridd on 10/22/16.
//  Copyright © 2016 PatrickRidd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import <UIKit/UIKit.h>

@interface Scene : NSManagedObjectContext

@property (nonatomic, strong) UIImage *sceneImage;
@property (nonatomic, strong) NSMutableString *title;
@property int index;
@property (nonatomic, strong) NSMutableString *sceneDescription;

@end
