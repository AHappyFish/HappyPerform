//
//  HPHomeViedoCell.m
//  笑兜兜
//
//  Created by dyf on 14-8-7.
//  Copyright (c) 2014年 cn.happy. All rights reserved.
//

#import "HPHomeViedoCell.h"
#import "HPHomeVideo.h"

@interface HPHomeViedoCell ()
@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *info;

@end

@implementation HPHomeViedoCell



- (void)setHomeVideo:(HPHomeVideo *)homeVideo
{
    _homeVideo = homeVideo;
    
    self.title.text = homeVideo.name;
    self.info.text = [NSString stringWithFormat:@"%d", [homeVideo.info intValue]];
    self.info.backgroundColor = [UIColor grayColor];
    self.info.layer.cornerRadius = 10;
    
#warning need new fit avatar Image
    UIImage *image = [UIImage imageNamed:@"avatar_default"];
    
    [self.iconView setImageWithURLString:homeVideo.pic placeholderImage:image];
    self.iconView.layer.cornerRadius = 15;
}

+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *identifier = @"homeVideoCell";
    HPHomeViedoCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"HPHomeViedoCell" owner:nil options:nil] lastObject];
    }
    
    return cell;
}

@end
