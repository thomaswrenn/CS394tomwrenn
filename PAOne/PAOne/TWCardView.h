//
//  TWCardView.h
//  PAOne
//
//  Created by Thomas Wrenn on 3/4/14.
//  Copyright (c) 2014 Thomas Wrenn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TWCardView : UIView

// // Card Property (Suit and Valu) Enums
typedef enum { kSpades, kHearts, kClubs, kDiamonds } CardSuitType;
typedef enum {
    kACard, k1Card, k2Card, k3Card, k4Card, k5Card, k6Card, k7Card, k8Card, k9Card, k10Card,
    kJCard, kQCard, kKCard
} CardValueType;

- (id)initRandomCard:(CGRect)frame;
- (void)setCardSuit:(CardSuitType)cardSuitArg cardVal:(CardValueType)cardValArg;
- (void)flipCard;
- (void)initAnimator;
- (void)deactivateSnap;
- (void)deactivateSnapWithGravityDirection:(CGFloat) angle;

@end
