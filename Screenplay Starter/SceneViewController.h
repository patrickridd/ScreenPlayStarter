//
//  SceneViewController.h
//  Screenplay Starter
//
//  Created by Patrick Ridd on 10/22/16.
//  Copyright © 2016 PatrickRidd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Scene.h"

@interface SceneViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate>
@property (strong) Scene *scene;


@end
