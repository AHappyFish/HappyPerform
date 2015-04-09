//
//  NSString+tools.h
//  10-QQ
//
//  Created by csy on 5/30/14.
//  Copyright (c) 2014 cl. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (tools)

//返回字符串占据的size
- (CGSize)sizeWithfont:(UIFont *)font maxSize:(CGSize)maxSize;


//URL字符串进行编码
-(NSString *)URLEncodedString;
-(NSString *)URLDecodedString;


//数据加密
@property (readonly) NSString *md5String;
@property (readonly) NSString *sha1String;
@property (readonly) NSString *sha256String;
@property (readonly) NSString *sha512String;

- (NSString *)hmacSHA1StringWithKey:(NSString *)key;
- (NSString *)hmacSHA256StringWithKey:(NSString *)key;
- (NSString *)hmacSHA512StringWithKey:(NSString *)key;


@end
