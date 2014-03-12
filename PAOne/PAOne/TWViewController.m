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
@property (nonatomic) UIDynamicAnimator *animator;
-(IBAction)showReferencedView;
-(IBAction)setButton:(id)sender;

@end

@implementation TWViewController

@synthesize animator = _animator;

- (IBAction)showReferencedView{
    CGRect cardFrame = CGRectMake(100, 200, 100, 200);
    self.card = [[TWCardView alloc] initRandomCard:cardFrame];
    [self.view addSubview:self.card];
    _animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    UIGravityBehavior *gravityBehavior = [[UIGravityBehavior alloc] initWithItems:@[self.card]];
    UICollisionBehavior *collisionBehavior = [[UICollisionBehavior alloc] initWithItems:@[self.card]];
    collisionBehavior.translatesReferenceBoundsIntoBoundary = YES;
    [_animator addBehavior:gravityBehavior];
    [_animator addBehavior:collisionBehavior];
    UIInterpolatingMotionEffect *hme = [[UIInterpolatingMotionEffect alloc] initWithKeyPath:@"shadowOffsetX" type:UIInterpolatingMotionEffectTypeTiltAlongHorizontalAxis];
    hme.minimumRelativeValue = @(-12);
    hme.maximumRelativeValue = @(12);
    
    [self.card addMotionEffect:horizontalMotionEffect];
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
