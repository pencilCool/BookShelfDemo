//
//  SXReadBottomBar.m
//  BookShelf
//
//  Created by tangyuhua on 2017/4/26.
//  Copyright © 2017年 tangyuhua. All rights reserved.
//

#import "SXReadBottomBar.h"

@interface SXReadBottomBar()
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *actionButtons;
@end

@implementation SXReadBottomBar


- (IBAction)bottomBarActions:(id)sender {
    SXReadBottomToolBarAction actionType;
    actionType =  [self.actionButtons indexOfObject:sender];
    if (self.delegate && [self.delegate respondsToSelector:@selector(readerBottomToollBar:didClickedAction:)]) {
        [self.delegate readerBottomToollBar:self didClickedAction:actionType];
    }
    
}


@end
