//
//  HPCategoryTool.h
//  笑兜兜
//
//  Created by shaun on 14-8-6.
//  Copyright (c) 2014年 cn.happy. All rights reserved.
//

#import <Foundation/Foundation.h>
@class HPCategoryParam, HPCategoryResult;

@interface HPCategoryTool : NSObject

+(void)categoryWith:(HPCategoryParam *)param successed:(void(^)(HPCategoryResult *result))successed failure:(void(^)(NSError *error))failure;

@end
