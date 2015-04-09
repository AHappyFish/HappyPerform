//
//  HPEntertainmentSingleParam.m
//  笑兜兜
//
//  Created by shaun on 14-8-5.
//  Copyright (c) 2014年 cn.happy. All rights reserved.
//  category_name=entertainment&condition=hot&device=iPhone&page=1&per_page=20&status=0&tag_name=冷笑话

#import "HPEntertainmentParam.h"

@implementation HPEntertainmentParam

- (instancetype)init
{
    self = [super init];
    if (self) {
        // 默认的请求参数封装
        self.category_name = @"entertainment";
        self.device = @"iPhone";
        self.page = @(1);
        self.per_page = @(20);
        self.condition = @"hot";
        self.status = @(0);
        self.tag_name = @"";
    }
    return self;
}

@end
