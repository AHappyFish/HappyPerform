//
//  HPVoiceAlbum.h
//  笑兜兜
//
//  Created by shaun on 14-8-7.
//  Copyright (c) 2014年 cn.happy. All rights reserved.
//  "msg": "0", "ret": 0,

#import <Foundation/Foundation.h>
@class HPVoiceAlbumItem, HPVoiceTracks;

@interface HPVoiceAlbum : NSObject

@property (nonatomic, strong) HPVoiceAlbumItem *album;

@property (nonatomic, strong) HPVoiceTracks *tracks;

@property (nonatomic, copy) NSString *msg;

@property (nonatomic, copy) NSNumber *ret;

@end
