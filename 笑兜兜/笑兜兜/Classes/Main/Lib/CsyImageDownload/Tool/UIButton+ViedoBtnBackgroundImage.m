//
//  UIButton+ViedoBtnBackgroundImage.m
//  笑兜兜
//
//  Created by dyf on 14-8-11.
//  Copyright (c) 2014年 cn.happy. All rights reserved.
//

#import "UIButton+ViedoBtnBackgroundImage.h"
#import "UIButton+WebCache.h"

@implementation UIButton (ViedoBtnBackgroundImage)

- (void)setBackgroundImageWithString:(NSString *)urlStr forState:(UIControlState)state placeholderImageName:(NSString *)placeholderStr {
    NSURL *url = [NSURL URLWithString:urlStr];
    UIImage *image = [UIImage imageNamed:placeholderStr];
    [self setBackgroundImageWithURL:url forState:state placeholderImage:image];
}

@end
