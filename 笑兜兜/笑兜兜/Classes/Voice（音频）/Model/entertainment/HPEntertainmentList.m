//
//  HPEntertainmentSingleResulst.m
//  笑兜兜
//
//  Created by shaun on 14-8-5.
//  Copyright (c) 2014年 cn.happy. All rights reserved.
//

#import "HPEntertainmentList.h"

@implementation HPEntertainmentList

-(void)setLastUptrackAt:(NSString *)lastUptrackAt
{
    NSString *dateStr = lastUptrackAt;
    // 将毫秒转为秒数
    long long mit = [dateStr longLongValue]/1000;
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    //    fmt.dateFormat = @"EEE MMM dd HH:mm:ss Z yyyy";
    // 定义时间显示的格式
    fmt.dateFormat = @"yyyy-MM-dd";
    NSDate *date = [[NSDate alloc] initWithTimeIntervalSince1970:mit];
    NSString *realDate = [NSString stringWithFormat:@"最后更新 %@", [fmt stringFromDate:date]];
    _lastUptrackAt = realDate;
}


-(NSString *)playsCounts
{
    long long count = [_playsCounts longLongValue];
    if (count > 10000) {
        return [NSString stringWithFormat:@"播放%.1f万次", count / 10000.0];
    }else {
        return [NSString stringWithFormat:@"播放%lld万次", count];
    }
    
}
@end
