//
//  ReaderManager.h
//  BookShelf
//
//  Created by tangyuhua on 2017/4/28.
//  Copyright © 2017年 tangyuhua. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ReaderModelProtocol.h"
#import "ChapterModel.h"



@interface ReaderManager : NSObject
@property (nonatomic, weak  ) YYLabel      *label;//
@property (nonatomic, strong) id<ReaderModelProtocol>model;
@property (nonatomic, assign) NSUInteger   currentChapeterContainerIndex;




+ (instancetype ) sharedManager;

- (ChapterModel *)currentChapter;
- (void)setVisableRange:(NSRange )range;



- (NSTextContainer *)currentTextContainer;


- (id<ReaderModelProtocol>) currentPage;
- (id<ReaderModelProtocol>) nextPage;
- (id<ReaderModelProtocol>) prePage;

- (instancetype)init UNAVAILABLE_ATTRIBUTE;




// Font

@property (nonatomic, strong, readonly) UIFont *currentFont;
- (void)fontSize:(CGFloat) size;
- (BOOL)smallerFontSize;  // 最小12
- (BOOL)biggerFontSize;  // 最大30
- (CGFloat)currentFontSize;
- (UIFont*) defaultFont;

@end
