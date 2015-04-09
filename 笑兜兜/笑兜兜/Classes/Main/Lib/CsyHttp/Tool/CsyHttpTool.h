//
//  CsyHttpDAO.h
//  Qiubai
//
//  Created by csy on 7/31/14.
//  Copyright (c) 2014 Csy. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CsyPostFileParameters;

@interface CsyHttpTool : NSObject

+ (void)get:(NSString *)urlString parameters: (NSDictionary *)params success :(void (^)(NSDictionary *result))sucess failure:(void (^)(NSError *error))failure;


+ (void)post:(NSString *)urlString parameters: (NSDictionary *)params success :(void (^)(NSDictionary *result))sucess failure:(void (^)(NSError *error))failure;

+ (void)postFile:(NSString *)urlString parameters: (NSDictionary *)params fileParameters:(CsyPostFileParameters *)fileParams success :(void (^)(NSDictionary *result))sucess failure:(void (^)(NSError *error))failure;

@end
