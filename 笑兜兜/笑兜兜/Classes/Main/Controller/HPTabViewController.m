//
//  HPMainViewController.m
//  笑兜兜
//
//  Created by shaun on 14-9-1.
//  Copyright (c) 2014年 cn.happy. All rights reserved.
//

#import "HPTabViewController.h"
#import "HPTextController.h"
#import "HPVideoController.h"
#import "HPVoiceController.h"
#import "HPNavigationController.h"
#import "HPWaterFlowViewController.h"



@interface HPTabViewController ()

@end

@implementation HPTabViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // 添加子控制器
    HPTextController *text = [[HPTextController alloc] init];
    [self addOneChlildVc:text title:@"内涵段子" imageName:@"段子" selectedImageName:@"tabbar_discover_selected"];
    
    // 添加子控制器
    HPWaterFlowViewController *waterFlowImage = [[HPWaterFlowViewController alloc] init];
    [self addOneChlildVc:waterFlowImage title:@"趣图漫画" imageName:@"icon_main" selectedImageName:@""];
    
//    HPImageController *image = [[HPImageController alloc] init];
//    [self addOneChlildVc:image title:@"糗事趣图" imageName:@"看图" selectedImageName:@"tabbar_profile_selected"];
    
    HPVoiceController *voice = [[HPVoiceController alloc] init];
    [self addOneChlildVc:voice title:@"轻松电台" imageName:@"收听" selectedImageName:@"tabbar_discover_selected"];
    
    HPVideoController *video = [[HPVideoController alloc] init];
    [self addOneChlildVc:video title:@"爆笑视频" imageName:@"搞笑" selectedImageName:@"tabbar_profile_selected"];
    
    // 开启夜间模式
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(openNight) name:HPSwitchOpen object:nil];
    
    // 关闭夜间模式
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(closeNight) name:HPSwitchClose object:nil];
}

-(void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

-(void)openNight
{
    for (UIViewController *vc in self.childViewControllers) {
        HPNavigationController *nav = (HPNavigationController *)vc;
        UIViewController *realVc = [nav.childViewControllers firstObject];
        realVc.view.backgroundColor = HPColor(94, 38, 18);
        NSUserDefaults *defaultFile = [NSUserDefaults standardUserDefaults];
        [defaultFile setBool:YES forKey:HPNightModel];
    }
}
-(void)closeNight
{
    for (UIViewController *vc in self.childViewControllers) {
        HPNavigationController *nav = (HPNavigationController *)vc;
        UIViewController *realVc = [nav.childViewControllers firstObject];
        realVc.view.backgroundColor = HPColor(234, 234, 234);
        NSUserDefaults *defaultFile = [NSUserDefaults standardUserDefaults];
        [defaultFile setBool:NO forKey:HPNightModel];
    }
}

/**
 *  添加一个子控制器
 *
 *  @param childVc           子控制器对象
 *  @param title             标题
 *  @param imageName         图标
 *  @param selectedImageName 选中的图标
 */
- (void)addOneChlildVc:(UIViewController *)childVc  title:(NSString *)title imageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName
{
    // 设置标题
    childVc.title = title;
    
    NSUserDefaults *defaultFile = [NSUserDefaults standardUserDefaults];
    BOOL isNight = [defaultFile boolForKey:HPNightModel];
    if (isNight) {
        childVc.view.backgroundColor = HPColor(94, 38, 18);
    }else{
        childVc.view.backgroundColor = HPColor(234, 234, 224);
    }
    

    
    // 设置图标
    childVc.tabBarItem.image = [UIImage imageWithName:imageName];
    
    childVc.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImageName:@"top_navigation_menuicon" highImageName:@"" target:self action:@selector(leftMenu)];
    
    
    // 设置选中的图标
    UIImage *selectedImage = [UIImage imageWithName:selectedImageName];
    if (iOS7) {
        selectedImage = [selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    }
    childVc.tabBarItem.selectedImage = selectedImage;
    
    // 添加为tabbar控制器的子控制器
    HPNavigationController *nav = [[HPNavigationController alloc] initWithRootViewController:childVc];
    [self addChildViewController:nav];
}

// 左边按钮
-(void)leftMenu
{
    [[NSNotificationCenter defaultCenter] postNotificationName:HPLeftMenuNotification object:nil];
}


@end
