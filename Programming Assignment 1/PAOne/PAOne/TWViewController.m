//
//  TWViewController.m
//  PAOne
//
//  Created by Thomas Wrenn on 2/25/14.
//  Copyright (c) 2014 Thomas Wrenn. All rights reserved.
//

#import "TWViewController.h"

@interface TWViewController ()
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UILabel *nameTextFieldLabel;

@end

@implementation TWViewController

- (IBAction)setButton:(id)sender {
    NSString *_name = self.nameTextField.text;
    NSString *_message = [NSString stringWithFormat:@"Hi %@", _name];
    
    self.nameTextFieldLabel.text = _message;
    [self.nameTextField resignFirstResponder];
}
- (IBAction)testCallback:(id)sender {
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self.nameTextField resignFirstResponder];
    return YES;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
