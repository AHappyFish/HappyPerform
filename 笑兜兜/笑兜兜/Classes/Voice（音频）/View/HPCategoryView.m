//
//  HPEntertainmentView.m
//  笑兜兜
//
//  Created by shaun on 14-8-5.
//  Copyright (c) 2014年 cn.happy. All rights reserved.
//

#import "HPCategoryView.h"
#import "UIImageView+WebCache.h"


@interface  HPCategoryView()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@property (weak, nonatomic) IBOutlet UILabel *labelView;

@end

@implementation HPCategoryView
+(instancetype)categoryView
{
    return [[[NSBundle mainBundle] loadNibNamed:@"categoryView" owner:nil options:nil] lastObject];
}

-(void)setIcon:(NSString *)icon
{
    _icon = icon;
    // 需要一张占位图片
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:icon] placeholderImage:nil];
}

-(void)setTitle:(NSString *)title
{
    _title = title;
    
    self.labelView.text = title;
}

@end
