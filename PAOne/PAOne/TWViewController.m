//
//  TWViewController.m
//  PAOne
//
//  Created by Thomas Wrenn on 2/25/14.
//  Copyright (c) 2014 Thomas Wrenn. All rights reserved.
//

#import "TWViewController.h"
#import "TWCardView.h"

@interface TWViewController ()

@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UILabel *nameTextFieldLabel;
@property (strong, nonatomic) IBOutlet TWCardView *card;
@property (nonatomic) UIInterpolatingMotionEffect *hme;
-(IBAction)showReferencedView;
-(IBAction)setButton:(id)sender;

@end

@implementation TWViewController

- (IBAction)showReferencedView{
    CGSize pos = CGSizeMake(((self.view.bounds.size.width/2) - (90/2)), ((self.view.bounds.size.height/2) - (140/2)));
    CGRect cardFrame = CGRectMake(pos.width, pos.height, 90, 140);
    self.card = [[TWCardView alloc] initRandomCard:cardFrame];
    [self.view addSubview:self.card];
    [self.card initAnimator];
}

- (IBAction)setButton:(id)sender {
    NSString *_name = self.nameTextField.text;
    NSString *_message = [NSString stringWithFormat:@"Hi %@", _name];
    
    self.nameTextFieldLabel.text = _message;
    [self.nameTextField resignFirstResponder];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self.nameTextField resignFirstResponder];
    return YES;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
