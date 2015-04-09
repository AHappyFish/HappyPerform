//
//  HPCategoryTool.m
//  笑兜兜
//
//  Created by shaun on 14-8-6.
//  Copyright (c) 2014年 cn.happy. All rights reserved.
//

#import "HPCategoryTool.h"
#import "XBHttpTool.h"
#import "HPCategoryParam.h"
#import "HPCategoryResult.h"
#import "FMDB.h"

@implementation HPCategoryTool

static FMDatabase *_db;

+(void)initialize
{
    NSString *doc = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString *fileName = [doc stringByAppendingPathComponent:@"voiceStatus.sqlite"];
    
    _db = [FMDatabase databaseWithPath:fileName];
    if ([_db open]) {
        BOOL resuslt = [_db executeUpdate:@"CREATE TABLE IF NOT EXISTS voice_category_data (id integer PRIMARY KEY AUTOINCREMENT, category_dict blob NOT NULL);"];
        if (resuslt) {
            HPLog(@"创表成功");
        }else{
            HPLog(@"创表失败");
        }
    }
    
}


+(void)categoryWith:(HPCategoryParam *)param successed:(void (^)(HPCategoryResult *))successed failure:(void (^)(NSError *))failure
{
    // 先从沙盒中加载
    FMResultSet *resultSet  = nil;
    NSDictionary *resultDict = nil;
    resultSet = [_db executeQuery:@"SELECT * FROM voice_category_data"];
    while (resultSet.next) {
        NSData *dataFromDB = [resultSet objectForColumnName:@"category_dict"];
        resultDict = [NSKeyedUnarchiver unarchiveObjectWithData:dataFromDB];
    }
    if (resultDict) {
        HPLog(@"url:%@", resultDict);
        HPCategoryResult *rs = [HPCategoryResult objectWithKeyValues:resultDict];
        if (successed) {
            successed(rs);
        }
    }else{
        NSDictionary *paramDict = param.keyValues;
        // 发送get请求
        [XBHttpTool Get:@"http://mobile.ximalaya.com/m/category_tag_list" params:paramDict success:^(NSDictionary *repsonseObj) {
            NSData *dataDict = [NSKeyedArchiver archivedDataWithRootObject:repsonseObj];
            [_db executeUpdate:@"INSERT INTO voice_category_data (category_dict) VALUES (?)", dataDict];
            HPCategoryResult *rs = [HPCategoryResult objectWithKeyValues:repsonseObj];
            if (successed) {
                successed(rs);
            }
        } failure:^(NSError *error) {
            if (failure) {
                failure(error);
            }
        }];
    }
}

@end
