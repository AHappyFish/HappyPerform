//
//  UIImage+Extension.h
//  黑马微博
//
//  Created by apple on 14-7-3.
//  Copyright (c) 2014年 heima. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Extension)
+ (UIImage *)imageWithName:(NSString *)name;
/**
*  根据图片名返回一张能够自由拉伸的图片
*/
+ (UIImage *)resizedImage:(NSString *)name;

// 头像截取 boder为0 无边框
+(instancetype)imageWithCircleByBorder:(CGFloat)margin color:(UIColor *)color imageName:(NSString *)name;
+(instancetype)imageWithCircleByBorder:(CGFloat)margin color:(UIColor *)color image:(UIImage *)image;
@end
