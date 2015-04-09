//
//  HPPlayingVoiceResults.h
//  笑兜兜
//
//  Created by shaun on 14-8-11.
//  Copyright (c) 2014年 cn.happy. All rights reserved.
//
/**
 "albumId": 232357,
 "albumImage": "",
 "albumTitle": "今晚80后脱口秀 2014",
 "categoryId": 4,
 "categoryName": "综艺娱乐",
 "comments": 133,
 "coverLarge": "http://fdfs.xmcdn.com/group4/M00/19/5F/wKgDs1MsAqzCgO9DAAUQ_GUt96k293_mobile_large.jpg",
 "coverSmall": "http://fdfs.xmcdn.com/group4/M00/19/5F/wKgDs1MsAqzCgO9DAAUQ_GUt96k293_mobile_small.jpg",
 "createdAt": 1407116400000,
 "downloadSize": 9770869,
 "downloadUrl": "http://fdfs.xmcdn.com/group4/M05/A0/5A/wKgDs1Pe5HDAJJM5AJUXdVJdr5c399.aac",
 "duration": 2353.97,
 "images": [
 "http://fdfs.xmcdn.com/group4/M00/19/5F/wKgDs1MsAqzCgO9DAAUQ_GUt96k293.jpg"
 ],
 "intro": "",
 "isLike": false,
 "isPublic": true,
 "isRelay": false,
 "likes": 858,
 "lyric": "",
 "msg": "0",
 "playtimes": 109536,
 "playUrl32": "http://fdfs.xmcdn.com/group4/M04/A0/5A/wKgDs1Pe5CXCTmbQAI-udzmv2lQ559.mp3",
 "playUrl64": "http://fdfs.xmcdn.com/group4/M05/A0/5A/wKgDs1Pe5FGCKKgyAR9cGBepC8k888.mp3",
 "processState": 2,
 "ret": 0,
 "richIntro": "",
 "shares": 28,
 "status": 1,
 "tags": "脱口秀",
 "title": "140803 宋冬野澄清张曼玉走音 自健YY周杰伦跳小苹果",
 */

#import <Foundation/Foundation.h>

@interface HPPlayingVoiceResults : NSObject

/** 专辑标题 */
@property (nonatomic, copy) NSString *albumTitle;

/** 大图 */
@property (nonatomic, copy) NSString *coverLarge;

/** 小图 */
@property (nonatomic, copy) NSString *coverSmall;

/** 音频播放地址 */
@property (nonatomic, copy) NSString *playUrl32;

/** 音频播放地址 */
@property (nonatomic, copy) NSString *playUrl64;

/** 总时长 */
@property (nonatomic, copy) NSString *duration;

/** 播放次数 */
@property (nonatomic, copy) NSString *playtimes;

/**  */
@property (nonatomic, copy) NSString *title;

/** 标签 */
@property (nonatomic, copy) NSString *tags;



@end
