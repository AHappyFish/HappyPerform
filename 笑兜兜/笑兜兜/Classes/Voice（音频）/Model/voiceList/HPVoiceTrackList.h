//
//  HPVoiceTrackList.h
//  笑兜兜
//
//  Created by shaun on 14-8-7.
//  Copyright (c) 2014年 cn.happy. All rights reserved.
//
/*
 "albumId": 232357,
 "albumTitle": "今晚80后脱口秀 2014", ：导航栏标题
 "comments": 133, ：评论数
 "coverLarge": "http://fdfs.xmcdn.com/group4/M00/19/5F/wKgDs1MsAqzCgO9DAAUQ_GUt96k293_mobile_large.jpg",
 "coverSmall": "http://fdfs.xmcdn.com/group4/M00/19/5F/wKgDs1MsAqzCgO9DAAUQ_GUt96k293_mobile_small.jpg",
 "createdAt": 1407116400000, ：创建时间 格式..几天前
 "downloadSize": 9770869, ：下载大小
 "downloadUrl": "http://fdfs.xmcdn.com/group4/M05/A0/5A/wKgDs1Pe5HDAJJM5AJUXdVJdr5c399.aac",
 "duration": 2353.97,：时长
 "isPublic": true,
 "likes": 854, ：点赞数
 "nickname": "今晚80后脱口秀",：来源 BY。。。
 "opType": 1, ：类型
 "orderNum": 140803, // 排序号码
 "playtimes": 109117, ：播放次数
 "playUrl32": "http://fdfs.xmcdn.com/group4/M04/A0/5A/wKgDs1Pe5CXCTmbQAI-udzmv2lQ559.mp3",
 "playUrl64": "http://fdfs.xmcdn.com/group4/M05/A0/5A/wKgDs1Pe5FGCKKgyAR9cGBepC8k888.mp3",
 "processState": 2,
 "shares": 0,：分享
 "smallLogo": "http://fdfs.xmcdn.com/group3/M06/C8/7A/wKgDsVLc2DnDkkJ3AAMlFmWXk0U597_mobile_small.jpg",
 "status": 1,
 "title": "140803 宋冬野澄清张曼玉走音 自健YY周杰伦跳小苹果", 标题
 "trackId": 3301481,
 "uid": 1000179,
 "userSource": 2
 */

#import <Foundation/Foundation.h>

@interface HPVoiceTrackList : NSObject

/** id:"albumId" */
@property (nonatomic, copy) NSString *albumId;

/** 标题 albumTitle*/
@property (nonatomic, copy) NSString *albumTitle;

/** 评论数 */
@property (nonatomic, copy) NSNumber *comments;

/** 文件下载大小 */
@property (nonatomic, copy) NSString *downloadSize;

/** 封面图片 */
@property (nonatomic, copy) NSString *coverLarge;

/** 小图片 */
@property (nonatomic, copy) NSString *coverSmall;

/** 创建时间 */
@property (nonatomic, copy) NSString *createdAt;

/** 播放地址32 */
@property (nonatomic, copy) NSString *playUrl32;

/** 播放地址32 */
@property (nonatomic, copy) NSString *playUrl64;

/** 点赞数 */
@property (nonatomic, copy) NSNumber *likes;

/** 时长 */
@property (nonatomic, copy) NSString *duration;

/** 小logo图片地址 */
@property (nonatomic, copy) NSString *smallLogo;

/** cell标题 */
@property (nonatomic, copy) NSString *title;

/** trackId */
@property (nonatomic, copy) NSString *trackId;

/** 分享数 */
@property (nonatomic, copy) NSNumber *shares;

@end
