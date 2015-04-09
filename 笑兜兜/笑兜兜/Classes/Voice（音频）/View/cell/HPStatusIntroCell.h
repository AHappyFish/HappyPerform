//
//  HPStatusIntroCell.h
//  笑兜兜
//
//  Created by shaun on 14-8-10.
//  Copyright (c) 2014年 cn.happy. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HPVoiceAlbumItem;
@interface HPStatusIntroCell : UITableViewCell

+(instancetype)cellWithTableView:(UITableView *)tableView;

@property (nonatomic, strong) HPVoiceAlbumItem *albumItem;

@end
