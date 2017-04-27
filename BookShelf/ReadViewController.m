//
//  ReadViewController.m
//  BookShelf
//
//  Created by tangyuhua on 2017/4/26.
//  Copyright © 2017年 tangyuhua. All rights reserved.
//

#import "ReadViewController.h"
#import "SXReadBottomBar.h"
#import "SXReadTopBar.h"
#import "DownLoadViewController.h"
@interface ReadViewController ()<SXReadTapToolBarDelegate>
@property (nonatomic, strong) SXReadBottomBar *bottomBar;
@property (nonatomic,strong)  SXReadTopBar    *topBar;
@end

@implementation ReadViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.view.backgroundColor = [UIColor colorWithWhite:0.8 alpha:1.0];
    [self.tabBarController.tabBar setHidden:YES];
    [[self navigationController] setNavigationBarHidden:YES animated:YES];
    
    [self.view bk_whenTapped:^{
        if (self.topBar && self.bottomBar) {
            [self hiddenToolBar];
        }else {
            [self showToolBar];
        }
    }];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}



#pragma  mark - SXReadTapToolBarDelegate
- (void)readerTopToolBar:(SXReadTopBar *)readerToolBar didClickedAction:(SXReadTapToolBarAction)action
{
    switch (action) {
        case SXReadTapToolBarActionBack:
            [self.navigationController popViewControllerAnimated:YES];
            break;
        case SXReadTapToolBarActionDownLoad:
        {
            DownLoadViewController *downLoad = [DownLoadViewController new];
            [self.navigationController pushViewController:downLoad animated:YES];
        }
            
        default:
            break;
    }
}











































- (void)showToolBar {
    self.topBar = [SXReadTopBar createViewFromNib];
    self.topBar.delegate = self;
    [self.view addSubview:self.topBar];
    self.topBar.frame = CGRectMake(0, -64, self.view.width, 64);
    
    
    self.bottomBar = [SXReadBottomBar createViewFromNib];
    [self.view addSubview:self.bottomBar];
    self.bottomBar.frame = CGRectMake(0,self.view.height,self.view.width,49);

    
    [UIView animateWithDuration:0.2 animations:^{
        self.topBar.frame = CGRectMake(0, 0, self.view.width, 64);
        self.bottomBar.frame = CGRectMake(0,self.view.height - 49,self.view.width,49);

    }];

}

- (void)hiddenToolBar {
    
    [UIView animateWithDuration:0.2 animations:^{
        self.topBar.frame = CGRectMake(0, -64, self.view.width, 64);
        self.bottomBar.frame = CGRectMake(0,self.view.height,self.view.width,49);

    }completion:^(BOOL finished) {
        [self.bottomBar removeFromSuperview];
        self.bottomBar = nil;
        [self.topBar   removeFromSuperview];
        self.topBar = nil;
    }];
}
@end
