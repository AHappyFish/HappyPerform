//
//  HPVoiceStatusRequestTool.m
//  笑兜兜
//
//  Created by shaun on 14-8-7.
//  Copyright (c) 2014年 cn.happy. All rights reserved.
//

#import "HPVoiceStatusRequestTool.h"
#import "XBHttpTool.h"
#import "HPVoiceAlbum.h"

@implementation HPVoiceStatusRequestTool

+(void)voiceStatusWithUrl:(NSString *)url successed:(void (^)(HPVoiceAlbum *))successed failure:(void (^)(NSError *))failure
{
    [XBHttpTool Get:url params:nil success:^(id repsonseObj) {
        HPVoiceAlbum *alm = [HPVoiceAlbum objectWithKeyValues:repsonseObj];
        if (successed) {
            successed(alm);
        }
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}

@end
