//
//  HPEntertainmentTool.m
//  笑兜兜
//
//  Created by shaun on 14-8-5.
//  Copyright (c) 2014年 cn.happy. All rights reserved.
//

#import "HPEntertainmentTool.h"
#import "XBHttpTool.h"
#import "HPEntertainmentParam.h"
#import "HPEntertainmentResult.h"

@implementation HPEntertainmentTool

+(void)entertainmentWith:(HPEntertainmentParam *)param successed:(void (^)(HPEntertainmentResult *))successed failure:(void (^)(NSError *))failure
{
    
    NSDictionary *paramDict = param.keyValues;
    [XBHttpTool Get:@"http://mobile.ximalaya.com/m/explore_album_list" params:paramDict success:^(id repsonseObj) {
        HPEntertainmentResult *result = [HPEntertainmentResult objectWithKeyValues:repsonseObj];
        if (successed) {
            successed(result);
        }
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
    
}

@end
