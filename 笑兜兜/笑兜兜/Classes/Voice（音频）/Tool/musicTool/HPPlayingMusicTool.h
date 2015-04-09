//
//  HPPlayingMisicTool.h
//  笑兜兜
//
//  Created by shaun on 14-8-11.
//  Copyright (c) 2014年 cn.happy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HMSingleton.h"
#import <AVFoundation/AVFoundation.h>
#import "HPMediaFile.h"

@class HPPlayingVoiceParam, HPPlayingVoiceResults;

@interface HPPlayingMusicTool : NSObject

// 设计为单例
HMSingletonH(playingMusic);

+(void)playintMusicWith:(HPPlayingVoiceParam *)param successed:(void(^)(HPPlayingVoiceResults *result))successed failure:(void(^)(NSError *error))failure;


/**
 *  播放音乐
 *
 *  @param musicUrl 音乐的文件url
 */
+ (DOUAudioStreamer *)createStreamByPlayUrl:(NSString *)playUrl;

/**
 *  暂停音乐
 *
 *  @param musicUrl 音乐的文件url
 */
+ (void)playMusic:(NSString *)playUrl;



+ (void)pauseMusic:(NSString *)playUrl;

/**
 *  停止音乐
 *
 *  @param musicUrl 音乐的文件url
 */
+ (void)stopMusic:(NSString *)playUrl;

@end
