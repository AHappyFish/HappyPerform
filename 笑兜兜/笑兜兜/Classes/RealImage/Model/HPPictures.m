//
//  HPPictures.m
//  笑兜兜
//
//  Created by shaun on 14-9-7.
//  Copyright (c) 2014年 cn.happy. All rights reserved.
//

#import "HPPictures.h"
#import "HPThumbUrl.h"

@implementation HPPictures

-(NSDictionary *)objectClassInArray
{
    return @{@"url" : [HPThumbUrl class]};
}

@end
