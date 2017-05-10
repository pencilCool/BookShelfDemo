//
//  ChapterModel.m
//  BookShelf
//
//  Created by tangyuhua on 2017/4/28.
//  Copyright © 2017年 tangyuhua. All rights reserved.
//

#import "ChapterModel.h"
#import "SXTextParser.h"
@interface ChapterModel()<NSLayoutManagerDelegate>
@property (nonatomic, strong) SXTextParser *parser;
@end

@implementation ChapterModel
{
    NSUInteger chapterPageCount;
}
@synthesize textView = _textView;
@synthesize fictionName = _fictionName;
@synthesize chapterName = _chapterName;


- (instancetype) initWithFictionName:(NSString *)fictionName chapterName:(NSString *)chapterName
{
    if (self = [super init]) {
        self.fictionName = fictionName;
        self.chapterName = chapterName;
        [self chapterInit];
    }
    return self;
}

- (void)chapterInit{
    self.textStorage = [[SXReaderTextStorage alloc] init];
    [self.textStorage setAttributedString:self.content];
    self.layoutManager = [[NSLayoutManager alloc] init];
    self.layoutManager.delegate = self;
    [self.textStorage addLayoutManager:self.layoutManager];

    NSRange range = NSMakeRange(0, 0);
    chapterPageCount = 0;
    while (NSMaxRange(range) < _layoutManager.numberOfGlyphs) {
        CGSize containerSize = CGSizeMake(kScreenWidth - 30, kScreenHeight-80);
        NSTextContainer *container =  [[NSTextContainer alloc] initWithSize:containerSize];
        [_layoutManager addTextContainer:container];
        range = [_layoutManager glyphRangeForTextContainer:container];
        chapterPageCount ++;
    }
}

- (CGFloat)layoutManager:(NSLayoutManager *)layoutManager lineSpacingAfterGlyphAtIndex:(NSUInteger)glyphIndex withProposedLineFragmentRect:(CGRect)rect
{
    return 10;
}

- (NSAttributedString *)content {
    NSString *path = [self chapterPath];
    NSString *text  = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    return  [self.parser parseString:text];
}

- (NSString *)chapterPath{
    return [[NSBundle mainBundle] pathForResource:_chapterName ofType:@"txt"];
}

- (NSUInteger)pageCount{
    return chapterPageCount;
}

- (SXTextParser *)parser
{
    if (!_parser) {
        _parser  = [SXTextParser new];
    }
    return _parser;
}

@end
