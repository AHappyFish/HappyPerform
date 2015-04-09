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
        //self.backgroundColor = [UIColor redColor];
        
        //头像
        UIImageView *iconView = [UIImageView new];
        [self addSubview:iconView];
        self.iconView = iconView;
        
        //昵称
        UILabel *name = [UILabel new];
//        name.backgroundColor = [UIColor redColor];
        name.font = HPGroupNameFont;
//        name.numberOfLines = 0;
        [self addSubview:name];
        self.nameLable = name;
        
        //正文
        UILabel *text = [UILabel new];
        text.numberOfLines = 0;
        text.font = [UIFont systemFontOfSize:14];
        [self addSubview:text];
        self.textLable = text;
    }
    return self;
}

- (void)setBodyFrame:(HPGroupsBodyFrame *)bodyFrame
{
    _bodyFrame = bodyFrame;
    self.frame = bodyFrame.frame;
    
    HPGroup *group = bodyFrame.group;
    HPUser *user = group.user;
    
    self.nameLable.text = user.name;
    self.nameLable.frame = bodyFrame.nameFrame;
    
    self.textLable.text = group.content;
    self.textLable.frame = bodyFrame.contentFrame;
    
    self.iconView.frame = bodyFrame.iconFrame;
    [self.iconView setImageWithURL:[NSURL URLWithString:@"http://tp4.sinaimg.cn/1879131067/50/5640581426/1"]];
    
}
@end















