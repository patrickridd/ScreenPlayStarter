//
//  ScreenplayDetailViewController.m
//  Screenplay Starter
//
//  Created by Patrick Ridd on 10/22/16.
//  Copyright © 2016 PatrickRidd. All rights reserved.
//

#import "ScreenplayDetailViewController.h"

@interface ScreenplayDetailViewController ()

@property (weak, nonatomic) IBOutlet UITextField *titleTextField;
@property (weak, nonatomic) IBOutlet UITextView *textView;


@end

@implementation ScreenplayDetailViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}



- (IBAction)saveButtonTapped:(id)sender {
    NSString *title = _titleTextField.text;
    NSMutableString *newTitle = [[NSMutableString alloc]initWithString:title];
    [[ScreenplayController sharedInstance] createScreenplay:newTitle];
    _titleTextField.text = @"";
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
