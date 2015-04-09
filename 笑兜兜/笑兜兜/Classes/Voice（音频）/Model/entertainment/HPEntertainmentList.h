//
//  HPEntertainmentSingleResulst.h
//  笑兜兜
//
//  Created by shaun on 14-8-5.
//  Copyright (c) 2014年 cn.happy. All rights reserved.
//  单个种类的请求结果

#import <Foundation/Foundation.h>

/** "albumCoverUrl290": "http://fdfs.xmcdn.com/group3/M04/30/DE/wKgDslIywmXAfdAUAAAgLuqbIeI721_mobile_large.jpg",
 "id": 191552,
 "lastUptrackAt": 1392757500000,
 "playsCounts": 4364085,
 "serialState": 0,
 "title": "┣我讲笑话┫——DJ未来" */

@interface HPEntertainmentList : NSObject

/** 图片地址 */
@property (nonatomic, copy) NSString *albumCoverUrl290;

/** id */
@property (nonatomic, copy) NSString *id;

/**  */
@property (nonatomic, copy) NSString *lastUptrackAt;

/** 播放次数 */
@property (nonatomic, copy) NSString *playsCounts;

/**  */
@property (nonatomic, copy) NSNumber *serialState;

/** 标题 */
@property (nonatomic, copy) NSString *title;

@end
