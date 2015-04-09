//
//  XBHttpTool.m
//
//  Created by shaun on 14-7-13.
//  Copyright (c) 2014年 shaun. All rights reserved.
//

#import "XBHttpTool.h"
#import "AFNetworking.h"



@implementation XBHttpTool

// get请求
+(void)Get:(NSString *)url params:(NSDictionary *)params success:(void(^)(id repsonseObj))success failure:(void(^)(NSError *error))failure
{
    AFHTTPRequestOperationManager *mgr = [AFHTTPRequestOperationManager manager];
    
    // 去除字典中多余的参数(该参数是用MJExtension从模型转字典引发的)
    NSDictionary *paramDict = params;
    NSMutableDictionary *realDict = [NSMutableDictionary dictionaryWithDictionary:paramDict];
    NSArray *keyArray = [realDict allKeys];
    
    if ([keyArray containsObject:@"isa"]) {
        [realDict removeObjectForKey:@"isa"];
    }
    
    [mgr GET:url parameters:realDict success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (success) {
            success(responseObject);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (error) {
            failure(error);
        }
    }];
    
}

// post请求
+(void)Post:(NSString *)url params:(NSDictionary *)params success:(void(^)(id repsonseObj))success failure:(void(^)(NSError *error))failure
{
    AFHTTPRequestOperationManager *mgr = [AFHTTPRequestOperationManager manager];
    
    [mgr POST:url parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (success) {
            success(responseObject);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (error) {
            failure(error);
        }
    }];
    
}

// post请求 带图片
+(void)Post:(NSString *)url params:(NSDictionary *)params  imageDict:(id(^)())imageDict success:(void(^)(id repsonseObj))success failure:(void(^)(NSError *error))failure
{
    AFHTTPRequestOperationManager *mgr = [AFHTTPRequestOperationManager manager];
    
    [mgr POST:url parameters:params constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
        if (imageDict) {
            NSDictionary *dict = imageDict();
            [formData appendPartWithFileData:dict[@"fileData"] name:dict[@"name"] fileName:dict[@"fileName"] mimeType:dict[@"mimeType"]];
        }
    } success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (success) {
            success(responseObject);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (error) {
            failure(error);
        }
    }];
    
}



@end
