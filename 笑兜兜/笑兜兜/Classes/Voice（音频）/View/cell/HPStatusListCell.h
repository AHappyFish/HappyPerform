//
//  HPStatusListCell.h
//  笑兜兜
//
//  Created by shaun on 14-8-6.
//  Copyright (c) 2014年 cn.happy. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HPEntertainmentList;


@interface HPStatusListCell : UITableViewCell

+(instancetype)cellWithTableView:(UITableView *)tableView;

@property (nonatomic, strong) HPEntertainmentList *statuslist;

@end
