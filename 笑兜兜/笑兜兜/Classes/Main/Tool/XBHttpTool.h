//
//  XBHttpTool.h

//
//  Created by shaun on 14-7-13.
//  Copyright (c) 2014年 shaun. All rights reserved.
//

#import <Foundation/Foundation.h>

// 这个类用来封装http请求 内部用的时AFN框架
@interface XBHttpTool : NSObject

// get请求
+(void)Get:(NSString *)url params:(NSDictionary *)params success:(void(^)(id repsonseObj))success failure:(void(^)(NSError *error))failure;

// post请求
+(void)Post:(NSString *)url params:(NSDictionary *)params success:(void(^)(id repsonseObj))success failure:(void(^)(NSError *error))failure;

// post请求 带图片的微博
+(void)Post:(NSString *)url params:(NSDictionary *)params  imageDict:(id(^)())imageDict success:(void(^)(id repsonseObj))success failure:(void(^)(NSError *error))failure;




@end
