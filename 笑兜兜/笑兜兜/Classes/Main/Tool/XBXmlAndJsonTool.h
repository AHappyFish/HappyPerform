//
//  XBXmlAndJsonTool.h
//
//  Created by shaun on 14-6-28.
//  Copyright (c) 2014年 shaun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XBXmlAndJsonTool : NSObject

/**
 *  xml解析
 */
- (NSArray *)xmlParseLargeFileWithData:(NSData *)data; // xml解析大数据

- (NSArray *)xmlParseSmallFileWithData:(NSData *)data; // 解析小数据

/**
 *  json解析
 */
- (NSArray *)jsonParseWithData:(NSData *)data; // json解析


@end
