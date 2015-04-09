//
//  HPPictures.h
//  笑兜兜
//
//  Created by shaun on 14-9-7.
//  Copyright (c) 2014年 cn.happy. All rights reserved.
//

#import <Foundation/Foundation.h>
/**
 *  
 "behot_time": 1410024977,
 "bury_count": 139,
 "comment_count": 333,
 "description": "几个超市蔬果开发脑洞的小漫画",
 "digg_count": 527,
 "format": "JPEG",
 "group_id": 3517333061,
 "is_gif": false,
 "is_shorten": true,
 "large_height": 2535,
 "large_url": "http://p2.pstatp.com/large/1282/5962805670",
 "large_url_list": [
 {
 "url": "http://p2.pstatp.com/large/1282/5962805670"
 },
 {
 "url": "http://p0.pstatp.com/large/1282/5962805670"
 },
 {
 "url": "http://p.pstatp.com/large/1282/5962805670"
 }
 ],
 "large_width": 440,
 "level": 0,
 "middle_height": 413,
 "middle_url": "http://p2.pstatp.com/medium/1282/5962805670",
 "middle_url_list": [
 {
 "url": "http://p2.pstatp.com/medium/1282/5962805670"
 },
 {
 "url": "http://p0.pstatp.com/medium/1282/5962805670"
 },
 {
 "url": "http://p.pstatp.com/medium/1282/5962805670"
 }
 ],
 "middle_width": 202,
 "repin_count": 27,
 "share_url": "http://web.toutiao.com/group/3517333061/?iid=0",
 "tag": "comic",
 "tag_id": 3517333065,
 "thumbnail_url": "http://p2.pstatp.com/thumb/1282/5962805670",
 "thumbnail_url_list": [
 {
 "url": "http://p2.pstatp.com/thumb/1282/5962805670"
 },
 {
 "url": "http://p0.pstatp.com/thumb/1282/5962805670"
 },
 {
 "url": "http://p.pstatp.com/thumb/1282/5962805670"
 }
 ],
 "user_bury": 0,
 "user_digg": 0,
 "user_repin": 0,
 "user_repin_time": 0
 
 http://i.snssdk.com/2/image/recent/?tag=comic&count=40&device_platform=iphone&channel=App%20Store&app_name=comic_gallery&device_type=iPhone%205&os_version=7.1&version_code=1.3&uuid=FFFFFFFF839763ADC43E497DA3632193FEC1C600&max_behot_time=1410024977
 
 http://i.snssdk.com/2/image/recent/?tag=comic&count=40&max_behot_time=1405305642&device_platform=iphone&channel=App%20Store&app_name=comic_gallery&device_type=iPhone%205&os_version=7.1&version_code=1.3&uuid=FFFFFFFF839763ADC43E497DA3632193FEC1C600
 */

@interface HPPictures : NSObject

@property (nonatomic, copy) NSString *description;
@property (nonatomic, copy) NSString *format;
//@property (nonatomic, assign) BOOL *is_gif;
@property (nonatomic, copy) NSNumber *middle_height;
@property (nonatomic, copy) NSNumber *middle_width;
@property (nonatomic, copy) NSNumber *large_height;
@property (nonatomic, copy) NSNumber *large_width;
@property (nonatomic, copy) NSNumber *group_id;
@property (nonatomic, strong) NSArray *thumbnail_url_list;
@property (nonatomic, strong) NSArray *large_url_list;
@property (nonatomic, copy) NSNumber *behot_time;
@property (nonatomic, copy) NSNumber *tag_id;

@end
