//
//  HPVoiceTracks.m
//  笑兜兜
//
//  Created by shaun on 14-8-7.
//  Copyright (c) 2014年 cn.happy. All rights reserved.
//

#import "HPVoiceTracks.h"
#import "HPVoiceTrackList.h"
@implementation HPVoiceTracks

-(NSDictionary *)objectClassInArray
{
    return @{@"list" : [HPVoiceTrackList class]};
}

@end
