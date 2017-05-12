//
//  ThemeSelectButton.h
//  MyButton
//
//  Created by tangyuhua on 2017/5/11.
//  Copyright © 2017年 tangyuhua. All rights reserved.
//

#import <UIKit/UIKit.h>
@class  ThemeCheckBox;
@protocol ThemeCheckBoxDelegate <NSObject>
- (void)didTapCheckBox:(ThemeCheckBox*)checkBox;
@end

@interface ThemeCheckBox : UIControl
@property (nonatomic, strong) UIColor *themeColor;
@property (nonatomic, weak) id<ThemeCheckBoxDelegate> delegate;
@end


