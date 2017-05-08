//
//  SXReadBottomBar.h
//  BookShelf
//
//  Created by tangyuhua on 2017/4/26.
//  Copyright © 2017年 tangyuhua. All rights reserved.
//

#import <UIKit/UIKit.h>


@class SXReadBottomBar;

typedef NS_ENUM(NSUInteger, SXReadBottomToolBarAction) {
    SXReadBottomToolBarActionCatalog,
    SXReadBottomToolBarActionProgress,
    SXReadBottomToolBarActionSettings,
    SXReadBottomToolBarActionComment,
    
};

@protocol SXReadBottomToolBarDelegate <NSObject>
- (void)readerBottomToollBar:(SXReadBottomBar *)readerToolBar didClickedAction:(SXReadBottomToolBarAction)action;
@end

@interface SXReadBottomBar : UIView
@property (nonatomic, weak) id<SXReadBottomToolBarDelegate>delegate;
@end
