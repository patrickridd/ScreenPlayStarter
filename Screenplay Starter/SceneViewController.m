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
@property (strong, nonatomic) UIImagePickerController *imagePicker;

@end

@implementation SceneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.imagePicker = [[UIImagePickerController alloc]init];
    self.imagePicker.delegate = self;
    self.imagePicker.allowsEditing = YES;
    
    [self updateWithScene:[self scene]];
}

-(void)updateWithScene:(Scene*)scene {
    self.sceneImageView.image = scene.sceneImage;
    self.sceneDescriptionTextView.text = scene.description;
}

- (IBAction)saveButtonTapped:(id)sender {
    self.scene.sceneImage = self.sceneImageView.image;
    NSMutableString *sceneDescription = [[NSMutableString alloc]initWithString:self.sceneDescriptionTextView.text];
    self.scene.sceneDescription = sceneDescription;
    
}

- (IBAction)imageViewTapped:(id)sender {
    
    UIAlertController *imageActionSheet = [UIAlertController alertControllerWithTitle:@"Choose Image Source" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    
    UIAlertAction *cameraAction = [UIAlertAction actionWithTitle:@"Camera" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action)
        {
            self.imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
            [self presentViewController:[self imagePicker] animated:YES completion:NULL];
        }];
    UIAlertAction *photoLibraryAction = [UIAlertAction actionWithTitle:@"Photo Library" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        self.imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;

        [self presentViewController:self.imagePicker animated:YES completion:NULL];
    }];
    
    [imageActionSheet addAction:cameraAction];
    [imageActionSheet addAction:photoLibraryAction];
    
    [self presentViewController:imageActionSheet animated:YES completion:NULL];
    
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    UIImage *chosenImage = info[UIImagePickerControllerEditedImage];
    self.sceneImageView.image = chosenImage;
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
}


@end
