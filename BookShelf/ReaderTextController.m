//
//  ReaderTextController.m
//  BookShelf
//
//  Created by tangyuhua on 2017/4/27.
//  Copyright © 2017年 tangyuhua. All rights reserved.
//

#import "ReaderTextController.h"
#import "SXBottomStatusBar.h"
@interface ReaderTextController ()

@property (nonatomic, strong) UITextView *textView;
@property (nonatomic, strong) id<ReaderModelProtocol> model;

@property (nonatomic, strong) SXBottomStatusBar *statusBar;
@end

@implementation ReaderTextController

- (instancetype)initWithReaderModel:(id<ReaderModelProtocol>)model
{
    self = [super init];
    if (self) {
        self.model = model;
 
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithWhite:0.8 alpha:1.0];
    [self buildViewsForCurrentPage];
    self.statusBar = [[SXBottomStatusBar alloc] initWithFrame:CGRectMake(0, self.view.height - 20, self.view.width, 20)];
    [self.view addSubview:self.statusBar];
}


- (void) buildViewsForCurrentPage
{

    NSTextContainer *textContainer = [[ReaderManager sharedManager] currentTextContainer];
    CGRect textViewFame = CGRectInset(self.view.bounds, 15, 40);
    self.textView = [[UITextView alloc] initWithFrame:textViewFame textContainer:textContainer];
    self.textView.scrollEnabled = NO;
    [self.view addSubview:self.textView];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


@end
