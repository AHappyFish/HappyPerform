//
//  XBWaterFlowCell.m
//  XB瀑布流
//
//  Created by shaun on 14-7-28.
//  Copyright (c) 2014年 shaun. All rights reserved.
//

#import "XBWaterFlowCell.h"
#import "HPPictures.h"
#import "XBWaterFlowView.h"
#import "UIImageView+WebCache.h"


@interface XBWaterFlowCell ()

@property (nonatomic, weak) UIImageView *imageView;

@end

@implementation XBWaterFlowCell

+(instancetype)waterFlowCellWith:(XBWaterFlowView *)waterFlowView
{
    static NSString *ID = @"cell";
    XBWaterFlowCell *cell = [waterFlowView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[XBWaterFlowCell alloc] init];
    }
    return cell;
}


-(id)init
{
    if (self = [super init]) {
        self.backgroundColor = [UIColor clearColor];
        UIImageView *imageView = [[UIImageView alloc] init];
        [self addSubview:imageView];
        
        self.imageView = imageView;
    }
    return self;
}


-(void)setPictures:(HPPictures *)pictures
{
    _pictures = pictures;
    NSArray *thumbPics = pictures.thumbnail_url_list;
    NSDictionary *urlDict = [thumbPics firstObject];
    NSString *urlString = urlDict[@"url"];
    self.imageView.frame = self.bounds;
    self.imageView.contentMode = UIViewContentModeScaleToFill;
    [self clipsToBounds];
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:urlString] placeholderImage:nil];
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    self.imageView.frame = self.bounds;
}

@end
