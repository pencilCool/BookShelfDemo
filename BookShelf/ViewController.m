//
//  ViewController.m
//  BookShelf
//
//  Created by tangyuhua on 2017/4/25.
//  Copyright © 2017年 tangyuhua. All rights reserved.
//

#import "ViewController.h"
#import "SXBookShelfCell.h"
#import "BookShelfHeadView.h"
#import "ReaderViewController.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong)  BookShelfHeadView *headView;
@property (nonatomic, strong)  UITableView *tableView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = YES;
    [self.view addSubview:self.tableView];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SXBookShelfCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SXBookShefCell" forIndexPath:indexPath];
    cell.coverImageView.image = [UIImage imageNamed:@"testImage.png"];
    cell.nameLabel.text = @"斗破苍穹";
    cell.authorLabel.text = @"天蚕土豆";
    cell.progressLabel.text = @"进度：第一章";
    return  cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [self performSegueWithIdentifier:@"MainCellTaped" sender:self];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
}


- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        [_tableView registerClass:[SXBookShelfCell class] forCellReuseIdentifier:@"SXBookShefCell"];
        _tableView.delegate = self;
        _tableView.dataSource  = self;
        _tableView.rowHeight = UITableViewAutomaticDimension;
        _tableView.estimatedRowHeight = 120;
        
        _tableView.tableHeaderView = self.headView;
    }
    return  _tableView;
}

- (BookShelfHeadView *)headView
{
    if (!_headView) {
        CGRect frame =  CGRectMake(0, 0, kScreenWidth, kScreenWidth * 0.6);
        _headView = [[BookShelfHeadView alloc] initWithFrame:frame];
    }
    return _headView;
}
@end
