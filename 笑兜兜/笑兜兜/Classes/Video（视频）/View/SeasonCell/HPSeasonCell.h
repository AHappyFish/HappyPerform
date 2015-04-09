//
//  HPSeasonCell.h
//  笑兜兜
//
//  Created by dyf on 14-8-8.
//  Copyright (c) 2014年 cn.happy. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HPSeasonCell, HPSeasonStatusFrame;

@protocol HPSeasonCellDelegate <NSObject>

@optional
- (void)openViedoOfCellWithUrl:(NSURL *)url;

@end

@interface HPSeasonCell : UITableViewCell

@property (nonatomic, strong) HPSeasonStatusFrame *seasonStatusFrame;

+ (instancetype)cellWithTableView:(UITableView *)tableView;

@property (nonatomic, weak) id<HPSeasonCellDelegate> delegate;

@end
