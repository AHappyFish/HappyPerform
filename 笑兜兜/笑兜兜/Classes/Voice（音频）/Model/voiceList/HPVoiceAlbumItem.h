//
//  HPVoiceAlbumItem.h
//  笑兜兜
//
//  Created by shaun on 14-8-7.
//  Copyright (c) 2014年 cn.happy. All rights reserved.
//

/*
 "albumId": 232357,
 "avatarPath": "http://fdfs.xmcdn.com/group3/M06/C8/7A/wKgDsVLc2DnDkkJ3AAMlFmWXk0U597_mobile_small.jpg",
 "categoryId": 4,
 "categoryName": "综艺娱乐",
 "coverLarge": "http://fdfs.xmcdn.com/group4/M01/19/5A/wKgDtFMsAq3COyRPAAUQ_GUt96k211_mobile_meduim.jpg",
 "coverOrigin": "http://fdfs.xmcdn.com/group4/M01/19/5A/wKgDtFMsAq3COyRPAAUQ_GUt96k211.jpg",
 "coverSmall": "http://fdfs.xmcdn.com/group4/M01/19/5A/wKgDtFMsAq3COyRPAAUQ_GUt96k211_mobile_small.jpg",
 "coverWebLarge": "http://fdfs.xmcdn.com/group4/M01/19/5A/wKgDtFMsAq3COyRPAAUQ_GUt96k211_web_large.jpg",
 "createdAt": 1388972100000,
 "hasNew": false,
 "intro": "《今晚80后脱口秀》是东方卫视全新打造的高端文化脱口秀，也是中国唯一一档欧美风格脱口秀节目，于2012年5月13日开播，80后新锐相声演员王自健倾情加盟，每期通过脱口秀的形式，展现年轻人对社会热点、文化事件、时尚潮流的态度和思想，幽默风趣却又不失智慧与锐度。",
 "introRich": "《今晚80后脱口秀》是东方卫视全新打造的高端文化脱口秀，也是中国唯一一档欧美风格脱口秀节目，于2012年5月13日开播，80后新锐相声演员王自健倾情加盟，每期通过脱口秀的形式，展现年轻人对社会热点、文化事件、时尚潮流的态度和思想，幽默风趣却又不失智慧与锐度。",
 "isFavorite": false,
 "isVerified": true,
 "lastUptrackAt": 1407116400000,
 "nickname": "今晚80后脱口秀",
 "playTimes": 14293140,
 "serializeStatus": 0,
 "shares": 0,
 "status": 1,
 "tags": "脱口秀",
 "title": "今晚80后脱口秀 2014",
 "tracks": 28,
 "uid": 1000179,
 "updatedAt": 1407116400000
 */

#import <Foundation/Foundation.h>

@interface HPVoiceAlbumItem : NSObject

/** id:"albumId" */
@property (nonatomic, copy) NSString *albumId;

@property (nonatomic, copy) NSNumber *categoryId;

@property (nonatomic, copy) NSString *categoryName;

@property (nonatomic, copy) NSString *coverLarge;

@property (nonatomic, copy) NSString *coverOrigin;

@property (nonatomic, copy) NSString *coverSmall;

@property (nonatomic, copy) NSString *coverWebLarge;

@property (nonatomic, copy) NSString *avatarPath;

@property (nonatomic, assign) BOOL hasNew;

@property (nonatomic, copy) NSString *intro;

@property (nonatomic, copy) NSString *introRich;

@property (nonatomic, copy) NSString *lastUptrackAt;

@property (nonatomic, copy) NSString *nickname;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSNumber *shares;

@property (nonatomic, copy) NSString *updatedAt;

@property (nonatomic, copy) NSString *tracks;

@property (nonatomic, copy) NSString *tags;

@property (nonatomic, copy) NSString *playTimes;

@end
