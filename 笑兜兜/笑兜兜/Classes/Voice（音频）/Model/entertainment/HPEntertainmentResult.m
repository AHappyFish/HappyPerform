//
//  HPEntertainmentResult.m
//  笑兜兜
//
//  Created by shaun on 14-8-5.
//  Copyright (c) 2014年 cn.happy. All rights reserved.
//

#import "HPEntertainmentResult.h"
#import "HPEntertainmentList.h"
@implementation HPEntertainmentResult

-(NSDictionary *)objectClassInArray
{
    return @{@"list":[HPEntertainmentList class]};
}

@end
