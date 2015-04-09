//
//  XBWaterFlowView.m
//  XB瀑布流
//
//  Created by shaun on 14-7-28.
//  Copyright (c) 2014年 shaun. All rights reserved.
//

#import "XBWaterFlowView.h"
#import "XBWaterFlowCell.h"

// 默认列数
#define XBWaterFlowViewDefaultColumns 3
// 默认间距
#define XBWaterFlowViewDefaultMargin 10
// 默认行高
#define XBWaterFlowViewDefaultCellHeight 70

@interface XBWaterFlowView ()

@property (nonatomic, strong) NSMutableArray *cellFrames;

// 里边装得是正在显示在view上的cell的
@property (nonatomic, strong) NSMutableDictionary *displayCells;

// cell缓存(已经显示过的并且移除了屏幕) 用set集合 是因为可以不管循序 随机拿一个
@property (nonatomic, strong) NSMutableSet *reuseableCells;

@end

@implementation XBWaterFlowView

-(NSMutableArray *)cellFrames
{
    if (!_cellFrames) {
        _cellFrames = [NSMutableArray array];
    }
    return _cellFrames;
}

-(NSMutableDictionary *)displayCells
{
    if (!_displayCells) {
        _displayCells = [NSMutableDictionary dictionary];
    }
    return _displayCells;
}

-(NSMutableSet *)reuseableCells
{
    if (!_reuseableCells) {
        _reuseableCells = [NSMutableSet set];
    }
    return _reuseableCells;
}

// 首次调用时自动刷新
- (void)willMoveToSuperview:(UIView *)newSuperview
{
    [self reloadData];
}

-(id)init
{
    if (self = [super init]) {
        self.backgroundColor = HPColor(94, 38, 18);
    }
    return self;
}
// 在layoutsubviews中给每个cell设置frame
-(void)layoutSubviews
{
    [super layoutSubviews];
    // 布局cell 每当view滚动一下就会调用一次这个方法
    // 1:拿到cell的总数 可通过cellframes这个数组获得
    int cellsCount = self.cellFrames.count;
    for (int i = 0; i < cellsCount; i++) {
        // 拿到每个cell的frame
        CGRect cellFrame = [self.cellFrames[i] CGRectValue];
        // 从字典中去除cell
        XBWaterFlowCell *cell = self.displayCells[@(i)];
        if ([self isInScreen:cellFrame]) { // cell要显示在屏幕内部
            if (!cell) {
                XBWaterFlowCell *cell = [self.dataSource waterFlowView:self cellAtIndex:i];
                cell.frame = [self.cellFrames[i] CGRectValue];
                [self addSubview:cell];
                self.displayCells[@(i)] = cell;
            }
        }else if (cell) { // 不需要显示在屏幕上的且是从字典中拿到的 说明是已经显示过的 放入缓存池中等待复用
            
            // 先从屏幕上移除
            [cell removeFromSuperview];
            // 加入缓存中
            [self.reuseableCells addObject:cell];
            // 不需要显示的就从字典中移除
            [self.displayCells removeObjectForKey:@(i)];
        }
    }
    
}

