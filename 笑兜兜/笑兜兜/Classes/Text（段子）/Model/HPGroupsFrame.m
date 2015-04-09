//
//  HPgroupsFrame.m
//  笑兜兜
//
//  Created by shaun on 14-8-1.
//  Copyright (c) 2014年 cn.happy. All rights reserved.
//

#import "HPGroupsFrame.h"
#import "HPgroupsToolbar.h"
#import "HPgroupsBodyFrame.h"
#import "HPGroup.h"

@implementation HPGroupsFrame
- (void)setGroup:(HPGroup *)group
{
    _group = group;
    
    //设置正文
    [self setupbodyFrame];
    
    // 2.计算底部工具条
    [self setupToolbarFrame];
    
    // 3.计算cell的高度
    self.cellHeight = CGRectGetMaxY(self.toolbarFrame);
}


- (void)setupbodyFrame
{
    HPGroupsBodyFrame *bodyFrame = [[HPGroupsBodyFrame alloc] init];
    bodyFrame.group = self.group;
    self.bodyFrame = bodyFrame;
}

/**
 *  计算底部工具条
 */
- (void)setupToolbarFrame
{
    CGFloat toolbarX = 0;
    CGFloat toolbarY = CGRectGetMaxY(self.bodyFrame.frame);;
    CGFloat toolbarW = 320;
    CGFloat toolbarH =35;
    self.toolbarFrame = CGRectMake(toolbarX, toolbarY, toolbarW, toolbarH);
}
@end
