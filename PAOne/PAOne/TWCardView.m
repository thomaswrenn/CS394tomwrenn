//
//  TWCardView.m
//  PAOne
//
//  Created by Thomas Wrenn on 3/4/14.
//  Copyright (c) 2014 Thomas Wrenn. All rights reserved.
//

#import <stdlib.h>
#import <QuartzCore/QuartzCore.h>
#import "TWCardView.h"

@interface TWCardView ()

typedef enum { kSpades, kHearts, kClubs, kDiamonds } CardSuitType;
typedef enum {
    kACard, k1Card, k2Card, k3Card, k4Card, k5Card, k6Card, k7Card, k8Card, k9Card, k10Card,
    kJCard, kQCard, kKCard
} CardValueType;

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

@end

@implementation TWCardView

static NSString *suitStringArr[] = { @"♠️", @"♥️", @"♣️", @"♦️" };
static NSString *valStringArr[] = { @"A", @"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10", @"J", @"Q", @"K" };

@synthesize cardView;
//@synthesize shadowOffsetX = _shadowOffsetX;
//
//- (void) setShadowOffsetX:(NSInteger)shadowOffsetXArg {
//    self->_shadowOffsetX = shadowOffsetXArg;
//    [self.cardView.layer setShadowOffset:CGSizeMake(self.shadowOffsetX, 0)];
//    [self.cardView setNeedsDisplay];
////    [self setNeedsDisplay];
//}

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
        [[NSBundle mainBundle] loadNibNamed:@"TWCardView" owner:self options:nil];
        [self.cardView.layer setCornerRadius:5.0f];
        self.cardView.layer.borderColor = [UIColor blackColor].CGColor;
        self.cardView.layer.borderWidth = 0.25f;
        
//        self.highlightColor = [UIColor colorWithRed:0.1 green:0.1 blue:0.1 alpha:1];
//        self.shadowOffsetX = 0;
//        [self.cardView.layer setShadowColor:self.highlightColor.CGColor];
//        [self.cardView.layer setShadowOpacity:0.6];
//        [self.cardView.layer setShadowRadius:2.0];
//        [self.cardView.layer setShadowOffset:CGSizeMake(self.shadowOffsetX, 0)];
        
        [self addSubview:self.cardView];
    }
    return self;
}

- (id)initRandomCard:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [[NSBundle mainBundle] loadNibNamed:@"TWCardView" owner:self options:nil];
        [self.cardView.layer setCornerRadius:5.0f];
        self.cardView.layer.borderColor = [UIColor blackColor].CGColor;
        self.cardView.layer.borderWidth = 0.25f;
        [self setCardSuit:(arc4random()%3) cardVal:(arc4random()%13)];
        
//        self.highlightColor = [UIColor colorWithRed:0.1 green:0.1 blue:0.1 alpha:1];
//        self.shadowOffsetX = 0;
//        [self.cardView.layer setShadowColor:self.highlightColor.CGColor];
//        [self.cardView.layer setShadowOpacity:0.6];
//        [self.cardView.layer setShadowRadius:2.0];
//        [self.cardView.layer setShadowOffset:CGSizeMake(self.shadowOffsetX, 0)];
        
        [self addSubview:self.cardView];
    }
    return self;
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
