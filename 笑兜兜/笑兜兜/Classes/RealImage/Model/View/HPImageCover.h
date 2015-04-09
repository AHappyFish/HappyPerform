//
//  HPImageCover.h
//  笑兜兜
//
//  Created by shaun on 14-9-9.
//  Copyright (c) 2014年 cn.happy. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HPPictures;

@interface HPImageCover : UIScrollView

-(void)showWithCellFrame:(CGRect)frame pictures:(HPPictures *)pic;

@end
