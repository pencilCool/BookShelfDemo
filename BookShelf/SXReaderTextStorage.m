//
//  SXReaderTextStorage.m
//  BookShelf
//
//  Created by tangyuhua on 2017/5/8.
//  Copyright © 2017年 tangyuhua. All rights reserved.
//

#import "SXReaderTextStorage.h"

@implementation SXReaderTextStorage
{
    NSMutableAttributedString *_backingStore;
    NSDictionary * _replacements;//MARK: 标题和正文的默认属性配置

}

- (instancetype)init{
    self = [super init];
    if (self) {
        _backingStore = [NSMutableAttributedString new];
            }
    return self;
}

- (NSString *)string{
    return _backingStore.string;
}
#pragma mark - 获取特定区域文本的属性
- (NSDictionary<NSString *,id> *)attributesAtIndex:(NSUInteger)location effectiveRange:(NSRangePointer)range
{
    return [_backingStore attributesAtIndex:location effectiveRange:range];
}
#pragma mark - 编辑文本 ~~暂时用不到
- (void)replaceCharactersInRange:(NSRange)range withString:(NSString *)str
{
    [_backingStore replaceCharactersInRange:range withString:str];
    [self edited:NSTextStorageEditedCharacters range:range changeInLength:str.length - range.length];
}
#pragma mark - 设置文章属性
- (void)setAttributes:(NSDictionary<NSString *,id> *)attrs range:(NSRange)range
{
    [_backingStore setAttributes:attrs range:range];
    [self edited:NSTextStorageEditedAttributes range:range changeInLength:0];
}




#pragma mark - 更新文章字体

- (void)update
{
    [self createHighlightPatterns];// 第一章第二章等文字需要放大，加粗
    NSDictionary *bodyFont =  @{NSFontAttributeName :
                                    [UIFont preferredFontForTextStyle:UIFontTextStyleBody]};
    [self addAttributes:bodyFont
                  range:NSMakeRange(0, self.length)];
    
    // re-apply the regex matches
    [self applyStylesToRange:NSMakeRange(0, self.length)];
}


- (void)applyStylesToRange:(NSRange)searchRange
{
    NSDictionary* normalAttrs = @{NSFontAttributeName:
                                      [UIFont preferredFontForTextStyle:UIFontTextStyleBody]};
    
    // iterate over each replacement
    for (NSString* key in _replacements) {
        NSRegularExpression *regex = [NSRegularExpression
                                      regularExpressionWithPattern:key
                                      options:0
                                      error:nil];
        
        NSDictionary* attributes = _replacements[key];
        
        [regex enumerateMatchesInString:[_backingStore string]
                                options:0
                                  range:searchRange
                             usingBlock:^(NSTextCheckingResult *match,
                                          NSMatchingFlags flags,
                                          BOOL *stop){
                                 // apply the style
                                 NSRange matchRange = [match rangeAtIndex:1];
                                 [self addAttributes:attributes range:matchRange];
                                 
                                 // reset the style to the original
                                 if (NSMaxRange(matchRange)+1 < self.length) {
                                     [self addAttributes:normalAttrs
                                                   range:NSMakeRange(NSMaxRange(matchRange)+1, 1)];
                                 }
                             }];
    }
}



#pragma mark - 文本高亮，比如标题等的突出显示
- (void) createHighlightPatterns {
    UIFontDescriptor *scriptFontDescriptor =
    [UIFontDescriptor fontDescriptorWithFontAttributes:
     @{UIFontDescriptorFamilyAttribute: @"Zapfino"}];
    
    // 1. base our script font on the preferred body font size
    UIFontDescriptor* bodyFontDescriptor = [UIFontDescriptor
                                            preferredFontDescriptorWithTextStyle:UIFontTextStyleBody];
    NSNumber* bodyFontSize = bodyFontDescriptor.
    fontAttributes[UIFontDescriptorSizeAttribute];
    UIFont* scriptFont = [UIFont
                          fontWithDescriptor:scriptFontDescriptor size:[bodyFontSize floatValue]];
    
    // 2. create the attributes
    NSDictionary* boldAttributes = [self
                                    createAttributesForFontStyle:UIFontTextStyleBody
                                    withTrait:UIFontDescriptorTraitBold];
    NSDictionary* italicAttributes = [self
                                      createAttributesForFontStyle:UIFontTextStyleBody
                                      withTrait:UIFontDescriptorTraitItalic];
    NSDictionary* strikeThroughAttributes = @{ NSStrikethroughStyleAttributeName : @1};
    NSDictionary* scriptAttributes = @{ NSFontAttributeName : scriptFont};
    NSDictionary* redTextAttributes =
    @{ NSForegroundColorAttributeName : [UIColor redColor]};
    
    // construct a dictionary of replacements based on regexes
    _replacements = @{
                      @"(\\*\\w+(\\s\\w+)*\\*)\\s" : boldAttributes,
                      @"(_\\w+(\\s\\w+)*_)\\s" : italicAttributes,
                      @"([0-9]+\\.)\\s" : boldAttributes,
                      @"(-\\w+(\\s\\w+)*-)\\s" : strikeThroughAttributes,
                      @"(~\\w+(\\s\\w+)*~)\\s" : scriptAttributes,
                      @"\\s([A-Z]{2,})\\s" : redTextAttributes};
}


- (NSDictionary*)createAttributesForFontStyle:(NSString*)style
                                    withTrait:(uint32_t)trait {
    UIFontDescriptor *fontDescriptor = [UIFontDescriptor
                                        preferredFontDescriptorWithTextStyle:UIFontTextStyleBody];
    
    UIFontDescriptor *descriptorWithTrait = [fontDescriptor
                                             fontDescriptorWithSymbolicTraits:trait];
    
    UIFont* font =  [UIFont fontWithDescriptor:descriptorWithTrait size: 0.0];
    return @{ NSFontAttributeName : font };
}


@end
