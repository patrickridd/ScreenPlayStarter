//
//  ScreenplayDetailViewController.m
//  Screenplay Starter
//
//  Created by Patrick Ridd on 10/22/16.
//  Copyright © 2016 PatrickRidd. All rights reserved.
//

#import "ScreenplayDetailViewController.h"
#import "Screenplay.h"
#import "Scene.h"
#import "Character.h"
#import <CoreData/CoreData.h>

@interface ScreenplayDetailViewController ()

@property (weak, nonatomic) IBOutlet UITextField *titleTextField;
@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@end

@implementation ScreenplayDetailViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    [self updateScreenplayDetail:[self screenplay]];
}



-(void)updateScreenplayDetail:(Screenplay*)screenplay {
    if ([[screenplay title] isEqualToString:@""])
        return;
    NSString *title = screenplay.title;
    self.titleTextField.text = title;
    NSString *basicDescription = screenplay.basicDescription;
    self.textView.text = basicDescription;
    
    
    
    
}

- (IBAction)saveButtonTapped:(id)sender {
    if ([[[self titleTextField]text]isEqualToString:@""])
        return;
    
    NSString *description = [[self textView]text];
    NSString *title = _titleTextField.text;
    NSMutableString *newDescription = [[NSMutableString alloc]initWithString:description];
    
    NSMutableString *newTitle = [[NSMutableString alloc]initWithString:title];
    [[ScreenplayController sharedInstance] createScreenplay:newTitle description:newDescription];
    _titleTextField.text = @"";
    [[self navigationController] popToRootViewControllerAnimated:true];
    
}


- (void)setScreenPlay:(Screenplay *)screenplay
{
    if (_screenplay != screenplay) {
        _screenplay = screenplay;
        [self.tableView reloadData];
    }
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
