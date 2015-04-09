//
//  HPStatusSectionTabView.m
//  笑兜兜
//
//  Created by shaun on 14-8-9.
//  Copyright (c) 2014年 cn.happy. All rights reserved.
//

#import "HPStatusSectionTabView.h"


@interface HPStatusSectionTabView ()

@property (nonatomic, strong) NSMutableArray *btns;

@property (nonatomic, strong) UIButton *selectedButton;

@end


@implementation HPStatusSectionTabView

-(NSMutableArray *)btns
{
    if (!_btns) {
        _btns = [NSMutableArray array];
    }
    return _btns;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // 247 238 228
        self.backgroundColor = HPColor(237, 237, 237);
        // 创建3按钮
        [self setUpButtonWithtitle:@"简介" tag:HPStatusSectionButtonTypeIntro];
        UIButton *listButton = [self setUpButtonWithtitle:@"列表" tag:HPStatusSectionButtonTypeList];
        
        [self setUpButtonWithtitle:@"专辑" tag:HPStatusSectionButtonTypeRelate];
        // 默认选中的按钮
        [self btnClick:listButton];

    }
    return self;
}


// 添加按钮的方法
-(UIButton *)setUpButtonWithtitle:(NSString *)titlename tag:(HPStatusSectionButtonType)buttonType
{
    UIButton *btn = [[UIButton alloc] init];
    btn.tag = buttonType;
    [btn setTitle:titlename forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:13];
    [btn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
    UIImage *bgImage = [UIImage imageNamed:@"ad_download_h"];
    btn.contentEdgeInsets = UIEdgeInsetsMake(5, 5, 5, 5);
    [btn setBackgroundImage:bgImage forState:UIControlStateSelected];
    btn.adjustsImageWhenHighlighted = NO;
    [self addSubview:btn];
    [self.btns addObject:btn];
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    return btn;
}


// 按钮点击事件
-(void)btnClick:(UIButton *)btn
{
    self.selectedButton.selected = NO;
    btn.selected = YES;
    self.selectedButton = btn;
    
    // 通知代理
    if ([self.delegate respondsToSelector:@selector(statusSection:TabClick:)]) {
        [self.delegate statusSection:self TabClick:btn.tag];
    }
}

// 布局子控件
-(void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat boderMargin = 10;
    CGFloat btnMargin = 30;
    CGFloat btnW = (self.width - 2 * boderMargin - (self.btns.count - 1) * btnMargin)/self.btns.count;
    CGFloat btnH = 20;
    CGFloat btnY = (self.height - btnH) * 0.5;
    
    for (int i = 0; i < self.btns.count; i++) {
        UIButton *tempButton = self.btns[i];
        tempButton.x = boderMargin + i * (btnW + btnMargin);
        tempButton.y = btnY;
        tempButton.width = btnW;
        tempButton.height = btnH;
    }
    
}


@end
