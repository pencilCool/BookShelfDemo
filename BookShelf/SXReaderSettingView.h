//
//  SXReaderSettingView.h
//  BookShelf
//
//  Created by tangyuhua on 2017/5/8.
//  Copyright © 2017年 tangyuhua. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SXReaderSettingView : UIView
@property (nonatomic, assign ,readonly) BOOL isAppear;
- (void)appear;
- (void)disappear;
@end
