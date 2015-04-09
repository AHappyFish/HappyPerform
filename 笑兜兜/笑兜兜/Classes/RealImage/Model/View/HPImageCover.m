//
//  HPImageCover.m
//  笑兜兜
//
//  Created by shaun on 14-9-9.
//  Copyright (c) 2014年 cn.happy. All rights reserved.
//

#import "HPImageCover.h"
#import "HPPictures.h"
#import "UIImageView+WebCache.h"

#define application [UIApplication sharedApplication]

@interface HPImageCover ()

@property (nonatomic, weak) UIImageView *imageView;

@property (nonatomic, assign) CGRect originFrame;

@end

@implementation HPImageCover

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor blackColor];
        // 添加imageView
        UIImageView *imageView = [[UIImageView alloc] init];
        [self addSubview:imageView];
        self.imageView = imageView;
        
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapView)];
        [self addGestureRecognizer:tapGesture];
    }
    return self;
}


-(void)showWithCellFrame:(CGRect)frame pictures:(HPPictures *)pic
{
    [application setStatusBarHidden:YES withAnimation:UIStatusBarAnimationFade];
    self.originFrame = frame;
    self.frame = frame;
    self.alpha = 0.0;
    UIWindow *window = application.keyWindow;
    [window addSubview:self];
    NSArray *arr = pic.large_url_list;
    NSDictionary *largeUrlDict = [arr firstObject];
    NSString *largeUrl = largeUrlDict[@"url"];
    [UIView animateWithDuration:0.5 animations:^{
        self.frame = window.bounds;
        self.alpha = 1.0;
    }completion:^(BOOL finished) {
        
        double scale = ([pic.large_height doubleValue] / [pic.large_width doubleValue]) ;
        CGFloat w = 300;
        CGFloat h = w * scale;
        self.contentSize = CGSizeMake(window.width, h + 20);
        CGFloat imageX = 10;
        CGFloat imageY = 10;
        self.imageView.frame = CGRectMake(imageX, imageY, w, h);
        [self.imageView sd_setImageWithURL:[NSURL URLWithString:largeUrl] placeholderImage:nil];
    }];
    
    
}


-(void)tapView
{
    [application setStatusBarHidden:NO withAnimation:UIStatusBarAnimationFade];
    [UIView animateWithDuration:0.5 animations:^{
        self.frame = self.originFrame;
        self.alpha = 0.0;
    }completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

@end
