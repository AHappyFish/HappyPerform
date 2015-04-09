//
//  HPDatas.h
//  笑兜兜
//
//  Created by shaun on 14-7-31.
//  Copyright (c) 2014年 cn.happy. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface HPDatas : NSObject

/** 是否有新段子 */
//@property (nonatomic, assign) BOOL has_more;
///** 最近更新时间 用来下拉加载最新数据 */
//@property (nonatomic, assign) NSInteger min_time;
///** 最晚的段子时间 用来上拉加载更多数据 */
//@property (nonatomic, assign) NSInteger max_time;
///** 新内容个数 */
//@property (nonatomic, copy) NSString *tip;
/** 数组：每个元素是数据的具体内容的模型 */
@property (nonatomic, strong) NSArray *data;

@end








































