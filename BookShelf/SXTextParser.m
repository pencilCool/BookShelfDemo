//
//  SXTextParser.m
//  BookShelf
//
//  Created by tangyuhua on 2017/5/8.
//  Copyright © 2017年 tangyuhua. All rights reserved.
//

#import "SXTextParser.h"
@interface SXTextParser()

@end
@implementation SXTextParser
{
    NSDictionary *_bodyTextAttributes;
    NSDictionary *_headingOneAttributes;
    NSDictionary *_headingTwoAttributes;
    NSDictionary *_headingThreeAttributes;
    UIFont       *currentFont;
}

- (instancetype)init {
    if (self = [super init]){
        [self createTextAttributes];
    }
    return self;
}


- (NSAttributedString *)parseString:(NSString *)str
{
    NSMutableAttributedString *parsedOutput = [NSMutableAttributedString new];
    
    
    NSAttributedString *attributedText = [[NSAttributedString alloc] initWithString:str attributes:_headingThreeAttributes];
    [parsedOutput appendAttributedString:attributedText];
    
    
    // 添加段落属性
    NSMutableParagraphStyle *paragraphStyle = [NSMutableParagraphStyle new];
    paragraphStyle.firstLineHeadIndent = 2* [currentFont pointSize];
    paragraphStyle.lineBreakMode = NSLineBreakByWordWrapping;
    paragraphStyle.paragraphSpacing = 20;//段落后间距
    paragraphStyle.paragraphSpacingBefore = 5;//段落前间距
    paragraphStyle.lineHeightMultiple = 1.0;//行间距多少倍
    paragraphStyle.alignment = NSTextAlignmentLeft;//对齐方式
    paragraphStyle.lineSpacing = 2;
    
    
    NSRange range = NSMakeRange(0, str.length);
    [parsedOutput addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:range];
    return parsedOutput;
}



- (void)createTextAttributes {
    UIFontDescriptor *baskerville = [UIFontDescriptor fontDescriptorWithFontAttributes:@{UIFontDescriptorFamilyAttribute: @"Baskerville"}];
    UIFontDescriptor *basekervilleBold = [baskerville fontDescriptorWithSymbolicTraits:UIFontDescriptorTraitBold];
    
    // 检测系统动态字体的大小，转化成UIFontDescriptor
    UIFontDescriptor *bodyFont = [UIFontDescriptor preferredFontDescriptorWithTextStyle:UIFontTextStyleBody];
    
    NSNumber *bodyFontSize = bodyFont.fontAttributes[UIFontDescriptorSizeAttribute];
    
    CGFloat bodyFontSizeValue = [bodyFontSize floatValue];
    
    _bodyTextAttributes = [self attributesWithDescriptor:baskerville size:bodyFontSizeValue];
    _headingOneAttributes = [self attributesWithDescriptor:basekervilleBold size:bodyFontSizeValue * 2.0f];
    _headingTwoAttributes = [self attributesWithDescriptor:basekervilleBold size:bodyFontSizeValue * 1.8];
    _headingThreeAttributes = [self attributesWithDescriptor:basekervilleBold size:bodyFontSizeValue * 1.4f];
    
    
}

- (NSDictionary *)attributesWithDescriptor:(UIFontDescriptor *)descriptor size:(CGFloat) size {
    UIFont *font = [UIFont fontWithDescriptor:descriptor size:size];
    currentFont = font;
    return @{NSFontAttributeName: font};
}



@end
