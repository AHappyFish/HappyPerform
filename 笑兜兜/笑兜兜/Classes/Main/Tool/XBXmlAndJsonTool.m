//
//  XBXmlAndJsonTool.m
//  05-黑酷xml解析
//
//  Created by shaun on 14-6-28.
//  Copyright (c) 2014年 shaun. All rights reserved.
//

#import "XBXmlAndJsonTool.h"
#import "GDataXMLNode.h"
@interface XBXmlAndJsonTool ()<NSXMLParserDelegate>

@property (nonatomic, strong) NSMutableArray *arrayM;

@end


@implementation XBXmlAndJsonTool

/**
 *  xml解析
 *  解析方式：dom：一次性加载到内存 占内存  sax 一个结点一个结点的解析 不能回退
 */




- (NSArray *)xmlParseLargeFileWithData:(NSData *)data // xml解析大数据
{
    return [self saxXmlParseWithData:data];
}


- (NSArray *)xmlParseSmallFileWithData:(NSData *)data  // 解析小数据
{
    return [self domParseXmlByGdataWithData:data];
}
/**
 *  dom解析 Gdata 小数据解析
 */
-(NSArray *)domParseXmlByGdataWithData:(NSData *)data
{
    // 加载文档
    GDataXMLDocument *doc = [[GDataXMLDocument alloc] initWithData:data options:0 error:nil];
    
    // 加载根元素
    GDataXMLElement *root = doc.rootElement;
    
    // 遍历所有video元素
    NSArray *eles = [root elementsForName:@"video"];
    
    // 模型装入
    NSMutableArray *eleVideos = [NSMutableArray array];
    for (GDataXMLElement *element in eles) {
        
//        HMVideo *videoModel = [[HMVideo alloc] init];
//        videoModel.ID = [element attributeForName:@"id"].stringValue.intValue;
//        videoModel.length = [element attributeForName:@"length"].stringValue.intValue;
//        videoModel.name = [element attributeForName:@"name"].stringValue;
//        videoModel.image = [element attributeForName:@"image"].stringValue;
//        videoModel.url = [element attributeForName:@"url"].stringValue;
//        [eleVideos addObject:videoModel];
    }
    return eleVideos;
    
}
/**
 *  xmlParse苹果原生大数据解析
 */
-(NSArray *)saxXmlParseWithData:(NSData *)data
{
    // 创建解析器
    NSXMLParser *parser = [[NSXMLParser alloc] initWithData:data];
    
    // 设置代理
    parser.delegate = self;
    
    [parser parse]; // 阻塞式方法 解析完才返回
    
    
    return self.arrayM;
}

#pragma mark NSXMLParser的代理方法
/**
 *  解析开始时调用的方法
 */
- (void)parserDidStartDocument:(NSXMLParser *)parser
{

}

/**
 *  解析结束调用的方法
 */
-(void)parserDidEndDocument:(NSXMLParser *)parser
{

}

/**
 *  解析到一个元素的开始的时候调用
 *  参数：elementName解析到的每一个结点
 *  attributeDict:返回该结点中的所有属性 是一个NSDictionary
 */
- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{
//    if ([@"videos" isEqualToString:elementName]) { // 解析到一个videos标签
//        // 说明开始了 创建数据
//        self.arrayM = [NSMutableArray array];
//    }else if ([@"video" isEqualToString:elementName]) // 解析到一个video标签
//    {
//        // 开始模型转入
//        HMVideo *video = [HMVideo videoWithDict:attributeDict];
//        [self.arrayM addObject:video];
//    }

}

/**
 *  解析到一个元素的结尾的时候调用的方法
 */
-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    
}

/**
 *  json解析
 */
- (NSArray *)jsonParseWithData:(NSData *)data
{
    // 根据json的最外层的模型可以转为字典
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
    NSArray *array = dict[@"videos"];
    NSMutableArray *arrayVideos = [[NSMutableArray alloc] initWithCapacity:array.count];
    for (NSDictionary *dict in array) {
//        HMVideo *videoModel = [HMVideo videoWithDict:dict];
//        [arrayVideos addObject:videoModel];
    }
    return arrayVideos;
}
@end
