//
//  XBWaterFlowView.h
//  XB瀑布流
//
//  Created by shaun on 14-7-28.
//  Copyright (c) 2014年 shaun. All rights reserved.
//

#import <UIKit/UIKit.h>
@class XBWaterFlowView, XBWaterFlowCell;

typedef enum{
    // 整个waterFlowView距离(top, bottom, left, right)的间距
    XBWaterFlowViewMarginTypeTop,
    XBWaterFlowViewMarginTypeBottom,
    XBWaterFlowViewMarginTypeLeft,
    XBWaterFlowViewMarginTypeRight,
    // 行 列 间距
    XBWaterFlowViewMarginTypeRow,
    XBWaterFlowViewMarginTypeColumn
    
} XBWaterFlowViewMarginType;

// 数据源协议
@protocol XBWaterFlowViewDataSource <NSObject>

@required
// cell的个数
- (NSInteger)numbersOfCellInWaterFlowView:(XBWaterFlowView *)waterFlowView;

// 返回每个cell
-(XBWaterFlowCell *)waterFlowView:(XBWaterFlowView *)waterFlowView cellAtIndex:(int)index;

@optional

// 瀑布流的列数 默认是3
-(NSInteger)columnsOfWaterFlowView:(XBWaterFlowView *)waterFlowView;

@end

// 代理协议
@protocol XBWaterFlowViewDelegate <UIScrollViewDelegate>

@optional
// 每个cell的高度 默认是70
-(CGFloat)waterFlowView:(XBWaterFlowView *)waterFlowView heightAtIndex:(int)index;

// 整个waterFlowView距离(top, bottom, left, right)的间距  行距和列距
-(CGFloat)waterFlowView:(XBWaterFlowView *)XBWaterFlowView margin:(XBWaterFlowViewMarginType)marginType;

// 点击某个cell的方法
-(void)waterFlowView:(XBWaterFlowView *)XBWaterFlowView didSelectCellAtIndex:(int)index;

@end


@interface XBWaterFlowView : UIScrollView
/**
 *  数据源
 */
@property (nonatomic, weak) id<XBWaterFlowViewDataSource> dataSource;
/**
 *  代理
 */
@property (nonatomic, weak)  id<XBWaterFlowViewDelegate> delegate;

// 刷新数据方法
-(void)reloadData;

// 从缓存中取cell的方法
-(XBWaterFlowCell *)dequeueReusableCellWithIdentifier:(NSString *)identifier;

-(CGRect)cellFrameAtIndex:(int)index;

@end
