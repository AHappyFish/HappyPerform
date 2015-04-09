//
//  XBWaterFlowCell.h
//  XB瀑布流
//
//  Created by shaun on 14-7-28.
//  Copyright (c) 2014年 shaun. All rights reserved.
//

#import <UIKit/UIKit.h>
@class XBWaterFlowView, HPPictures;

@interface XBWaterFlowCell : UIView

+(instancetype)waterFlowCellWith:(XBWaterFlowView *)waterFlowView;

@property (nonatomic, copy) NSString *identifier;

@property (nonatomic, strong) HPPictures *pictures;

@end
