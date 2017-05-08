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
@interface ReaderViewController ()<SXReadTopToolBarDelegate,SXReadBottomToolBarDelegate,UIPageViewControllerDelegate,UIPageViewControllerDataSource>
@property (nonatomic, strong) SXReadBottomBar *bottomBar;
@property (nonatomic,strong)  SXReadTopBar    *topBar;

@property (nonatomic, strong) UIPageViewController *pageViewController;


@end

@implementation ReaderViewController{
    BOOL toolBarShow;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configEvents];
    toolBarShow = NO;
    self.automaticallyAdjustsScrollViewInsets = NO;
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

- (BOOL)prefersStatusBarHidden
{
    return !toolBarShow;
}

- (void)showReaderPage:(NSUInteger)page
{
    id<ReaderModelProtocol> model = [[ReaderManager sharedManager] currentPage];
    ReaderTextController *reader = [[ReaderTextController alloc] initWithReaderModel:model];
    [self.pageViewController setViewControllers:@[reader]
                                  direction:UIPageViewControllerNavigationDirectionForward
                                   animated:NO
                                 completion:nil];
}
#pragma  mark - SXReadTapToolBarDelegate
- (void)readerTopToolBar:(SXReadTopBar *)readerToolBar didClickedAction:(SXReadTopToolBarAction)action
{
    switch (action) {
        case SXReadTopToolBarActionBack:
            [self.navigationController popViewControllerAnimated:YES];
            break;
        case SXReadTopToolBarActionDownLoad:
        {
            [self performSegueWithIdentifier:@"DownLoad" sender:self];
        }
            
        default:
            break;
    }
}

#pragma mark - SXReadBottomToolBarDelegate

- (void)readerBottomToollBar:(SXReadBottomBar *)readerToolBar didClickedAction:(SXReadBottomToolBarAction)action
{
    switch (action) {
        case SXReadBottomToolBarActionCatalog:
            //FIXME: catalog
            NSLog(@"catalog");
            break;
        case SXReadBottomToolBarActionSettings:
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
    id<ReaderModelProtocol> model = [[ReaderManager sharedManager] prePage];
    ReaderTextController *reader = [[ReaderTextController alloc] initWithReaderModel:model];
    return reader;
}


- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    NSLog(@"go after");
    id<ReaderModelProtocol> model = [[ReaderManager sharedManager] nextPage];
    ReaderTextController *reader = [[ReaderTextController alloc] initWithReaderModel:model];;
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
    toolBarShow = YES;
    [self setNeedsStatusBarAppearanceUpdate];
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
    toolBarShow = NO;
    [self setNeedsStatusBarAppearanceUpdate];
    
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
