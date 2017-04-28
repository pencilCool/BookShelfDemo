//
//  ChapterModel.h
//  BookShelf
//
//  Created by tangyuhua on 2017/4/28.
//  Copyright © 2017年 tangyuhua. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ChapterModel : NSObject<ReaderModelProtocol>
@property (nonatomic,strong) NSString *text;
@end
