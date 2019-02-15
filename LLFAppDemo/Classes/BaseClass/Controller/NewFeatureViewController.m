//
//  NewFeatureViewController.m
//  LLFAppDemo
//
//  Created by 帮啦跑腿 on 2019/2/14.
//  Copyright © 2019 刘龙飞. All rights reserved.
//

#import "NewFeatureViewController.h"

#define scrollViewPage 2

@interface NewFeatureViewController ()<UIScrollViewDelegate>

@property (strong, nonatomic) UIScrollView *scrollView;
@property (strong, nonatomic) UIPageControl *pageControl;

@end

@implementation NewFeatureViewController

#pragma mark - lazyLoad

- (UIScrollView *)scrollView
{
    if (!_scrollView)
    {
        _scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth, KScreenHeight)];
        _scrollView.pagingEnabled = YES;
        _scrollView.bounces = NO;
        _scrollView.contentSize = CGSizeMake(scrollViewPage * KScreenWidth,KScreenHeight);
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.delegate = self;
        
        
        for (int i = 0; i < scrollViewPage; i ++)
        {
            UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(i *KScreenWidth, 0, KScreenWidth, KScreenHeight)];
            imageView.backgroundColor = [UIColor blackColor];
            imageView.contentMode = UIViewContentModeScaleAspectFit;
            imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"6_%d", i + 1]];
            [_scrollView addSubview:imageView];
            imageView.userInteractionEnabled = YES;
            if (i == scrollViewPage-1)
            {
                UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(startNewJourney)];
                [imageView addGestureRecognizer:tap];
            }
        }
    }
    return _scrollView;
}

- (UIPageControl *)pageControl
{
    if (!_pageControl)
    {
        _pageControl = [[UIPageControl alloc]initWithFrame:CGRectMake(0, KScreenHeight-40, KScreenWidth, 40)];
        _pageControl.numberOfPages = scrollViewPage;
        _pageControl.currentPageIndicatorTintColor = [UIColor colorWithRed:253/255.0 green:98/255.0 blue:42/255.0 alpha:1];
        
        _pageControl.pageIndicatorTintColor = [UIColor colorWithRed:189/255.0 green:189/255.0 blue:189/255.0 alpha:1];
    }
    return _pageControl;
}

#pragma mark - life cycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];

    [self.view addSubview:self.scrollView];
    //图片没有设计圆点点就加上pagecontro
    //    [self.view addSubview:self.pageControl];
}

- (void)dealloc
{
    NSLog(@"版本新特性视图控制器被销毁了");
}

#pragma mark - self

-(void)startNewJourney
{
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    window.rootViewController = [[LLFBaseTabBarViewController alloc]init];
}

#pragma mark - UISrollViewdelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    int page = (scrollView.contentOffset.x/KScreenWidth)+0.5;
    self.pageControl.currentPage = page;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end

