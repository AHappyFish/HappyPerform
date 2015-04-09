//
//  UIBarButtonItem+HPExtension.h
//  团伙作案HD
//
//  Created by shaun on 14-8-18.
//  Copyright (c) 2014年 HP. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (HPExtension)

// 设置自定义的导航栏的UIBarButtonItem
+(UIBarButtonItem *)barButtonItemWithImage:(NSString *)image highLightedImage:(NSString *)highImage target:(id)target action:(SEL)action;

@end
