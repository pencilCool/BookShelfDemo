//
//  ReaderTextController.m
//  BookShelf
//
//  Created by tangyuhua on 2017/4/27.
//  Copyright © 2017年 tangyuhua. All rights reserved.
//

#import "ReaderTextController.h"

@interface ReaderTextController ()
@property (nonatomic, strong) YYLabel *label;
@end

@implementation ReaderTextController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.label];
    self.label.text = [ReaderManager fetchChapter];
    NSRange visibleRange =  self.label.textLayout.visibleRange;
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

- (YYLabel *)label
{
    if (!_label) {
        _label = [YYLabel new];
        _label.frame = self.view.bounds;
        _label.textColor = [UIColor greenColor];
        _label.numberOfLines = 0;
    }
    return _label;
}

@end
