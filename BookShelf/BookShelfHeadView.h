//
//  BookShelfHeadView.h
//  BookShelf
//
//  Created by tangyuhua on 2017/4/25.
//  Copyright © 2017年 tangyuhua. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BookShelfHeadView : UIImageView
@property (nonatomic, strong) UILabel  *daysOfSignInLabel; //签到天数
@property (nonatomic, strong) UIButton *signInButton;     // 立即签到
@property (nonatomic, strong) UILabel  *numberOfTimeLabel;      // 数字，本周的阅读时长度
@property (nonatomic, strong) UILabel  *descriptionLabel;


@end
