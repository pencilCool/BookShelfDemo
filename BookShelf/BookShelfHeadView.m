//
//  BookShelfHeadView.m
//  BookShelf
//
//  Created by tangyuhua on 2017/4/25.
//  Copyright © 2017年 tangyuhua. All rights reserved.
//

#import "BookShelfHeadView.h"

@implementation BookShelfHeadView

- (instancetype) initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //self.translatesAutoresizingMaskIntoConstraints = NO;
        self.backgroundColor = [UIColor greenColor];
        [self configSubView];
        [self configLayout];
    }
    return self;
}



- (void)configSubView{
    [self addSubview:self.daysOfSignInLabel];
    [self addSubview:self.signInButton];
    [self addSubview:self.numberOfTimeLabel];
    [self addSubview:self.descriptionLabel];
}


- (void)configLayout {
    
    [self.daysOfSignInLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).with.offset(8);
        make.bottom.equalTo(self.mas_bottom).with.offset(-8);
    }];
    
    [self.signInButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.mas_right).with.offset(-8);
        make.bottom.equalTo(self.mas_bottom).with.offset(-8);
    }];
    
    [self.numberOfTimeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.centerY.equalTo(self).with.offset(8);
    }];
    
    [self.descriptionLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.top.equalTo(self.numberOfTimeLabel.mas_bottom).with.offset(8);
    }];
    
}













- (UILabel *)daysOfSignInLabel
{
    if (!_daysOfSignInLabel) {
        _daysOfSignInLabel = [UILabel new];
        _daysOfSignInLabel.text = @"本周以签到2天";
    }
    return _daysOfSignInLabel;
}

- (UIButton *)signInButton
{
    if (!_signInButton) {
        _signInButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_signInButton setTitle:@"立即签到" forState:UIControlStateNormal];
    }
    return _signInButton;
}

- (UILabel *)numberOfTimeLabel
{
    if (!_numberOfTimeLabel) {
        _numberOfTimeLabel = [UILabel new];
        _numberOfTimeLabel.text = @"2";
    }
    return _numberOfTimeLabel;
}

- (UILabel *)descriptionLabel
{
    if (!_descriptionLabel) {
        _descriptionLabel = [UILabel new];
        _descriptionLabel.text = @"本周阅读时间长/分钟";
    }
    return _descriptionLabel;
}
@end
