//
//  UIBarButtonItem+HPExtension.m
//  团伙作案HD
//
//  Created by shaun on 14-8-18.
//  Copyright (c) 2014年 HP. All rights reserved.
//

#import "UIBarButtonItem+HPExtension.h"

@implementation UIBarButtonItem (HPExtension)

// 实现
+(UIBarButtonItem *)barButtonItemWithImage:(NSString *)image highLightedImage:(NSString *)highImage target:(id)target action:(SEL)action
{
    // 设置按钮
    UIButton *btn =[[UIButton alloc] init];
    [btn setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:highImage] forState:UIControlStateHighlighted];
    btn.size = btn.currentImage.size;
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    // 图片模式
    btn.imageView.contentMode = UIViewContentModeScaleAspectFit;
    
    // 设置为UIBarButtonItem的视图
    return [[UIBarButtonItem alloc] initWithCustomView:btn];
    
}


@end
