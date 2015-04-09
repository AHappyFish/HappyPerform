//
//  UIImage+Extension.m
//  黑马微博
//
//  Created by apple on 14-7-3.
//  Copyright (c) 2014年 heima. All rights reserved.
//

#import "UIImage+Extension.h"

@implementation UIImage (Extension)
+ (UIImage *)imageWithName:(NSString *)name
{
    UIImage *image = nil;
    if (iOS7) { // 处理iOS7的情况
        NSString *newName = [name stringByAppendingString:@"_os7"];
        image = [UIImage imageNamed:newName];
    }
    
    if (image == nil) {
        image = [UIImage imageNamed:name];
    }
    return image;
}
+ (UIImage *)resizedImage:(NSString *)name
{
    UIImage *image = [UIImage imageWithName:name];
    return [image stretchableImageWithLeftCapWidth:image.size.width * 0.5 topCapHeight:image.size.height * 0.5];
}


// 有boder头像截取
+(instancetype)imageWithCircleByBorder:(CGFloat)margin color:(UIColor *)color imageName:(NSString *)name
{
    // 拿到图片
    UIImage *bg = [UIImage imageNamed:name];
    return [self imageWithCircleByBorder:margin color:color image:bg];
}


+(instancetype)imageWithCircleByBorder:(CGFloat)margin color:(UIColor *)color image:(UIImage *)image
{
    {
        // 拿到图片
        UIImage *bg = image;
        
        // 设置环境为bitmap
        CGFloat w = bg.size.width;
        CGFloat h = bg.size.height;
        CGSize size = CGSizeMake(w + margin, h + margin);
        UIGraphicsBeginImageContextWithOptions(size, NO, 0);
        // 拿到设置好的环境
        CGContextRef ctx = UIGraphicsGetCurrentContext();
        
        // 画大圆
        CGContextAddEllipseInRect(ctx, CGRectMake(0, 0, size.width, size.height));
        [[UIColor purpleColor] set];
        CGContextFillPath(ctx);
        
        // 画小圆
        CGContextAddEllipseInRect(ctx, CGRectMake(margin * 0.5, margin * 0.5, bg.size.width, bg.size.height));
        
        
        [[UIColor blackColor] set];
        //    CGContextFillPath(ctx);
        // 设置可视范围 这句之前的绘图不影响显示 之后的绘图会收到可视范围的限制
        CGContextClip(ctx);
        
        // 在可视范围内绘图
        [bg drawInRect:CGRectMake(margin * 0.5, margin * 0.5, bg.size.width, bg.size.height)];
        
        // 从bitmap上下文中拿到图
        UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
        //    self.iv.image = image;
        
        // 存储图片 先转NSData
        //    NSData *data = UIImagePNGRepresentation(image);
        //    [data writeToFile:@"" atomically:YES];
        return image;
        
    }
}

@end
