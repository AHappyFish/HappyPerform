//
//  HPCategoryList.h
//  笑兜兜
//
//  Created by shaun on 14-8-6.
//  Copyright (c) 2014年 cn.happy. All rights reserved.
//
/**"category_id":4,
 "tname":"笑话段子",
 "cover_path":"http://fdfs.xmcdn.com/group3/M03/93/4A/wKgDsVKoOHmhx---AAAkrnW96JM523.jpg"*/

#import <Foundation/Foundation.h>

@interface HPCategoryList : NSObject

/** category_id 设备id = 4 表示iPhone */
@property (nonatomic, copy) NSNumber *category_id;

/** 标题 */
@property (nonatomic, copy) NSString *tname;

/** 图片地址 */
@property (nonatomic, copy) NSString *cover_path;

@end
