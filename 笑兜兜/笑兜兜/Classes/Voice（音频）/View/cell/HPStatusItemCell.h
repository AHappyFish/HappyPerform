//
//  HPStatusItemCell.h
//  笑兜兜
//
//  Created by shaun on 14-8-7.
//  Copyright (c) 2014年 cn.happy. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HPVoiceTrackList;

@interface HPStatusItemCell : UITableViewCell

+(instancetype)cellWithTableView:(UITableView *)tableView;


@property (nonatomic, strong) HPVoiceTrackList *track;



@end
