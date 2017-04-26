//
//  UIColor+SXAdd.m
//  BookShelf
//
//  Created by tangyuhua on 2017/4/25.
//  Copyright © 2017年 tangyuhua. All rights reserved.
//

#import "UIColor+SXAdd.h"

@implementation UIColor (SXAdd)


+ (UIColor *)nameLabelColor
{
    static  UIColor *color = nil;
    if (color) {
        color = [UIColor blackColor];
    }
    return color;
}

@end
