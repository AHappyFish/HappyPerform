//
//  HPGroupParam.h
//  笑兜兜
//
//  Created by shaun on 14-8-10.
//  Copyright (c) 2014年 cn.happy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HPGroupParam : NSObject

//tag=joke&iid=2267271383&min_time=1407426048&category_id=1&count=20&level=6&app_name=joke_essay
@property (nonatomic,copy) NSString *tag;

@property (nonatomic ,copy) NSString *iid;

@property (nonatomic ,copy) NSString *category_id;

@property (nonatomic ,copy) NSNumber *level;

@property (nonatomic ,copy) NSString *app_name;

@property (nonatomic ,copy) NSString *min_time;

@property (nonatomic ,copy) NSNumber *count;

@property (nonatomic ,copy) NSString *max_time;

@end
