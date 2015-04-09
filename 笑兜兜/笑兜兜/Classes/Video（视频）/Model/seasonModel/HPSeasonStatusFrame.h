//
//  HPSeasonStatusFrame.h
//  笑兜兜
//
//  Created by dyf on 14-8-8.
//  Copyright (c) 2014年 cn.happy. All rights reserved.
//

#import <Foundation/Foundation.h>

@class HPSeasonStatus;

@interface HPSeasonStatusFrame : NSObject

@property (nonatomic, strong) HPSeasonStatus *seasonStatus;

@property (nonatomic, assign) CGRect labelFrame;
@property (nonatomic, assign) CGRect btnFrame;
@property (nonatomic, assign) CGRect toolbarFrame;

@property (nonatomic, assign) CGFloat cellHight;

@end
