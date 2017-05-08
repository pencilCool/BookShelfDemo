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

+ (NSString *)fetchChapter;


+ (instancetype ) sharedManager;

- (ChapterModel *)currentChapter;
- (void)setVisableRange:(NSRange )range;



- (id<ReaderModelProtocol>) currentPage;
- (id<ReaderModelProtocol>) nextPage;
- (id<ReaderModelProtocol>) prePage;

- (instancetype)init UNAVAILABLE_ATTRIBUTE;
@end
