//
//  ReaderManager.h
//  BookShelf
//
//  Created by tangyuhua on 2017/4/28.
//  Copyright © 2017年 tangyuhua. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ReaderModelProtocol <NSObject>  //需要有哪些数据呢?
@property (nonatomic, strong) NSString *text;

@end


@interface ReaderManager : NSObject
@property (nonatomic, strong) id<ReaderModelProtocol>model;


+ (NSString *)fetchChapter;
@end
