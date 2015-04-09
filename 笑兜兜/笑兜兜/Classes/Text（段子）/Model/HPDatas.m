//
//  HPDatas.m
//  笑兜兜
//
//  Created by shaun on 14-7-31.
//  Copyright (c) 2014年 cn.happy. All rights reserved.
//

#import "HPDatas.h"
#import "HPDataDetail.h"
#import "MJExtension.h"

@implementation HPDatas

-(NSDictionary *)objectClassInArray
{
    return @{@"data": [HPDataDetail class]};
}

@end
