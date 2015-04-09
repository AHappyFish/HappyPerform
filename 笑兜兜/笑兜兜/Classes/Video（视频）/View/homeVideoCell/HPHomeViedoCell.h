//
//  HPHomeViedoCell.h
//  笑兜兜
//
//  Created by dyf on 14-8-7.
//  Copyright (c) 2014年 cn.happy. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HPHomeVideo;

@interface HPHomeViedoCell : UITableViewCell

@property (nonatomic, strong) HPHomeVideo *homeVideo;

+ (instancetype)cellWithTableView:(UITableView *)tableView;

@end
