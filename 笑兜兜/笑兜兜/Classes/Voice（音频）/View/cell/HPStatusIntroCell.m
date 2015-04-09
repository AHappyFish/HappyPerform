//
//  HPStatusIntroCell.m
//  笑兜兜
//
//  Created by shaun on 14-8-10.
//  Copyright (c) 2014年 cn.happy. All rights reserved.
//

#import "HPStatusIntroCell.h"
#import "HPVoiceAlbumItem.h"
#define HPVoiceMargin 10
#define HPVoiceTitleFont [UIFont systemFontOfSize:15]
#define HPVoiceClickCountFont [UIFont systemFontOfSize:12]
#define HPVoiceLabFont [UIFont systemFontOfSize:14]

@interface HPStatusIntroCell ()

@property (nonatomic, weak) UIScrollView *fieldView;

// 专辑名称
//@property (nonatomic, weak) UILabel *albumLab;
//@property (nonatomic, weak) UILabel *albumContent;

// 创建人
@property (nonatomic, weak) UILabel *builderLab;
@property (nonatomic, weak) UILabel *buildContent;

// 分享
@property (nonatomic, weak) UILabel *shareLab;
@property (nonatomic, weak) UILabel *shareContent;

// 标签
@property (nonatomic, weak) UILabel *lab;
@property (nonatomic, weak) UILabel *labContent;

// 简介
@property (nonatomic, weak) UILabel *introLab;
@property (nonatomic, weak) UILabel *introContent;

@end

@implementation HPStatusIntroCell

+(instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"intro";
    HPStatusIntroCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[HPStatusIntroCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    return cell;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.backgroundColor = [UIColor whiteColor];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        // 添加滚动view
        UIScrollView *fieldView = [[UIScrollView alloc] init];
        [self addSubview:fieldView];
        self.fieldView = fieldView;
        self.fieldView.backgroundColor = [UIColor clearColor];
        self.fieldView.scrollEnabled = YES;
        
        // 创建人
        UILabel *builderLab = [[UILabel alloc] init];
        [self.fieldView addSubview:builderLab];
        self.builderLab = builderLab;
        self.builderLab.text = @"创建人:";
        self.builderLab.font = HPVoiceLabFont;
        self.builderLab.textColor = [UIColor lightGrayColor];
        // 创建人内容
        UILabel *buildContent = [[UILabel alloc] init];
        [self.fieldView addSubview:buildContent];
        self.buildContent = buildContent;
        self.buildContent.font = HPVoiceLabFont;
        self.buildContent.numberOfLines = 0;

        
        // 分享
        UILabel *shareLab = [[UILabel alloc] init];
        [self.fieldView addSubview:shareLab];
        self.shareLab = shareLab;
        self.shareLab.text = @"分享:";
        self.shareLab.font = HPVoiceLabFont;
        self.shareLab.textColor = [UIColor lightGrayColor];
        // 分享内容
        UILabel *shareContent = [[UILabel alloc] init];
        [self.fieldView addSubview:shareContent];
        self.shareContent = shareContent;
        self.shareContent.font = HPVoiceLabFont;
        self.shareContent.numberOfLines = 0;

        
        // 标签
        UILabel *lab = [[UILabel alloc] init];
        [self.fieldView addSubview:lab];
        self.lab = lab;
        self.lab.text = @"标签:";
        self.lab.font = HPVoiceLabFont;
        self.lab.textColor = [UIColor lightGrayColor];
        // 标签内容
        UILabel *labContent = [[UILabel alloc] init];
        [self.fieldView addSubview:labContent];
        self.labContent = labContent;
        self.labContent.font = HPVoiceLabFont;
        self.labContent.numberOfLines = 0;
        
        // 简介
        UILabel *introLab = [[UILabel alloc] init];
        [self.fieldView addSubview:introLab];
        self.introLab = introLab;
        self.introLab.text = @"简介:";
        self.introLab.font = HPVoiceLabFont;
        self.introLab.textColor = [UIColor lightGrayColor];
        // 简介内容
        UILabel *introContent = [[UILabel alloc] init];
        [self.fieldView addSubview:introContent];
        self.introContent = introContent;
        self.introContent.font = HPVoiceLabFont;
        self.introContent.numberOfLines = 0;

    }
    return self;
}

