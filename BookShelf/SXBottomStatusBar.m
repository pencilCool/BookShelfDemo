//
//  SXBottomStatusBar.m
//  BookShelf
//
//  Created by tangyuhua on 2017/5/8.
//  Copyright © 2017年 tangyuhua. All rights reserved.
//

#import "SXBottomStatusBar.h"
@interface SXBottomStatusBar()
@property (nonatomic, strong) UILabel *progressLabel;
@property (nonatomic, strong) UILabel *timeLabel;

@end
@implementation SXBottomStatusBar

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor]; //FIXME: user Theme Color
        
        
        
        [self addSubview:self.timeLabel];
        [self addSubview:self.progressLabel];
        
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    // 绘制电池
    UIBezierPath *path = [[UIBezierPath alloc] init];
    // 方框
    [path moveToPoint:CGPointMake(12, 10-3)];
    [path addLineToPoint:CGPointMake(12, 10 + 3)];
    [path addLineToPoint:CGPointMake(12 + 12, 13)];
    [path addLineToPoint:CGPointMake(24,  10 - 3)];
    [path addLineToPoint:CGPointMake(24 - 12, 10 -3)];
    
    
    // 绘制电池正极

    [path moveToPoint:CGPointMake(25, 8)];
    [path addLineToPoint:CGPointMake(25, 12)];

    // 剩余电量绘制
    [[UIDevice currentDevice] setBatteryMonitoringEnabled:YES];
    float percent =  [[UIDevice currentDevice] batteryLevel];
    if (percent == -1) {
        percent = 0.5; //  模拟器上返回 -1
    }
    
    UIBezierPath *remainPath = [[UIBezierPath alloc] init];
    remainPath.lineWidth = 6.0;
    [remainPath moveToPoint:CGPointMake(12, 10)];
    [remainPath addLineToPoint:CGPointMake(12 + 12 * percent, 10)];
    [[UIColor grayColor] setStroke];
    [remainPath stroke];
    

    //create shape layer
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.strokeColor = [UIColor grayColor].CGColor;
    shapeLayer.fillColor = nil;
    shapeLayer.lineWidth = 1;
    shapeLayer.lineJoin = kCALineJoinRound;
    shapeLayer.lineCap = kCALineCapRound;
    shapeLayer.path = path.CGPath;
    //add it to our view
    [self.layer addSublayer:shapeLayer];
}

- (void)layoutSubviews
{
    [self.progressLabel mas_updateConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.right.equalTo(self).with.offset(-8);
    }];
    
    [self.timeLabel mas_updateConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.left.equalTo(self).with.offset(80);
    }];
    
}



- (UILabel *)timeLabel
{
    if (!_timeLabel) {
        _timeLabel = [UILabel new];
        _timeLabel.text = [self date];
    }
    return _timeLabel;
}


- (NSString *) date {
    NSDateFormatter *dateFormatter =[[NSDateFormatter alloc] init];
    // 设置日期格式
    [dateFormatter setDateFormat:@"hh:mm"];
    NSString *dateString = [dateFormatter stringFromDate:[NSDate date]];
    return dateString;
}

- (UILabel *)progressLabel
{
    if (!_progressLabel) {
        _progressLabel = [UILabel new];
        _progressLabel.text = @"100.0%";
    }
    return _progressLabel;
}

@end
