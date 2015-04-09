//
//  HPDatasBodyView.m
//  笑兜兜
//
//  Created by shaun on 14-8-1.
//  Copyright (c) 2014年 cn.happy. All rights reserved.
//

#import "HPGroupsBodyView.h"
#import "HPGroup.h"
#import "HPUser.h"
#import "UIImageView+WebCache.h"
#import "HPGroupsBodyFrame.h"
#import "UIImage+Extension.h"

@interface HPGroupsBodyView ()
@property (nonatomic,weak)  UIImageView *iconView;
@property (nonatomic,weak) UILabel *nameLable;
@property (nonatomic,weak) UILabel *textLable;
@end
@implementation HPGroupsBodyView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor  = [UIColor clearColor];
        //头像
        UIImageView *iconView = [UIImageView new];
        iconView.layer.cornerRadius = 15;
        [self addSubview:iconView];
        self.iconView = iconView;
        
        //昵称
        UILabel *name = [UILabel new];
        name.font = HPGroupNameFont;
        name.textColor = [UIColor orangeColor];
        [self addSubview:name];
        self.nameLable = name;
        
        //正文
        UILabel *text = [UILabel new];
        text.numberOfLines = 0;
        text.font = HPGroupContentFont;
        [self addSubview:text];
        self.textLable = text;
    }
    return self;
}

- (void)setBodyFrame:(HPGroupsBodyFrame *)bodyFrame
{
    
    
    self.frame = bodyFrame.frame;
    
    HPGroup *group = bodyFrame.group;
    HPUser *user = group.user;
    
    self.nameLable.text = user.name;
    self.nameLable.frame = bodyFrame.nameFrame;
    
    self.textLable.text = group.content;
    self.textLable.frame = bodyFrame.contentFrame;
    
    self.iconView.frame = bodyFrame.iconFrame;
    UIImage *temp = [UIImage imageWithCircleByBorder:1 color:[UIColor redColor] image:[UIImage imageWithName:@"avatar_default_small"]];
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        self.iconView.image = [UIImage imageWithCircleByBorder:1 color:[UIColor grayColor] image:temp.image];
//    });
//    

//    [self.iconView sd_setImageWithURL:[NSURL URLWithString:user.avatar_url] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
//                self.iconView.image = [UIImage imageWithCircleByBorder:1 color:[UIColor grayColor] image:image];
//    }];
    [self.iconView sd_setImageWithURL:[NSURL URLWithString:user.avatar_url] placeholderImage:temp completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
                self.iconView.image = [UIImage imageWithCircleByBorder:1 color:[UIColor grayColor] image:image];
    }];
//    [self.iconView setImageWithURL:[NSURL URLWithString:user.avatar_url] placeholderImage:temp completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType) {
//        self.iconView.image = [UIImage imageWithCircleByBorder:1 color:[UIColor grayColor] image:image];
//    }];
}

@end















