//
//  HPSeasonStatus.h
//  笑兜兜
//
//  Created by dyf on 14-8-8.
//  Copyright (c) 2014年 cn.happy. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *
 {
 "id": "95",?
 "title": "\u73b0\u5b9e\u4e2d\u7684\u201c\u8499\u5947\u5947\u201d\uff01\uff01\u4ece\u4ed6\u4e00\u51fa\u751f\u5c31\u5907\u53d7\u5173\u6ce8\uff0c\u963f\u572d\u7f57\u4e4b\u5b50\uff0c\u9a6c\u62c9\u591a\u7eb3\u4e4b\u5b59\uff01\u963f\u594e\u7f57\u548c\u513f\u5b50\u73a9\u7403\uff0c\u5c0f\u8499\u5947\u5947\u7684\u5c04\u95e8\u52b2\u9053\u5341\u8db3\uff01\u7edd\u5bf9\u5929\u624d\uff01\u4ee5\u540e\u8981\u8d85\u4ed6\u7238\u548c\u8001\u7237\u4e86\uff01",
 "pic": "http:\/\/g1.ykimg.com\/0100641F464D1A5700886B006185BDFA9E1ED0-A012-17CB-089E-45A3E13BA89F",
 "url": "http:\/\/v.youku.com\/v_show\/id_XMjMyOTk3NDAw.html",
 "mp4_url": "http:\/\/v.youku.com\/player\/getM3U8\/vid\/XMjMyOTk3NDAw\/type\/flv\/v.m3u8",
 "url_type": "",
 "cTime": "2012-04-04 20:26",
 "favo_num": "2085",
 "news_id": "95"
 }
 */
@interface HPSeasonStatus : NSObject
/**
*  微博标志,一般都是最大的表示是最后更新的一个
*/
@property (nonatomic, copy) NSString *id;
/**
 *  文字内容,说明视频内容的
 */
@property (nonatomic, copy) NSString *title;
/**
 *  图片链接
 */
@property (nonatomic, copy) NSString *pic;
/**
 *  视频来源链接
 */
@property (nonatomic, copy) NSString *url;
/**
 *  视频链接
 */
@property (nonatomic, copy) NSString *mp4_url;
/**
 *  url 类型.一般都是空
 */
@property (nonatomic, copy) NSString *url_type;
/**
 *  更新时间
 */
@property (nonatomic, copy) NSString *cTime;
/**
 *  收藏数量人气度
 */
@property (nonatomic, copy) NSString *favo_num;
/**
 *  新闻指标数(越大越新越放前边)
 */
@property (nonatomic, copy) NSString *news_id;

@end
