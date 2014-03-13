//
//  TWCardView.m
//  PAOne
//
//  Created by Thomas Wrenn on 3/4/14.
//  Copyright (c) 2014 Thomas Wrenn. All rights reserved.
//

#import <stdlib.h>
#import <math.h>
#import <QuartzCore/QuartzCore.h>
#import <objc/runtime.h>

#import "TWCardView.h"

@interface TWCardView ()

@property (nonatomic) CardSuitType suit;
@property (nonatomic) CardValueType val;
@property (strong, nonatomic) NSString *suitString;
@property (strong, nonatomic) NSString *valString;
@property (strong, nonatomic) UIColor *suitColor;

@property (weak, nonatomic) IBOutlet UILabel *topLeftSuit;
@property (weak, nonatomic) IBOutlet UILabel *centMidSuit;
@property (weak, nonatomic) IBOutlet UILabel *botRighSuit;

@property (weak, nonatomic) IBOutlet UILabel *topRighVal;
@property (weak, nonatomic) IBOutlet UILabel *botLeftVal;

@property (strong, nonatomic) UIColor *highlightColor;
@property (nonatomic) UIDynamicAnimator *animator;
@property (nonatomic) UIInterpolatingMotionEffect *hme;
@property (nonatomic) UISnapBehavior *snapBehavior;
@property (nonatomic) UIGravityBehavior *gravityBehavior;

@end

@implementation TWCardView

static NSString *suitStringArr[] = { @"♠️", @"♥️", @"♣️", @"♦️" };
static NSString *valStringArr[] = { @"A", @"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10", @"J", @"Q", @"K" };

- (void)setCardSuit:(CardSuitType)suitArg {
    self.suit = suitArg;
    self.suitString = suitStringArr[self.suit];
    self.topLeftSuit.text = self.suitString;
    self.centMidSuit.text = self.suitString;
    self.botRighSuit.text = self.suitString;
    
    self.suitColor = ((self.suit % 2) == 0) ? [UIColor blackColor] : [UIColor redColor];
    self.topRighVal.textColor = self.suitColor;
    self.botLeftVal.textColor = self.suitColor;
}

- (void)setCardVal:(CardValueType)valArg {
    self.val = valArg;
    self.valString = valStringArr[self.val];
    self.topRighVal.text = self.valString;
    self.botLeftVal.text = self.valString;
}

- (void)setCardSuit:(CardSuitType)cardSuitArg cardVal:(CardValueType)cardValArg {
    [self setCardSuit:cardSuitArg];
    [self setCardVal:cardValArg];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
//        [[NSBundle mainBundle] loadNibNamed:@"TWCardView" owner:self options:nil];
        [[UINib nibWithNibName:@"TWCardView" bundle:nil] instantiateWithOwner:self options:nil];
        [self.frontCardView.layer setCornerRadius:5.0f];
        self.frontCardView.layer.borderColor = [UIColor blackColor].CGColor;
        self.frontCardView.layer.borderWidth = 0.25f;
        [self setCardSuit:(arc4random()%3) cardVal:(arc4random()%13)];
        [self.backCardView.layer setCornerRadius:5.0f];
        self.backCardView.backgroundColor = [UIColor redColor];
        self.flipped = NO;
        [self addSubview:self.backCardView];
        [self addSubview:self.frontCardView];
        NSLog(@"%i %i", (self.frontCardView != nil), (self.backCardView != nil));
    }
    return self;
}

- (id)initRandomCard:(CGRect)frame {
    return [self initWithFrame:frame];
}

@synthesize animator = _animator;
@synthesize hme = _hme;
@synthesize snapBehavior = _snapBehavior;
@synthesize gravityBehavior = _gravityBehavior;

- (void)initAnimator {
    _animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.superview];
    _gravityBehavior = [[UIGravityBehavior alloc] initWithItems:@[self]];
    [_gravityBehavior setAngle:((arc4random()%7)*M_PI_2) magnitude:10.0f];
    UICollisionBehavior *collisionBehavior = [[UICollisionBehavior alloc] initWithItems:@[self]];
    collisionBehavior.translatesReferenceBoundsIntoBoundary = YES;
    UIDynamicItemBehavior *itemBehaviors = [[UIDynamicItemBehavior alloc] initWithItems:@[self]];
    itemBehaviors.elasticity = 0.1f;
    [itemBehaviors addAngularVelocity:1.0f forItem:self];
    _snapBehavior = [[UISnapBehavior alloc] initWithItem:self snapToPoint:CGPointMake(200, 335)];
    _snapBehavior.damping = 1.0;
    
    [_animator addBehavior:_gravityBehavior];
    [_animator addBehavior:collisionBehavior];
    [_animator addBehavior:itemBehaviors];
    [_animator addBehavior:_snapBehavior];
    
    _hme = [[UIInterpolatingMotionEffect alloc] initWithKeyPath:@"center.x" type:UIInterpolatingMotionEffectTypeTiltAlongHorizontalAxis];
    _hme.minimumRelativeValue = @(-12);
    _hme.maximumRelativeValue = @(12);
    
    [self addMotionEffect:self.hme];

}

- (void)deactivateSnapWithGravityDirection:(CGFloat) angle {
    [_gravityBehavior setAngle:angle];
    [_animator removeBehavior:_snapBehavior];
}

#define DEGREES_TO_RADIANS(angle) ((angle) / 180.0 * M_PI)

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    NSLog(@"%i %i", (self.frontCardView != nil), (self.backCardView != nil));
    [UIView transitionWithView:self
                      duration:1.0f
                       options:UIViewAnimationOptionTransitionFlipFromRight
                    animations: ^{
                        if(self.flipped) {
                        } else {
                            [self sendSubviewToBack:self.frontCardView];
                        }
                        NSLog(@"size: %i",(int)[[self subviews] count]);
                        self.flipped ^= 1;
                    }
                    completion:NULL];
}

- (void)deactivateSnap {
    [_animator removeBehavior:_snapBehavior];
}

//- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
////    NSLog(@"touched");
//    [self.cardView setNeedsDisplay];
//}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
