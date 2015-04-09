//
//  HPPlayingMisicTool.m
//  笑兜兜
//
//  Created by shaun on 14-8-11.
//  Copyright (c) 2014年 cn.happy. All rights reserved.
//

#import "HPPlayingMusicTool.h"
#import "XBHttpTool.h"
#import "HPPlayingVoiceResults.h"
#import "HPPlayingVoiceParam.h"
#import "DOUAudioStreamer.h"
#import "HPMediaFile.h"

@interface HPPlayingMusicTool ()

@end

@implementation HPPlayingMusicTool

//HMSingletonM(playingMusic);

+(void)playintMusicWith:(HPPlayingVoiceParam *)param successed:(void (^)(HPPlayingVoiceResults *))successed failure:(void (^)(NSError *))failure
{
    NSDictionary *paramDict = param.keyValues;
    [XBHttpTool Get:@"http://mobile.ximalaya.com/mobile/track/detail" params:paramDict success:^(id repsonseObj) {
        HPPlayingVoiceResults *result = [HPPlayingVoiceResults objectWithKeyValues:repsonseObj];
        if (successed) {
            successed(result);
        }
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
    
}

// 播放
static DOUAudioStreamer *_streamer;
static NSMutableDictionary *_streamerDict;

+(DOUAudioStreamer *)_stream
{
    if (!_streamer) {
        _streamer = [[DOUAudioStreamer alloc] init];
    }
    return _streamer;
}

+(NSMutableDictionary *)streamerDict
{
    if (!_streamerDict) {
        _streamerDict = [NSMutableDictionary dictionary];
    }
    return _streamerDict;
}


+(DOUAudioStreamer *)createStreamByPlayUrl:(NSString *)playUrl
{
    if (!playUrl) return nil;
    
    // 流媒体播放工具
    HPMediaFile *urlFile = [[HPMediaFile alloc] init];
    urlFile.audioFileURL = [NSURL URLWithString:playUrl];
    
    if (!urlFile) return nil;
    
    _streamer = [self streamerDict][playUrl];
    if (!_streamer) {
        _streamer = [DOUAudioStreamer streamerWithAudioFile:urlFile];
        [self streamerDict][playUrl] = _streamer;
    }
    
    return _streamer;
    
}
+ (void)playMusic:(NSString *)playUrl
{
    DOUAudioStreamer *stream = [self streamerDict][playUrl];
    if (stream) {
        [stream play];
    }
}

// 暂停
+(void)pauseMusic:(NSString *)playUrl
{
    DOUAudioStreamer *stream = [self streamerDict][playUrl];
    if (stream) {
        [stream pause];
    }
}

// 停止
+(void)stopMusic:(NSString *)playUrl
{
    DOUAudioStreamer *stream = [self streamerDict][playUrl];
    if (stream) {
        [stream stop];
    }
    
    // 将播放器从字典中移除
    [[self streamerDict] removeObjectForKey:playUrl];
}

@end
