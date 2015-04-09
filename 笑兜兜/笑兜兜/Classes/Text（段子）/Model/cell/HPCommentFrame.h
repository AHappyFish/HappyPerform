//
//  HPCommentFrame.h
//  笑兜兜
//
//  Created by shaun on 14-8-15.
//  Copyright (c) 2014年 cn.happy. All rights reserved.
//

#import <Foundation/Foundation.h>
@class HPComment;
@interface HPCommentFrame : NSObject
/** 昵称 */
@property (nonatomic, assign) CGRect nameFrame;
/** 正文 */
@property (nonatomic, assign) CGRect textFrame;
/** 头像 */
@property (nonatomic, assign) CGRect iconFrame;

/** 自己的frame */
@property (nonatomic, assign) CGRect frame;

/** 数据 */
@property (nonatomic, strong) HPComment *comment;

@end
