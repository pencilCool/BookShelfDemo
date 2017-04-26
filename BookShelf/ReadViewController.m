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
@interface ReadViewController ()

@end

@implementation ReadViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.tabBarController.tabBar setHidden:YES];
    [[self navigationController] setNavigationBarHidden:YES animated:YES];

    [self.view bk_whenTapped:^{
        [self showToolBar];
    }];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


- (void)showToolBar {
    
    
    SXReadBottomBar *bottomBar = [SXReadBottomBar createViewFromNib];
    [self.view addSubview:bottomBar];
    bottomBar.frame = CGRectMake(0,self.view.height,self.view.width,44);
    [UIView animateWithDuration:0.2 animations:^{
        bottomBar.frame = CGRectMake(0,self.view.height - 44,self.view.width,44);
    }];
    
    
    SXReadTopBar  *topBar = [SXReadTopBar createViewFromNib];
    [self.view addSubview:topBar];
    topBar.frame = CGRectMake(0, -64, self.view.width, 44);
    
    [UIView animateWithDuration:0.2 animations:^{
        topBar.frame = CGRectMake(0, 20, self.view.width, 44);
    }];
    
    
    
}
@end
