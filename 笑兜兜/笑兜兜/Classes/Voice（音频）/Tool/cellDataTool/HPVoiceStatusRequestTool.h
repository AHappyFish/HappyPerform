//
//  HPVoiceStatusRequestTool.h
//  笑兜兜
//
//  Created by shaun on 14-8-7.
//  Copyright (c) 2014年 cn.happy. All rights reserved.
//

#import <Foundation/Foundation.h>
@class HPVoiceAlbum;
@interface HPVoiceStatusRequestTool : NSObject

+(void)voiceStatusWithUrl:(NSString *)url successed:(void(^)(HPVoiceAlbum *album))successed failure:(void(^)(NSError *error))failure;

@end
