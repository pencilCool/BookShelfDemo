//
//  SXReaderSettingView.m
//  BookShelf
//
//  Created by tangyuhua on 2017/5/8.
//  Copyright © 2017年 tangyuhua. All rights reserved.
//

#import "SXReaderSettingView.h"
@interface SXReaderSettingView()
@property (weak, nonatomic) IBOutlet UIButton *smallFontButton;

@property (weak, nonatomic) IBOutlet UIButton *bigFontButton;
@property (weak, nonatomic) IBOutlet UILabel *fontSizeLabel;


@end
@implementation SXReaderSettingView
{
    CGRect originalFrame;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
       self.frame = CGRectMake(0, kScreenHeight, kScreenWidth, 240);
        [self configureEvent];
    }
    return self;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    
}

- (void)configureEvent
{
        [self bk_whenTapped:^{
           // do no thing ,just avoid event sender to his superview,when font button disabled
        }];
}

- (void)appear
{
    _isAppear = YES;
    [UIView animateWithDuration:0.3 animations:^{
        self.frame = CGRectMake(0, kScreenHeight - 240, kScreenWidth, 240);
    }];
    
}

- (void)disappear
{
    _isAppear = NO;
    [UIView animateWithDuration:0.3 animations:^{
        self.frame = CGRectMake(0, kScreenHeight, kScreenWidth, 240);
    }];
}

#pragma mark - Font

- (IBAction)smallFont:(id)sender {
   if (![[ReaderManager sharedManager] smallerFontSize])
   {
       self.smallFontButton.enabled = NO;
   }
   else
   {
       self.bigFontButton.enabled = YES;
   }
   
    self.fontSizeLabel.text =  [NSString stringWithFormat:@"%d",(int)[[ReaderManager sharedManager] currentFontSize]];
}


- (IBAction)bigFont:(id)sender {
    
    if (![[ReaderManager sharedManager] biggerFontSize])
    {
        self.bigFontButton.enabled = NO;
    }
    else
    {
        self.smallFontButton.enabled = YES;
    }
    self.fontSizeLabel.text =  [NSString stringWithFormat:@"%d",(int)[[ReaderManager sharedManager] currentFontSize]];
}



@end
