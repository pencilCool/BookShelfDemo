//
//  DownLoadViewController.m
//  BookShelf
//
//  Created by tangyuhua on 2017/4/27.
//  Copyright © 2017年 tangyuhua. All rights reserved.
//

#import "DownLoadViewController.h"

@interface DownLoadViewController ()

@end

@implementation DownLoadViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //[self.navigationController setNavigationBarHidden:NO animated:NO];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

- (IBAction)back:(UIBarButtonItem *)sender {
    [self.navigationController popViewControllerAnimated:YES];
}


@end
