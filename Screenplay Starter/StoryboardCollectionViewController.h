//
//  StoryboardCollectionViewController.h
//  Screenplay Starter
//
//  Created by Patrick Ridd on 10/22/16.
//  Copyright © 2016 PatrickRidd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Scene.h"
#import "SceneController.h"

@interface StoryboardCollectionViewController : UICollectionViewController

@property (weak) NSMutableArray *scenes;

@end
