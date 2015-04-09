//
//  HPManagerMusicTool.m
//  笑兜兜
//
//  Created by shaun on 14-8-13.
//  Copyright (c) 2014年 cn.happy. All rights reserved.
//

#import "HPManagerMusicTool.h"
#import "HPVoiceTrackList.h"

@interface HPManagerMusicTool()
@property (nonatomic, assign) int currentIndex;
@end

@implementation HPManagerMusicTool

HMSingletonM(MusicTool);

-(void)setPlayingMusicId:(NSString *)playingMusicId
{
    if ([[self playingMusicId] isEqualToString:playingMusicId]) return;
    _playingMusicId = playingMusicId;
}


-(NSInteger)currentIndex
{
    if (!_currentIndex) {
        for (HPVoiceTrackList *track in self.musicLists) {
            if ([track.trackId isEqualToString:self.playingMusicId]) {
                _currentIndex = [self.musicLists indexOfObject:track];
            }
        }
    }
    return _currentIndex;
}

// 下一首
-(NSString *)nextMusicId
{
    if ( self.currentIndex == self.musicLists.count - 1){
        self.currentIndex = 0;
        HPVoiceTrackList *track = self.musicLists[self.currentIndex];
        self.playingMusicId = track.trackId;
    }else{
        self.currentIndex++;
        HPVoiceTrackList *track = self.musicLists[self.currentIndex];
        self.playingMusicId = track.trackId;
    }
    
    return self.playingMusicId;
}

// 上一首
-(NSString *)previousMusicId
{
    if ( self.currentIndex == 0 ){
        self.currentIndex = self.musicLists.count - 1;
        HPVoiceTrackList *track = self.musicLists[self.currentIndex];
        self.playingMusicId = track.trackId;
    }else{
        self.currentIndex--;
        HPVoiceTrackList *track = self.musicLists[self.currentIndex];
        self.playingMusicId = track.trackId;
    }
    
    return self.playingMusicId;
}

@end
