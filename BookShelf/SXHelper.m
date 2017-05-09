//
//  SXHelper.m
//  BookShelf
//
//  Created by tangyuhua on 2017/5/9.
//  Copyright © 2017年 tangyuhua. All rights reserved.
//

#import "SXHelper.h"

@implementation SXHelper


+ (void)printAllFonts
{
    NSArray *fontFamilies = [UIFont familyNames];
    for (NSString *fontFamily in fontFamilies)
    {
        NSArray *fontNames = [UIFont fontNamesForFamilyName:fontFamily];
        NSLog (@"%@: %@", fontFamily, fontNames);
    }
}
@end
