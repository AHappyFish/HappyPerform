//
//  CsyHttpDAO.m
//  Qiubai
//
//  Created by csy on 7/31/14.
//  Copyright (c) 2014 Csy. All rights reserved.
//

#import "CsyHttpTool.h"
#import "AFNetworking.h"

@implementation CsyHttpTool


+ (void)get:(NSString *)urlString parameters:(NSDictionary *)params success:(void (^)(NSDictionary *))sucess failure:(void (^)(NSError *))failure
{
    AFHTTPRequestOperationManager *requestManager = [AFHTTPRequestOperationManager manager];
    
    [requestManager GET:urlString parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        sucess(responseObject);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        failure(error);
        
    }];
    
}

+ (void)post:(NSString *)urlString parameters: (NSDictionary *)params success :(void (^)(NSDictionary *result))sucess failure:(void (^)(NSError *error))failure
{
    AFHTTPRequestOperationManager *requestManager = [AFHTTPRequestOperationManager manager];
    
    [requestManager POST:urlString parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        sucess(responseObject);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        failure(error);
        
    }];
    
}

+ (void)postFile:(NSString *)urlString parameters:(NSDictionary *)params fileParameters:(CsyPostFileParameters *)fileParams success:(void (^)(NSDictionary *))sucess failure:(void (^)(NSError *))failure
{
//    AFHTTPRequestOperationManager *requestManager = [AFHTTPRequestOperationManager manager];
//    
//    [requestManager POST:urlString parameters:params constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
//        
//        [formData appendPartWithFileData:fileParams.data name:fileParams.name fileName:fileParams.fileName mimeType:fileParams.mimeType];
//        
//    } success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        
//        sucess(responseObject);
//        
//    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//        
//        failure(error);
//    }];
}

@end