// setter赋值并布局子控件
-(void)setAlbumItem:(HPVoiceAlbumItem *)albumItem
{
    _albumItem = albumItem;
    
    // contentViewframe设置
    self.fieldView.scrollEnabled = YES;
    self.fieldView.x = 0;
    self.fieldView.y = 10;
//    CGSize maxSize = CGSizeMake(self.width, MAXFLOAT);
    
    // 创建人
    self.builderLab.x = HPVoiceMargin;
    self.builderLab.y = HPVoiceMargin;
    CGSize builderSize = [self calculateSizeWith:self.builderLab.text font:HPVoiceLabFont maxSize:CGSizeMake(self.width, MAXFLOAT)];
    self.builderLab.size = builderSize;
    
    self.buildContent.text = albumItem.nickname;
    self.buildContent.x = CGRectGetMaxX(self.builderLab.frame) + HPVoiceMargin;
    self.buildContent.y = self.builderLab.y;
    CGSize buiderContentSize = [self calculateSizeWith:albumItem.nickname font:HPVoiceLabFont maxSize:CGSizeMake(self.width - 2 * HPVoiceMargin - CGRectGetMaxX(self.builderLab.frame), MAXFLOAT)];
    self.buildContent.size = buiderContentSize;
    
    // 分享
    self.shareLab.x = HPVoiceMargin;
    self.shareLab.y = CGRectGetMaxY(self.buildContent.frame) + HPVoiceMargin;
    CGSize shareSize = [self calculateSizeWith:self.shareLab.text font:HPVoiceLabFont maxSize:CGSizeMake(self.width, MAXFLOAT)];
    self.shareLab.size = shareSize;
    
    NSString *shareStr = [NSString stringWithFormat:@"%@", albumItem.shares];
    self.shareContent.text = shareStr;
    self.shareContent.x = CGRectGetMaxX(self.shareLab.frame) + HPVoiceMargin;
    self.shareContent.y = self.shareLab.y;
    CGSize shareContentSize = [self calculateSizeWith:shareStr font:HPVoiceLabFont maxSize:CGSizeMake(self.width - 2 * HPVoiceMargin - CGRectGetMaxX(self.shareLab.frame), MAXFLOAT)];
    self.shareContent.size = shareContentSize;
    
    // 标签
    self.lab.x = HPVoiceMargin;
    self.lab.y = CGRectGetMaxY(self.shareContent.frame) + HPVoiceMargin;
    CGSize labSize = [self calculateSizeWith:self.lab.text font:HPVoiceLabFont maxSize:CGSizeMake(self.width, MAXFLOAT)];
    self.lab.size = labSize;
    
    self.labContent.text = albumItem.tags;
    self.labContent.x = CGRectGetMaxX(self.lab.frame) + HPVoiceMargin;
    self.labContent.y = self.lab.y;
    CGSize labContentSize = [self calculateSizeWith:albumItem.tags font:HPVoiceLabFont maxSize:CGSizeMake(self.width - 2 * HPVoiceMargin - CGRectGetMaxX(self.lab.frame), MAXFLOAT)];
    self.labContent.size = labContentSize;
    
    // 简介
    self.introLab.x = HPVoiceMargin;
    self.introLab.y = CGRectGetMaxY(self.labContent.frame) + HPVoiceMargin;
    CGSize introLabSize = [self calculateSizeWith:self.introLab.text font:HPVoiceLabFont maxSize:CGSizeMake(self.width, MAXFLOAT)];
    self.introLab.size = introLabSize;
    
    self.introContent.text = albumItem.intro;
    self.introContent.x = HPVoiceMargin;
    self.introContent.y = CGRectGetMaxY(self.introLab.frame);
    CGSize introContentSize = [self calculateSizeWith:albumItem.intro font:HPVoiceLabFont maxSize:CGSizeMake(self.width - 2 * HPVoiceMargin, MAXFLOAT)];
    self.introContent.size = introContentSize;
    
    
    
}

// 根据文字返回size
-(CGSize)calculateSizeWith:(NSString *)title font:(UIFont *)font maxSize:(CGSize)maxSize
{
    return [title boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : font} context:nil].size;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    self.fieldView.size = CGSizeMake(HPScreenW, self.height - HPVoiceMargin);
    self.fieldView.contentSize = CGSizeMake(self.fieldView.size.width, self.fieldView.size.height + HPVoiceMargin);
    if (CGRectGetMaxY(self.introContent.frame) > self.fieldView.size.height) {
        self.fieldView.contentSize = CGSizeMake(HPScreenW, CGRectGetMaxY(self.introContent.frame) + HPVoiceMargin);
    }
}

@end
