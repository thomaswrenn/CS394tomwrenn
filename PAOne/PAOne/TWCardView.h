//
//  TWCardView.h
//  PAOne
//
//  Created by Thomas Wrenn on 3/4/14.
//  Copyright (c) 2014 Thomas Wrenn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TWCardView : UIView

@property (weak, nonatomic) IBOutlet UIView *cardView;
//@property (nonatomic) NSInteger shadowOffsetX;

- (id)initRandomCard:(CGRect)frame;

@end
