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
@property (nonatomic, strong) NSString     *contentText;
@property (nonatomic, assign) NSRange      visibleRange;
@property (nonatomic, strong) id<ReaderModelProtocol> currentModel;

@end

@implementation ReaderManager

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
        self.contentText = [ReaderManager fetchChapter];
    }
    return self;
}


- (instancetype)init{
    NSException *expection = [NSException exceptionWithName:@"fatal error " reason:@"should use sharedManager to get the instance" userInfo:nil];
    [expection raise];
    return nil;
}

+ (NSString *)fetchChapter
{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"第1章" ofType:@"txt"];
    NSString *result  = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    return result;
  
}





- (void)setVisableRange:(NSRange)range
{
    self.visibleRange = range;
}



- (id<ReaderModelProtocol>)currentPage
{
    return  self.currentChapter;
}


- (id<ReaderModelProtocol>) nextPage
{
    id<ReaderModelProtocol> model = self.currentChapter;
    self.currentChapeterContainerIndex ++ ;
    return model;
}
- (id<ReaderModelProtocol>) prePage
{
    
    id<ReaderModelProtocol> model = self.currentChapter;
    self.currentChapeterContainerIndex -- ;
    return model;
}




- (ChapterModel *)currentChapter
{
    if (!_currentChapter) {
        _currentChapter = [ChapterModel new];
        _currentChapter.text = [ReaderManager fetchChapter];
    }
    return _currentChapter;
}
@end
