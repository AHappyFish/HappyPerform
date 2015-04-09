//
//  HPEntertainmentView.h
//  笑兜兜
//
//  Created by shaun on 14-8-5.
//  Copyright (c) 2014年 cn.happy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HPCategoryView : UIView

+(instancetype)categoryView;

@property (nonatomic, copy) NSString *icon;
@property (nonatomic, copy) NSString *title;

@end
