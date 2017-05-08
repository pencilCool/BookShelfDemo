//
//  ReaderModelProtocol.h
//  BookShelf
//
//  Created by tangyuhua on 2017/4/28.
//  Copyright © 2017年 tangyuhua. All rights reserved.
//

#import <Foundation/Foundation.h>
// 定义每一章，需要哪些信息，
// 定义每一页需要哪些信息。
@protocol ReaderModelProtocol <NSObject>  //需要有哪些数据呢?
@property (nonatomic, strong) NSString *text;
@property (nonatomic, weak )  YYTextView  *textView;

@end


