//
//  HPMediaFile.h
//  笑兜兜
//
//  Created by shaun on 14-8-11.
//  Copyright (c) 2014年 cn.happy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DOUAudioStreamer.h"

@interface HPMediaFile : NSObject <DOUAudioFile>

@property (nonatomic, strong) NSURL *audioFileURL;

@end
