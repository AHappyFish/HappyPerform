//
//  HPEntertainmentParam.m
//  笑兜兜
//
//  Created by shaunon 14-8-4.
//  Copyright (c) 2014年 cn.happy. All rights reserved.
//

#import "HPCategoryParam.h"

@implementation HPCategoryParam

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.category = @"entertainment";
        self.device = @"iPhone";
        self.type = @"album";
    }
    return self;
}

@end
