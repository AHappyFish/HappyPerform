//
//  HPCommentCell.m
//  笑兜兜
//
//  Created by shaun on 14-8-15.
//  Copyright (c) 2014年 cn.happy. All rights reserved.
//

#import "HPCommentCell.h"
#import "HPCommentFrame.h"

@interface HPCommentCell ()
@property (nonatomic, weak) UIView *bodyView;
@end

@implementation HPCommentCell

+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"comment";
    HPCommentCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[HPCommentCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
        cell = [[HPCommentCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    
    return cell;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) { // 初始化子控件
        
        //1.添加正文
        UIView *bodyView = [[UIView alloc] init];
        [self.contentView addSubview:bodyView];
        self.bodyView = bodyView;
        // 3.cell的设置
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}
- (void)setCommentFrame:(HPCommentFrame *)commentFrame
{
    _commentFrame = commentFrame;
    
    // 1.具体内容的frame数据
    self.bodyView.frame= commentFrame.frame;
}

//- (instancetype)initWithFrame:(NSRect)frame
//{
//    self = [super initWithFrame:frame];
//    if (self) {
//        
//        
//    }
//    return self;
//}

@end
