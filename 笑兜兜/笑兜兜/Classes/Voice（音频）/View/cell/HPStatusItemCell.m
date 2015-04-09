//
//  HPStatusItemCell.m
//  笑兜兜
//
//  Created by shaun on 14-8-7.
//  Copyright (c) 2014年 cn.happy. All rights reserved.
//

#import "HPStatusItemCell.h"
#import "HPVoiceTrackList.h"
#import "UIImageView+WebCache.h"
#import "UIImage+Extension.h"
#define HPVoiceMargin 5
#define HPVoiceTitleFont [UIFont systemFontOfSize:15]

@interface HPStatusItemCell ()

@property (nonatomic, weak) UIView *fieldView;
@property (nonatomic, weak) UIImageView *Icon;
@property (nonatomic, weak) UIImageView *playImageView;
@property (nonatomic, weak) UILabel *titleLab;

@end

@implementation HPStatusItemCell

+(instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"voice";
    HPStatusItemCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[HPStatusItemCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    return cell;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        // 添加title标题
        UIView *fieldView = [[UIView alloc] init];
        [self addSubview:fieldView];
        self.fieldView = fieldView;
        self.fieldView.backgroundColor = [UIColor whiteColor];
        
        // 图片
        UIImageView *Icon = [[UIImageView alloc] init];
        [self.fieldView addSubview:Icon];
        self.Icon = Icon;
        
        // 占位图标
        UIImageView *playImageView = [[UIImageView alloc] init];
        [self.fieldView addSubview:playImageView];
        self.playImageView = playImageView;
        
        // 名称
        UILabel *titleLab = [[UILabel alloc] init];
        self.titleLab = titleLab;
        [self.fieldView addSubview:titleLab];
        self.titleLab.font = HPVoiceTitleFont;
        self.titleLab.numberOfLines = 0;
        
    }
    return self;
}

-(void)setTrack:(HPVoiceTrackList *)track
{
    _track = track;
    
    // contentViewframe设置
    self.fieldView.x = 0;
    self.fieldView.y = 10;
    self.fieldView.height = 85;
    self.fieldView.width = HPScreenW;
    
    // imageview
    NSURL *url = [NSURL URLWithString:track.smallLogo];
    UIImage *placeholderImage = [UIImage imageWithCircleByBorder:3 color:[UIColor lightGrayColor] imageName:@"avatar_default_small"];
    
    [self.Icon sd_setImageWithURL:url placeholderImage:placeholderImage completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType,NSURL *imageURL) {
        self.Icon.image = [UIImage imageWithCircleByBorder:3 color:[UIColor lightGrayColor] image:image];
    }];
    
    
    self.Icon.layer.cornerRadius = 5;
    self.Icon.width = 54;
    self.Icon.height = 54;
    self.Icon.x = HPVoiceMargin;
    self.Icon.y = HPVoiceMargin * 3;
    
    // 播放图标
    self.playImageView.image = [UIImage imageNamed:@"activeRadioPlayButton"];
    self.playImageView.width = 55;
    self.playImageView.height =85;
    self.playImageView.x = self.fieldView.width - self.playImageView.width - HPVoiceMargin;
    self.playImageView.y = (self.fieldView.height - self.playImageView.height) * 0.5;
    
    // 标题
    self.titleLab.text = track.title;
    CGFloat nameX = CGRectGetMaxX(self.Icon.frame) + 2 * HPVoiceMargin;
    CGFloat nameY = 2 * HPVoiceMargin;
    CGFloat maxWidth = self.fieldView.width - self.playImageView.width - self.Icon.width - 4 * HPVoiceMargin;
    CGSize maxNameSize = CGSizeMake(maxWidth, MAXFLOAT);
    CGSize sizeName = [self.titleLab.text boundingRectWithSize:maxNameSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: HPVoiceTitleFont} context:nil].size;
    CGFloat nameW = sizeName.width;
    CGFloat nameH = sizeName.height;
    self.titleLab.frame = CGRectMake(nameX, nameY, nameW, nameH);
    
}



@end
