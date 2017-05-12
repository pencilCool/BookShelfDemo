//
//  ThemeSelectButton.m
//  MyButton
//
//  Created by tangyuhua on 2017/5/11.
//  Copyright © 2017年 tangyuhua. All rights reserved.
//

#import "ThemeCheckBox.h"

@interface ThemeCheckBox()
@property (strong, nonatomic) CAShapeLayer *borderLayer;
@property (strong, nonatomic) CAShapeLayer *checkMarkLayer;

@end
@implementation ThemeCheckBox

- (instancetype) initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self commonInit];
    }
    return self;
}

- (void) commonInit
{
    self.selected = NO;
    self.themeColor = [UIColor redColor];
    self.backgroundColor = self.themeColor;
    self.layer.cornerRadius = 5.0f;
    [self drawEntire];
    [self addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTapCheckBox:)]];
    
    
}
- (void)drawEntire
{
    [self drawBorder];
    [self drawCheckMark];
    
}


- (void)drawBorder
{
    [self.borderLayer removeFromSuperlayer];
    self.borderLayer = [CAShapeLayer layer];
    self.borderLayer.frame = self.bounds;
    self.borderLayer.strokeColor = [UIColor blueColor].CGColor;
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:self.bounds cornerRadius:5.0];
    path.lineWidth = 1.0;
    [path addClip];
    
    self.borderLayer.path = path.CGPath;
    self.borderLayer.fillColor = nil;
    self.borderLayer.rasterizationScale = 2.0 * [UIScreen mainScreen].scale;
    self.borderLayer.shouldRasterize = YES;
    [self.layer addSublayer:self.borderLayer];
}

- (void)drawCheckMark
{
    [self.checkMarkLayer removeFromSuperlayer];
    self.checkMarkLayer = [CAShapeLayer layer];
    self.checkMarkLayer.frame = self.bounds;
    self.checkMarkLayer.strokeColor = [UIColor blueColor].CGColor;
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(self.bounds.size.width/2 - 5, self.bounds.size.height/2 - 5)];
    [path addLineToPoint:CGPointMake(self.bounds.size.width/2 , self.bounds.size.height/2 + 5)];
    [path addLineToPoint:CGPointMake(self.bounds.size.width/2 + 5, self.bounds.size.height/2 - 5)];
    
    self.checkMarkLayer.path = path.CGPath;
    self.checkMarkLayer.strokeColor = [UIColor blueColor].CGColor;
    self.checkMarkLayer.fillColor = nil;
    self.checkMarkLayer.lineWidth = 1.0f;
    self.checkMarkLayer.lineJoin = kCALineJoinRound;
    
    self.checkMarkLayer.rasterizationScale = 2.0 * [UIScreen mainScreen].scale;
    self.checkMarkLayer.shouldRasterize = YES;
    [self.layer addSublayer:self.checkMarkLayer];
}

- (CGSize)intrinsicContentSize
{
    return CGSizeMake(100, 100);
    
}

- (void)handleTapCheckBox:(UITapGestureRecognizer *)recognizer {

    [self setSelected:!self.isSelected];
    if (self.isSelected)
    {
        [self drawCheckMark];
        [self drawBorder];
    }else
    {
        [self.checkMarkLayer removeFromSuperlayer];
        [self.borderLayer removeFromSuperlayer];
    }
    
    if ([self.delegate respondsToSelector:@selector(didTapCheckBox:)]) {
        [self.delegate didTapCheckBox:self];
    }
    [self sendActionsForControlEvents:UIControlEventValueChanged];
    
}


@end
