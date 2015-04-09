//
//  HPCommentDatas.m
//  笑兜兜
//
//  Created by shaun on 14-8-12.
//  Copyright (c) 2014年 cn.happy. All rights reserved.
//

#import "HPCommentDatas.h"
#import "HPComment.h"

@implementation HPCommentDatas

-(NSDictionary *)objectClassInArray
{
    return @{@"recent_comments": [HPComment class]};
}

@end
