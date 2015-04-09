//
//  HPEntertainmentResult.m
//  笑兜兜
//
//  Created by shaun on 14-8-4.
//  Copyright (c) 2014年 cn.happy. All rights reserved.
//

#import "HPCategoryResult.h"
#import "HPCategoryList.h"
@implementation HPCategoryResult

-(NSDictionary *)objectClassInArray
{
    return @{@"list" : [HPCategoryList class]};
}

@end
