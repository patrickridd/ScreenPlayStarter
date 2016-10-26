//
//  CharacterDetailViewController.m
//  Screenplay Starter
//
//  Created by Patrick Ridd on 10/22/16.
//  Copyright © 2016 PatrickRidd. All rights reserved.
//

#import "CharacterDetailViewController.h"

@interface CharacterDetailViewController ()

@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextView *descriptionTextView;


@end

@implementation CharacterDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self updateWithCharacter:[self character]];
}

-(void)updateWithCharacter:(Character*)character
{

    NSString *name = character.name;
    NSString *characterDescription = character.charcterDescription;
    
    self.nameTextField.text = name;
    self.descriptionTextView.text = characterDescription;
}

- (IBAction)saveButtonTapped:(id)sender
{
    
    // If user did not enter name in textfield dont save and return
    if ([[[self nameTextField]text] isEqual:@""])
        return;
    NSString *name = [[self nameTextField]text];
    NSString *characterDescription = [[self descriptionTextView]text];
    
    [[CharacterController sharedInstance]createCharacter:name characterDescription:characterDescription];
    [[self navigationController] popToRootViewControllerAnimated:true];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
