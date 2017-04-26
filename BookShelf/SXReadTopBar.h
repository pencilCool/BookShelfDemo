//
//  SXReadTopBar.h
//  BookShelf
//
//  Created by tangyuhua on 2017/4/26.
//  Copyright © 2017年 tangyuhua. All rights reserved.
//

#import <UIKit/UIKit.h>


@class SXReadTopBar;

typedef NS_ENUM(NSUInteger, SXReadTapToolBarAction) {
    SXReadTapToolBarActionBack,
    SXReadTapToolBarActionListen,
    SXReadTapToolBarActionDownLoad,
    SXReadTapToolBarActionReward,
    SXReadTapToolBarActionMore,
};

@protocol SXReadTapToolBarDelegate <NSObject>
- (void)readerTopToolBar:(SXReadTopBar *)readerToolBar didClickedAction:(SXReadTapToolBarAction)action;
@end

@interface SXReadTopBar : UIView


@property (nonatomic, weak) id<SXReadTapToolBarDelegate>delegate;

@end
