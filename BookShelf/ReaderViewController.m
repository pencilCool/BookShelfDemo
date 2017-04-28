//
//  ReadViewController.m
//  BookShelf
//
//  Created by tangyuhua on 2017/4/26.
//  Copyright © 2017年 tangyuhua. All rights reserved.
//

#import "ReaderViewController.h"
#import "SXReadBottomBar.h"
#import "SXReadTopBar.h"
#import "DownLoadViewController.h"

#import "ReaderTextController.h"
@interface ReaderViewController ()<SXReadTapToolBarDelegate,UIPageViewControllerDelegate,UIPageViewControllerDataSource>
@property (nonatomic, strong) SXReadBottomBar *bottomBar;
@property (nonatomic,strong)  SXReadTopBar    *topBar;

@property (nonatomic, strong) UIPageViewController *pageViewController;


@end

@implementation ReaderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configEvents];
    self.view.backgroundColor = [UIColor colorWithWhite:0.8 alpha:1.0];
    [self addPageViewController];
    [self showReaderPage:0];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

- (void)configEvents{
    [self.view bk_whenTapped:^{
        if (self.topBar && self.bottomBar) {
            [self hiddenToolBar];
        }else {
            [self showToolBar];
        }
    }];
}



- (void)showReaderPage:(NSUInteger)page
{
    ReaderTextController *reader = [ReaderTextController new];
    [self.pageViewController setViewControllers:@[reader]
                                  direction:UIPageViewControllerNavigationDirectionForward
                                   animated:NO
                                 completion:nil];
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
            [self performSegueWithIdentifier:@"DownLoad" sender:self];
        }
            
        default:
            break;
    }
}



#pragma mark - UIPageViewControllerDataSource

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
   NSLog(@"go pre");
    
    ReaderTextController *reader = [ReaderTextController new];
    return reader;
}


- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    NSLog(@"go after");
    
    ReaderTextController *reader = [ReaderTextController new];
    return reader;
}

#pragma mark - UIPageViewControllerDelegate

- (void)pageViewController:(UIPageViewController *)pageViewController didFinishAnimating:(BOOL)finished previousViewControllers:(NSArray<UIViewController *> *)previousViewControllers transitionCompleted:(BOOL)completed
{
    
}




- (void)addPageViewController
{
    UIPageViewController *pageViewController = [[UIPageViewController alloc]init];
    pageViewController.delegate   = self;
    pageViewController.dataSource = self;
    pageViewController.view.frame = self.view.bounds;
    
    [self addChildViewController:pageViewController];
    [self.view addSubview:pageViewController.view];
    _pageViewController = pageViewController;

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
