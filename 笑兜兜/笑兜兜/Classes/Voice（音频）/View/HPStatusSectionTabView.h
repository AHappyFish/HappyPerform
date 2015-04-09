//
//  HPStatusSectionTabView.h
//  笑兜兜
//
//  Created by shaun on 14-8-9.
//  Copyright (c) 2014年 cn.happy. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HPStatusSectionTabView;

typedef enum {
    HPStatusSectionButtonTypeIntro = 0,
    HPStatusSectionButtonTypeList,
    HPStatusSectionButtonTypeRelate
}HPStatusSectionButtonType;


@protocol HPStatusSectionTabViewDelegate <NSObject>

-(void)statusSection:(HPStatusSectionTabView *)sectionTabView TabClick:(HPStatusSectionButtonType)statusButtonType;

@end

@interface HPStatusSectionTabView : UIView

@property (nonatomic, weak) id<HPStatusSectionTabViewDelegate> delegate;

@end
