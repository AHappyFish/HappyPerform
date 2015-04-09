//
//  UIImage+tools.m
//  10-QQ
//
//  Created by csy on 5/30/14.
//  Copyright (c) 2014 cl. All rights reserved.
//

#import "UIImage+Tools.h"


@implementation UIImage (tools)

/**
 *  获取可拉伸的图片
 *
 *  @param imageName 原图片的名称
 *
 *  @return 可拉伸图片
 */
+ (instancetype)resizableImageWithName:(NSString *)imageName
{
    
    // 加载原有图片
    UIImage *norImage = [UIImage imageNamed:imageName];
    // 获取原有图片的宽高的一半
    CGFloat w = norImage.size.width * 0.5;
    CGFloat h = norImage.size.height * 0.5;
    // 生成可以拉伸指定位置的图片
    UIImage *newImage = [norImage resizableImageWithCapInsets:UIEdgeInsetsMake(h, w, h, w) resizingMode:UIImageResizingModeStretch];
    
    return newImage;
}



@end
