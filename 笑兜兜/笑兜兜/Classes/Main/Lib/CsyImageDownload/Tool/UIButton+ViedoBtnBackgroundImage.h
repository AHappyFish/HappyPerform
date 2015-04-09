//
//  UIButton+ViedoBtnBackgroundImage.h
//  笑兜兜
//
//  Created by dyf on 14-8-11.
//  Copyright (c) 2014年 cn.happy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (ViedoBtnBackgroundImage)

- (void)setBackgroundImageWithString:(NSString *)urlStr forState:(UIControlState)state placeholderImageName:(NSString *)placeholderStr;

@end
