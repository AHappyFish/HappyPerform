//
//  HPMainController.m
//  提升幸福感
//
//  Created by shaun on 14-7-29.
//  Copyright (c) 2014年 cn.happy. All rights reserved.
//

#import "HPMainController.h"
//#import "HPImageController.h"
#import "HPTextController.h"
#import "HPVideoController.h"
#import "HPVoiceController.h"
#import "HPNavigationController.h"
#import "HPTabViewController.h"
#import "HPLeftMenu.h"

#define animationDura 0.3
@interface HPMainController ()

@property (nonatomic, strong) HPTabViewController *tabVc;
@property (nonatomic, strong) HPLeftMenu *leftMenu;

/**
 *  蒙版
 */
@property (nonatomic, strong) UIButton *cover;

@end

@implementation HPMainController

-(HPTabViewController *)tabVc
{
    if (!_tabVc) {
        
        _tabVc = [[HPTabViewController alloc] init];
    }
    return _tabVc;
}

-(HPLeftMenu *)leftMenu
{
    if (!_leftMenu) {
        
        _leftMenu = [[HPLeftMenu alloc] init];
    }
    return _leftMenu;
}

-(UIButton *)cover
{
    if (!_cover) {
        // 添加蒙版
        UIButton *cover = [[UIButton alloc] init];
        [cover addTarget:self action:@selector(coverClick:) forControlEvents:UIControlEventTouchUpInside];
        _cover = cover;
    }
    return _cover;
}



-(void)viewDidLoad
{
    [super viewDidLoad];
    
    // 添加左边的view
    [self setupLeftView];
    NSUserDefaults *nightDefault = [NSUserDefaults standardUserDefaults];
    BOOL night = [nightDefault boolForKey:HPNightModel];
    if (night) {
        self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"offlinebg"]];
    }else{ //bgselectView
        self.view.backgroundColor = HPColor(234, 234, 234);
    }
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(openNight) name:HPSwitchOpen object:nil];
    // 关闭夜间模式
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(closeNight) name:HPSwitchClose object:nil];
    UISwipeGestureRecognizer *swipe = [[UISwipeGestureRecognizer alloc] init];
    [self.tabVc.view addGestureRecognizer:swipe];
    [swipe addTarget:self action:@selector(swipeGest)];
    [self.view addSubview:self.tabVc.view];
    [self addChildViewController:self.tabVc];
    
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(leftShow) name:HPLeftMenuNotification object:nil];
    
}

-(void)openNight
{
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"offlinebg"]];
}
-(void)closeNight
{
    self.view.backgroundColor = HPColor(234, 234, 234);
}
-(void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

-(void)setupLeftView
{
    CGFloat margin = 30;
    self.leftMenu.tableView.x = 0;
    self.leftMenu.tableView.y = 30;
    self.leftMenu.tableView.height = HPScreenH - 2 * margin;;
    self.leftMenu.tableView.width = 240;
    [self.view addSubview:self.leftMenu.tableView];
}

// 蒙版点击方法
-(void)coverClick:(UIButton *)cover
{
    [UIView animateWithDuration:animationDura animations:^{
        UIView *showView = self.tabVc.view;
        showView.transform = CGAffineTransformIdentity;
    } completion:^(BOOL finished) {
        // 移除蒙版
        [cover removeFromSuperview];
    }];
}

-(void)leftShow
{
    // 取出view
    UIView *view = self.tabVc.view;
    // 设置阴影
    view.layer.shadowColor = [UIColor blackColor].CGColor;
    view.layer.shadowOffset = CGSizeMake(-4, 0);
    view.layer.shadowOpacity = 0.4;
    // 形变用transform不会导致缩小后
    // 计算形变比例
    double scale = self.leftMenu.tableView.height / self.view.height;
    // 目标x值
    CGFloat viewX = self.leftMenu.tableView.width + 15;
    [self animationView:view Sacle:scale tx:viewX];
}

// 动画方法
-(void)animationView:(UIView *)view Sacle:(double)scale tx:(CGFloat)viewX
{
    [UIView animateWithDuration:animationDura animations:^{
        // 形变
        CGAffineTransform transform = CGAffineTransformMakeScale(scale, scale);
        
        // 平移
        transform = CGAffineTransformTranslate(transform, viewX, 0);
        view.transform = transform;
        
        // 添加蒙版
        self.cover.frame = view.bounds;
        [view addSubview:self.cover];
    }];
}


-(void)swipeGest
{
    [self leftShow];
}
@end
