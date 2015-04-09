//
//  HPTDatasCell.h
//  笑兜兜
//
//  Created by shaun on 14-8-1.
//  Copyright (c) 2014年 cn.happy. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HPGroupsFrame;

@interface HPGroupsCell : UITableViewCell
+ (instancetype)cellWithTableView:(UITableView *)tableView;

@property (nonatomic, strong) HPGroupsFrame *groupsFrame;
@end
