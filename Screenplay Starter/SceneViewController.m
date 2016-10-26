//
//  SceneViewController.m
//  Screenplay Starter
//
//  Created by Patrick Ridd on 10/22/16.
//  Copyright © 2016 PatrickRidd. All rights reserved.
//

#import "SceneViewController.h"

@interface SceneViewController ()

@property (weak,nonatomic) IBOutlet UIImageView *sceneImageView;
@property (weak, nonatomic) IBOutlet UITextView *sceneDescriptionTextView;


@end

@implementation SceneViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self updateWithScene:[self scene]];
}

-(void)updateWithScene:(Scene*)scene {
    self.sceneImageView.image = scene.sceneImage;
    self.sceneDescriptionTextView.text = scene.description;
}


- (IBAction)imageViewTapped:(id)sender {
    
    
}



@end
