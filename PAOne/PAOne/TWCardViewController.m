//
//  TWCardViewController.m
//  PAOne
//
//  Created by Thomas Wrenn on 3/13/14.
//  Copyright (c) 2014 Thomas Wrenn. All rights reserved.
//

#import "TWCardView.h"
#import "TWCardViewController.h"

@interface TWCardViewController ()

@property (nonatomic, strong) TWCardView* cardView;

@end

@implementation TWCardViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:@"TWCardView" bundle:nil];
    if (self) {
        [self.cardView.frontCardView.layer setCornerRadius:5.0f];
        self.cardView.frontCardView.layer.borderColor = [UIColor blackColor].CGColor;
        self.cardView.frontCardView.layer.borderWidth = 0.25f;
        [self.cardView setCardSuit:(arc4random()%3) cardVal:(arc4random()%13)];
        [self.cardView.backCardView.layer setCornerRadius:5.0f];
        self.cardView.backCardView.backgroundColor = [UIColor redColor];
        self.cardView.flipped = NO;
        [self.cardView addSubview:self.cardView.frontCardView];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
