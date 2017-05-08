//
//  ReaderManager.m
//  BookShelf
//
//  Created by tangyuhua on 2017/4/28.
//  Copyright © 2017年 tangyuhua. All rights reserved.
//

#import "ReaderManager.h"
@interface ReaderManager()

@property (nonatomic, strong) ChapterModel *currentChapter;
@property (nonatomic, assign) NSRange      visibleRange;
@property (nonatomic, strong) id<ReaderModelProtocol> currentModel;


@property (nonatomic, strong) NSLayoutManager *layoutManager;
@property (nonatomic, strong) NSTextContainer *textContainer;
@property (nonatomic, strong) NSTextStorage   *textStorage;

@end

@implementation ReaderManager
{
    
}

+ (instancetype)sharedManager
{
    static ReaderManager *shared = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shared = [[ReaderManager alloc] initPrivate];
    });
    return shared;
}

- (instancetype)initPrivate
{
    self = [super init];
    if (self) {
        
       
    }
    return self;
}

- (instancetype)init{
    NSException *expection = [NSException exceptionWithName:@"fatal error " reason:@"should use sharedManager to get the instance" userInfo:nil];
    [expection raise];
    return nil;
}


- (void)setVisableRange:(NSRange)range
{
    self.visibleRange = range;
}



- (id<ReaderModelProtocol>)currentPage
{
    self.currentChapter = [[ChapterModel alloc] initWithFictionName:nil chapterName:@"第1章"];
    return  self.currentChapter;
}


- (id<ReaderModelProtocol>) nextPage
{
    id<ReaderModelProtocol> model = self.currentChapter;
    
    if (self.currentChapeterContainerIndex < [self.currentChapter pageCount] - 1)
    {
        self.currentChapeterContainerIndex ++ ;
    }
    else
    {
        //FIXME: next chapter
        NSLog(@"need jump to next chapter ");
    }
        return model;
}
- (id<ReaderModelProtocol>) prePage
{
    
    id<ReaderModelProtocol> model = self.currentChapter;
    
    if (self.currentChapeterContainerIndex > 0)
    {
        self.currentChapeterContainerIndex -- ;
    }
    else
    {
        //FIXME: 跳转到上一章
        NSLog(@"need to jump to pre chapter");
    }
    
    return model;
}


- (NSTextContainer *)currentTextContainer
{
    return self.currentChapter.layoutManager.textContainers[_currentChapeterContainerIndex];
}

//- (ChapterModel *)currentChapter
//{
//    if (!_currentChapter) {
//        _currentChapter = [ChapterModel new];
//    }
//    return _currentChapter;
//}
@end
