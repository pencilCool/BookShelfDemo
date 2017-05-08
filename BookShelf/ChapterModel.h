//
//  ChapterModel.h
//  BookShelf
//
//  Created by tangyuhua on 2017/4/28.
//  Copyright © 2017年 tangyuhua. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SXReaderTextStorage.h"
@interface ChapterModel : NSObject<ReaderModelProtocol>
@property (nonatomic,strong) NSString *text;






@property (nonatomic, strong) NSLayoutManager *layoutManager;
@property (nonatomic, strong) NSTextContainer *textContainer;
@property (nonatomic, strong) SXReaderTextStorage  *textStorage;

- (instancetype)initWithFictionName:(NSString*)fictionName chapterName: (NSString *)chapterName;
- (NSUInteger) pageCount;

@end
