//
//  HPCommentCell.h
//  笑兜兜
//
//  Created by shaun on 14-8-15.
//  Copyright (c) 2014年 cn.happy. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HPCommentFrame;

@interface HPCommentCell : UITableViewCell
+ (instancetype)cellWithTableView:(UITableView *)tableView;

@property (nonatomic, strong) HPCommentFrame *commentFrame;
@end

