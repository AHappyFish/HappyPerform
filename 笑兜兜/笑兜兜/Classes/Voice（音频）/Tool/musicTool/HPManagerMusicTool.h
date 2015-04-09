//
//  HPManagerMusicTool.h
//  笑兜兜
//
//  Created by shaun on 14-8-13.
//  Copyright (c) 2014年 cn.happy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HMSingleton.h"

@interface HPManagerMusicTool : NSObject

HMSingletonH(MusicTool);
// 所有的音频数据
@property (nonatomic, strong) NSArray *musicLists;
@property (nonatomic, copy) NSString *playingMusicId;

// 下一首
-(NSString *)nextMusicId;

// 上一首
-(NSString *)previousMusicId;

@end
