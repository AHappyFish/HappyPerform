//
//  HPSeasonCell.m
//  笑兜兜
//
//  Created by dyf on 14-8-8.
//  Copyright (c) 2014年 cn.happy. All rights reserved.
//

#import "HPSeasonCell.h"
#import "HPSeasonStatus.h"
#import "HPSeasonToolbar.h"
#import "HPSeasonStatusFrame.h"

@interface HPSeasonCell ()

@property (nonatomic, weak) UILabel *label;
@property (nonatomic, weak) UIButton *btn;
@property (nonatomic, weak) HPSeasonToolbar *toolbar;

@property (nonatomic, strong) UIImageView *iconView;

@end

@implementation HPSeasonCell

+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *identifier = @"HPSeasonCell";
    HPSeasonCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[HPSeasonCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
        //cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    return cell;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        //
        self.backgroundColor = [UIColor clearColor];
        
        UILabel *label = [[UILabel alloc] init];
        label.font = CsyJokeTextFont;
        label.textColor = [UIColor blackColor];
        label.numberOfLines = 0;
        
        [self.contentView addSubview:label];
        self.label = label;
        
        UIImageView *iconView = [[UIImageView alloc] init];
        self.iconView = iconView;
        
        UIButton *btn = [[UIButton alloc] init];
        [btn setImage:[UIImage imageNamed:@"activeRadioPlayButton"] forState:UIControlStateNormal];

        btn.imageView.contentMode = UIViewContentModeCenter;
        [btn setTitleColor:[UIColor clearColor] forState:UIControlStateNormal];
        
        [self.contentView addSubview:btn];
        self.btn = btn;
        
        HPSeasonToolbar *toolbar = [[HPSeasonToolbar alloc] init];
        
        [self.contentView addSubview:toolbar];
        self.toolbar = toolbar;
        
        
    }
    return self;
}

- (void)setSeasonStatusFrame:(HPSeasonStatusFrame *)seasonStatusFrame
{
    _seasonStatusFrame = seasonStatusFrame;
    
    self.label.frame = seasonStatusFrame.labelFrame;
    self.label.text = seasonStatusFrame.seasonStatus.title;
    
    self.btn.frame = seasonStatusFrame.btnFrame;
#warning 这里是用 url 还是 MP4_url 待定
    [self.btn setTitle:seasonStatusFrame.seasonStatus.mp4_url forState:UIControlStateNormal];
#warning 按钮图片
    [self.btn setBackgroundImageWithString:seasonStatusFrame.seasonStatus.pic forState:UIControlStateNormal placeholderImageName:@"bg_albumView_header"];
    
    [self.btn addTarget:self action:@selector(clickOnPlay) forControlEvents:UIControlEventTouchDown];
    
    
    self.toolbar.frame = seasonStatusFrame.toolbarFrame;
    self.toolbar.seasonStatus = seasonStatusFrame.seasonStatus;
    
}

- (void)setDelegate:(id<HPSeasonCellDelegate>)delegate
{
    _delegate = delegate;
    
}

- (void)clickOnPlay
{
#warning To be Continue
    // 打开一个新的控制器,在里面点击播放,控制器的标题跟 cell 里面内容有关,控制器中是个 webView,或者,一打开,就自动连接 MP4播放也可以
    NSURL *url = [NSURL URLWithString:self.seasonStatusFrame.seasonStatus.mp4_url];
    if ([self.delegate respondsToSelector:@selector(openViedoOfCellWithUrl:)]) {
        [self.delegate openViedoOfCellWithUrl:url];
    }
}

- (void)layoutSubviews
{
    [super layoutSubviews];
}

@end