// 刷新数据方法
-(void)reloadData
{
    // 清除之前的数据
    
    // 没有这句话 不会调用layoutsubviews重新布局子控件
    [self.displayCells.allValues makeObjectsPerformSelector:@selector(removeFromSuperview)];
    [self.cellFrames removeAllObjects];
    [self.displayCells removeAllObjects];
    [self.reuseableCells removeAllObjects];
    
    // 刷新数据 布局每个cell的frame
    // cell的总数
    NSUInteger numbersOfCell = [self.dataSource numbersOfCellInWaterFlowView:self];
    // cell的列数
    NSInteger columns = [self numbersOfColumns];
    // 各种间距
    CGFloat marginTop = [self marginWithType:XBWaterFlowViewMarginTypeTop];
    CGFloat marginBottom = [self marginWithType:XBWaterFlowViewMarginTypeBottom];
    CGFloat marginLeft = [self marginWithType:XBWaterFlowViewMarginTypeLeft];
    CGFloat marginRight = [self marginWithType:XBWaterFlowViewMarginTypeRight];
    CGFloat rowPadding = [self marginWithType:XBWaterFlowViewMarginTypeRow];
    CGFloat columnPadding = [self marginWithType:XBWaterFlowViewMarginTypeColumn];
    
    // 记录哪一列的最大y值最小 这里用c语言的数据？？？ 因为可以存放非对象类型的数据
    // 数组的大小就是列数
    CGFloat maxYofColumn[columns];
    for (int i = 0; i < columns; i++) { // 初始都是0
        maxYofColumn[i] = 0;
    }
    for (int i = 0; i < numbersOfCell; i++) {
        
        // 得到3列中最大y值最小的cell的那一列 默认0处是最小的
        CGFloat minYInCol = maxYofColumn[0]; // 最大y值最小的值
        int minCol = 0; // 找到最大值最小的那一列
        for (int i = 1; i < columns; i++) {
            if (minYInCol > maxYofColumn[i]) {
                minYInCol = maxYofColumn[i];
                minCol = i;
            }
        }
        
        // cell的宽度
        CGFloat cellW = (self.bounds.size.width - marginLeft - marginRight - (columns - 1) * columnPadding)/columns;
        // cell的高度
        CGFloat cellH = [self cellHeightAtIndex:i];
        
        CGFloat cellX = marginLeft + minCol * (cellW + columnPadding);
        CGFloat cellY = minYInCol;
        if (cellY == 0) {
            cellY += marginTop;
        }else{
            cellY += rowPadding;
        }
        
        // cell的frame
        CGRect cellFrame = CGRectMake(cellX, cellY, cellW, cellH);
        [self.cellFrames addObject:[NSValue valueWithCGRect:cellFrame]];
        // 更新y值
        maxYofColumn[minCol] = CGRectGetMaxY(cellFrame);
    }
    
    // 计算contentsize
    CGFloat contentH = maxYofColumn[0];
    for (int i = 1; i < columns; i++) {
        CGFloat cellYOfCol = maxYofColumn[i];
        if (cellYOfCol > contentH) {
            contentH = cellYOfCol;
        }
    }
    contentH += marginBottom;
    self.contentSize = CGSizeMake(0, contentH);
    
    
}


-(CGRect)cellFrameAtIndex:(int)index
{
    NSValue *frameValue = self.cellFrames[index];
    return [frameValue CGRectValue];
}


-(XBWaterFlowCell *)dequeueReusableCellWithIdentifier:(NSString *)identifier
{
    XBWaterFlowCell *cell = [self.reuseableCells anyObject];
    if ([cell.identifier isEqualToString:identifier]) {
        [self.reuseableCells removeObject:cell];
        return cell;
    }
    return nil;
}


#pragma mark- 私有方法

// 判断某个frame是否在屏幕内
-(BOOL)isInScreen:(CGRect)frame
{
    return ((CGRectGetMaxY(frame) > self.contentOffset.y) &&
    (CGRectGetMinY(frame) < self.contentOffset.y + self.bounds.size.height));
}

// 得到列数
-(NSInteger)numbersOfColumns
{
    if ([self.dataSource respondsToSelector:@selector(columnsOfWaterFlowView:)]) {
        
        return [self.dataSource columnsOfWaterFlowView:self];
    }
    return XBWaterFlowViewDefaultColumns;
}

// 每个cell的高度
-(CGFloat)cellHeightAtIndex:(int)index
{
    if ([self.delegate respondsToSelector:@selector(waterFlowView:heightAtIndex:)]) {
        return [self.delegate waterFlowView:self heightAtIndex:index];
    }
    
    return XBWaterFlowViewDefaultCellHeight;
}

// 各种间距
-(CGFloat)marginWithType:(XBWaterFlowViewMarginType)marginType
{
    if ([self.delegate respondsToSelector:@selector(waterFlowView:margin:)]) {
        return [self.delegate waterFlowView:self margin:marginType];
    }
    return XBWaterFlowViewDefaultMargin;
}

// 点击事件
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    // 如果没有实现代理的点击事件 直接return
    if (![self.delegate respondsToSelector:@selector(waterFlowView:didSelectCellAtIndex:)]) return;
    
    UITouch *touch = [touches anyObject];
    // 以self为参照物 取得触摸点
    CGPoint point = [touch locationInView:self];
    
    __block NSNumber *selectIndex = nil;
    // 遍历正在展示的cell字典
    [self.displayCells enumerateKeysAndObjectsUsingBlock:^(id key, XBWaterFlowCell *cell, BOOL *stop) {
        if (CGRectContainsPoint(cell.frame, point)) {
            selectIndex = key;
            *stop = YES;
        }
    }];
    
    if (selectIndex) {
        [self.delegate waterFlowView:self didSelectCellAtIndex:selectIndex.intValue];
    }
    
}


@end
