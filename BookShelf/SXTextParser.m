//
//  SXTextParser.m
//  BookShelf
//
//  Created by tangyuhua on 2017/5/8.
//  Copyright © 2017年 tangyuhua. All rights reserved.
//

#import "SXTextParser.h"

@implementation SXTextParser
{
    NSDictionary *_bodyTextAttributes;
    NSDictionary *_headingOneAttributes;
    NSDictionary *_headingTwoAttributes;
    NSDictionary *_headingThreeAttributes;
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
    return @{NSFontAttributeName: font};
}



@end
