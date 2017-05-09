//
//  SXReaderSettingView.m
//  BookShelf
//
//  Created by tangyuhua on 2017/5/8.
//  Copyright © 2017年 tangyuhua. All rights reserved.
//

#import "SXReaderSettingView.h"
@interface SXReaderSettingView()

@end
@implementation SXReaderSettingView
{
    CGRect originalFrame;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
       self.frame = CGRectMake(0, kScreenHeight, kScreenWidth, 240);
    }
    return self;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    
}


- (void)appear
{
    _isAppear = YES;
    [UIView animateWithDuration:0.3 animations:^{
        self.frame = CGRectMake(0, kScreenHeight - 240, kScreenWidth, 240);
    }];
    
}

- (void)disappear
{
    _isAppear = NO;
    [UIView animateWithDuration:0.3 animations:^{
        self.frame = CGRectMake(0, kScreenHeight, kScreenWidth, 240);
    }];
}



@end
