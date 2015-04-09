//
//  HPgroupsFrame.h
//  笑兜兜
//
//  Created by shaun on 14-8-1.
//  Copyright (c) 2014年 cn.happy. All rights reserved.
//

#import <Foundation/Foundation.h>
@class HPGroup,HPGroupsBodyFrame;

@interface HPGroupsFrame : NSObject
/** 子控件的frame数据 */
@property (nonatomic, assign) CGRect toolbarFrame;
@property (nonatomic, strong) HPGroupsBodyFrame *bodyFrame;

/** cell的高度 */
@property (nonatomic, assign) CGFloat cellHeight;

/** 数据 */
@property (nonatomic, strong) HPGroup *group;

@end
