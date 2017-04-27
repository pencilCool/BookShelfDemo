//
//  DownLoadViewController.m
//  BookShelf
//
//  Created by tangyuhua on 2017/4/27.
//  Copyright © 2017年 tangyuhua. All rights reserved.
//

#import "DownLoadViewController.h"
#import "DownLoadCell.h"
@interface DownLoadViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;


@end

@implementation DownLoadViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section  {
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    DownLoadCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DownLoadCell" forIndexPath:indexPath];
    cell.textLabel.text = @"第一章";
    return cell;
}



- (IBAction)back:(UIBarButtonItem *)sender {
    [self.navigationController popViewControllerAnimated:YES];
}


@end
