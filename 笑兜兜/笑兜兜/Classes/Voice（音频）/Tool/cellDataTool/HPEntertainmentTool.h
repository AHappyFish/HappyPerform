//
//  HPEntertainmentTool.h
//  笑兜兜
//
//  Created by shaun on 14-8-5.
//  Copyright (c) 2014年 cn.happy. All rights reserved.
//

#import <Foundation/Foundation.h>
@class HPEntertainmentParam, HPEntertainmentResult, XBHttpTool;


@interface HPEntertainmentTool : NSObject

+(void)entertainmentWith:(HPEntertainmentParam *)param successed:(void(^)(HPEntertainmentResult *result))successed failure:(void(^)(NSError *error))failure;

@end
