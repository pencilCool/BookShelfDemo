//
//  ReaderManager.m
//  BookShelf
//
//  Created by tangyuhua on 2017/4/28.
//  Copyright © 2017年 tangyuhua. All rights reserved.
//

#import "ReaderManager.h"

@implementation ReaderManager



+ (NSString *)fetchChapter
{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"第1章" ofType:@"txt"];
    NSString *result = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    return result;
  
}
@end
