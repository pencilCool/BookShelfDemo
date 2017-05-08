//
//  ReaderTextController.m
//  BookShelf
//
//  Created by tangyuhua on 2017/4/27.
//  Copyright © 2017年 tangyuhua. All rights reserved.
//

#import "ReaderTextController.h"

@interface ReaderTextController ()

@property (nonatomic, strong) UITextView *textView;
@property (nonatomic, strong) id<ReaderModelProtocol> model;
@property (nonatomic, strong) NSLayoutManager *layoutManager;
@property (nonatomic, strong) NSTextContainer *textContainer;
@property (nonatomic, strong) NSTextStorage   *textStorage;

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
    self.view.backgroundColor = [UIColor whiteColor];
    self.textStorage = [[NSTextStorage alloc] initWithAttributedString:self.content];
    self.layoutManager = [[NSLayoutManager alloc] init];
    [self.textStorage addLayoutManager:self.layoutManager];
    
    NSRange range = NSMakeRange(0, 0);
    self.containterIndex = 0;
    
    while (NSMaxRange(range) < _layoutManager.numberOfGlyphs) {
        CGSize containerSize = CGSizeMake(self.view.width, self.view.height - 16);
        NSTextContainer *container =  [[NSTextContainer alloc] initWithSize:containerSize];
        [_layoutManager addTextContainer:container];
        self.containterIndex ++ ;
        range = [_layoutManager glyphRangeForTextContainer:container];
    }
    

    [self buildViewsForCurrentPage];
   
    
    
}


- (void) buildViewsForCurrentPage
{
    CGRect textViewFame = CGRectInset(self.view.bounds, 20, 20);
    NSUInteger index = [ReaderManager sharedManager].currentChapeterContainerIndex;
     NSTextContainer *textContainer = _layoutManager.textContainers[index];
    self.textView = [[UITextView alloc] initWithFrame:textViewFame textContainer:textContainer];
    [self.view addSubview:self.textView];
   

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}




- (NSAttributedString *)content{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"第1章" ofType:@"txt"];
    NSString *result  = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    return  [[NSAttributedString alloc] initWithString:result];
}








@end
