//
//  HPSeasonStatusFrame.m
//  笑兜兜
//
//  Created by dyf on 14-8-8.
//  Copyright (c) 2014年 cn.happy. All rights reserved.
//

#import "HPSeasonStatusFrame.h"
#import "HPSeasonStatus.h"

#define HPMargin 10
#define HPToolbarH 44

@implementation HPSeasonStatusFrame

- (void)setSeasonStatus:(HPSeasonStatus *)seasonStatus
{
    _seasonStatus = seasonStatus;
    
    [self setupLabelFrame];
    
    [self setupBtnFrame];
    
    [self setupToolbarFrame];
    
    self.cellHight = CGRectGetMaxY(self.toolbarFrame);
}

- (void)setupLabelFrame
{
    CGFloat labelX = HPMargin;
    CGFloat labelY = HPMargin;
    
    CGSize maxSize = CGSizeMake(HPScreenW - 2 * labelX, MAXFLOAT);
    NSString *labelText = self.seasonStatus.title;
    NSDictionary *attribute = @{NSFontAttributeName: CsyJokeTextFont};
    CGSize labelSize = [labelText boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attribute context:nil].size;
    
    CGFloat labelW = labelSize.width;
    CGFloat labelH = labelSize.height;
    
    self.labelFrame = CGRectMake(labelX, labelY, labelW, labelH);
}

- (void)setupBtnFrame
{
    CGFloat btnW = HPScreenW * 0.4;
    CGFloat btnH = btnW * 0.75;
    CGFloat btnY = CGRectGetMaxY(self.labelFrame) + HPMargin * 0.5;
    CGFloat btnX = HPScreenW * 0.5 - btnW * 0.5;
    
    self.btnFrame = CGRectMake(btnX, btnY, btnW, btnH);
}

- (void)setupToolbarFrame
{
    CGFloat toolbarX = 0;
    CGFloat toolbarY = CGRectGetMaxY(self.btnFrame) + HPMargin * 0.5;
    CGFloat toolbarW = HPScreenW;
    CGFloat toolbarH = HPToolbarH;
    
    self.toolbarFrame = CGRectMake(toolbarX, toolbarY, toolbarW, toolbarH);
}

@end
