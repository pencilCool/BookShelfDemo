//
//  SXReadTopBar.m
//  BookShelf
//
//  Created by tangyuhua on 2017/4/26.
//  Copyright © 2017年 tangyuhua. All rights reserved.
//

#import "SXReadTopBar.h"

@interface SXReadTopBar()

@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *actionButtons;

@end


@implementation SXReadTopBar






- (IBAction)topBarActions:(id)sender {

    SXReadTopToolBarAction actionType;
    actionType =  [self.actionButtons indexOfObject:sender];
    if (self.delegate && [self.delegate respondsToSelector:@selector(readerTopToolBar:didClickedAction:)]) {
        [self.delegate readerTopToolBar:self didClickedAction:actionType];
    }
    
}





@end
