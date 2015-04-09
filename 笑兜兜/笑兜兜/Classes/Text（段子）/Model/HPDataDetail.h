//
//  HPDataTwo.h
//  笑兜兜
//
//  Created by shaun on 14-7-31.
//  Copyright (c) 2014年 cn.happy. All rights reserved.
//

#import <Foundation/Foundation.h>
@class HPGroup;

@interface HPDataDetail : NSObject

///** 时间 */
//@property (nonatomic, assign) NSInteger online_time;
///** display_time */
//@property (nonatomic, assign) NSInteger display_time;
///** 每一组数据 模型 */
@property (nonatomic, strong) HPGroup *group;
///** 类型 */
//@property (nonatomic, assign) NSInteger type;
//
///**  */
//@property (nonatomic, strong) NSArray *comments;
@end
