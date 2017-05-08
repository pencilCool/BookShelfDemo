//
//  SXReadTopBar.h
//  BookShelf
//
//  Created by tangyuhua on 2017/4/26.
//  Copyright © 2017年 tangyuhua. All rights reserved.
//

#import <UIKit/UIKit.h>


@class SXReadTopBar;

typedef NS_ENUM(NSUInteger, SXReadTopToolBarAction) {
    SXReadTopToolBarActionBack,
    SXReadTopToolBarActionListen,
    SXReadTopToolBarActionDownLoad,
    SXReadTopToolBarActionReward,
    SXReadTopToolBarActionMore,
};

@protocol SXReadTopToolBarDelegate <NSObject>
- (void)readerTopToolBar:(SXReadTopBar *)readerToolBar didClickedAction:(SXReadTopToolBarAction)action;
@end

@interface SXReadTopBar : UIView


@property (nonatomic, weak) id<SXReadTopToolBarDelegate>delegate;

@end
