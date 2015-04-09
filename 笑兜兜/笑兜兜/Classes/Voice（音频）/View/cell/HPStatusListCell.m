//
//  HPStatusListCell.m
//  笑兜兜
//
//  Created by shaun on 14-8-6.
//  Copyright (c) 2014年 cn.happy. All rights reserved.
//

#import "HPStatusListCell.h"
#import "HPEntertainmentList.h"
#import "UIImageView+WebCache.h"
#define HPVoiceMargin 5
#define HPVoiceContentHeight 90
#define HPVoiceTitleFont [UIFont systemFontOfSize:15]
#define HPVoiceClickCountFont [UIFont systemFontOfSize:12]
#define HPVoiceTimeLabFont [UIFont systemFontOfSize:12]

@interface HPStatusListCell ()

@property (nonatomic, weak) UIView *fieldView;
@property (nonatomic, weak) UIImageView *Icon;
@property (nonatomic, weak) UIImageView *subImageView;
@property (nonatomic, weak) UILabel *nameLab ;
@property (nonatomic, weak) UILabel *clickCountLab;
@property (nonatomic, weak) UILabel *timeLab;
@property (nonatomic, weak) UIButton *subscribe;


@end


@implementation HPStatusListCell


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) { // 初始化子控件
        
        self.backgroundColor = [UIColor clearColor];
        // 取消选中的样式
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        UIView *fieldView = [[UIView alloc] init];
        [self addSubview:fieldView];
        self.fieldView = fieldView;
//        self.fieldView.scrollEnabled = NO;
        self.fieldView.backgroundColor = [UIColor whiteColor];
        
        // 图片
        UIImageView *Icon = [[UIImageView alloc] init];
        [self.fieldView addSubview:Icon];
        self.Icon = Icon;
        
        // 辑
        UIImageView *subImageView = [[UIImageView alloc] init];
        [self.fieldView addSubview:subImageView];
        self.subImageView = subImageView;
        
        // 名称
        UILabel *nameLab = [[UILabel alloc] init];
        self.nameLab = nameLab;
        [self.fieldView addSubview:nameLab];
        self.nameLab.font = HPVoiceTitleFont;
        self.nameLab.numberOfLines = 0;
        
        // 更新时间
        UILabel *timeLab = [[UILabel alloc] init];
        [self.fieldView addSubview:timeLab];
        self.timeLab = timeLab;
        self.timeLab.font = HPVoiceTimeLabFont;
        self.timeLab.textColor = [UIColor lightGrayColor];
        
        // 点击量
        UILabel *clickCountLab = [[UILabel alloc] init];
        [self.fieldView addSubview:clickCountLab];
        self.clickCountLab = clickCountLab;
        self.clickCountLab.font = HPVoiceClickCountFont;
        self.clickCountLab.textColor = [UIColor lightGrayColor];
        
        // 订阅 (待定)
        UIButton *subscribe = [[UIButton alloc] init];
        [self.fieldView addSubview:subscribe];
        self.subscribe = subscribe;
    }
    return self;
}




+(instancetype)cellWithTableView:(UITableView *)tableView
{
    NSString *ID = @"cell";
    HPStatusListCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[HPStatusListCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    return cell;
}



// 设置数据 布局子控件
-(void)setStatuslist:(HPEntertainmentList *)statuslist
{
    _statuslist = statuslist;
    
    // contentViewframe设置
//    self.fieldView.contentSize = CGSizeMake(self.size.width, self.size.height);
    self.fieldView.x = 0;
    self.fieldView.y = 10;
    self.fieldView.height = HPVoiceContentHeight;
    self.fieldView.width = HPScreenW;
    
    // imageview
    NSURL *url = [NSURL URLWithString:statuslist.albumCoverUrl290];
    [self.Icon sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"avatar_default_big"]];
    CGFloat imageW = HPVoiceContentHeight;
    CGFloat imageH = HPVoiceContentHeight;
    self.Icon.frame = CGRectMake(0, 0, imageW, imageH);
    
    // 辑
    self.subImageView.image = [UIImage imageNamed:@"sound_album"];
    self.subImageView.x = CGRectGetMaxX(self.Icon.frame) + HPVoiceMargin;
    self.subImageView.width = 22;
    self.subImageView.height =21;
    self.subImageView.y = self.Icon.y + HPVoiceMargin;
    
    // 标题
    self.nameLab.text = statuslist.title;
    CGFloat nameX = CGRectGetMaxX(self.subImageView.frame) + HPVoiceMargin;
    CGFloat nameY = self.Icon.y + HPVoiceMargin;
    CGSize maxNameSize = CGSizeMake(HPScreenW - nameX, MAXFLOAT);
    CGSize sizeName = [self.nameLab.text boundingRectWithSize:maxNameSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: HPVoiceTitleFont} context:nil].size;
    CGFloat nameW = sizeName.width;
    CGFloat nameH = sizeName.height;
    self.nameLab.frame = CGRectMake(nameX, nameY, nameW, nameH);
    
    // 更新时间
    self.timeLab.text = statuslist.lastUptrackAt;
    CGFloat timeLabW = 140;
    CGFloat timeLabH = 20;
    CGFloat timeLabX = self.subImageView.x;
    CGFloat timeLabY = 65;
    self.timeLab.frame = CGRectMake(timeLabX, timeLabY, timeLabW, timeLabH);
    
    // 点击量
    self.clickCountLab.text = [NSString stringWithFormat:@"%@",statuslist.playsCounts];
    self.clickCountLab.x = self.timeLab.x;
    self.clickCountLab.width = 140;
    self.clickCountLab.height = 20;
    self.clickCountLab.y = 45;
    
    // 点击订阅按钮
    [self.subscribe setImage:[UIImage imageNamed:@"find_album_unfav_n"] forState:UIControlStateNormal];
    CGFloat btnW = 69;
    CGFloat btnH = 25;
    CGFloat btnX = HPScreenW - btnW - HPVoiceMargin;
    CGFloat btnY = HPVoiceContentHeight - btnH - 5;
    self.subscribe.frame = CGRectMake(btnX, btnY, btnW, btnH);
    
}



@end
