//
//  HPSeasonToolbar.m
//  笑兜兜
//
//  Created by dyf on 14-8-10.
//  Copyright (c) 2014年 cn.happy. All rights reserved.
//

#import "HPSeasonToolbar.h"
#import "HPSeasonStatus.h"

@interface HPSeasonToolbar ()

@property (nonatomic, weak) UILabel *timeLabel;

@end

@implementation HPSeasonToolbar

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        UILabel *timeLabel = [[UILabel alloc] init];
        timeLabel.font = [UIFont systemFontOfSize:11.0];
        timeLabel.textColor = [UIColor blueColor];
        
        [self addSubview:timeLabel];
        self.timeLabel = timeLabel;
    }
    return self;
}

- (void)setSeasonStatus:(HPSeasonStatus *)seasonStatus
{
    _seasonStatus = seasonStatus;
    
    self.timeLabel.text = seasonStatus.cTime;
    self.timeLabel.textAlignment = NSTextAlignmentLeft;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat tLX = CsyJokeMargin * 0.5;
    CGFloat tLY = 0;
    CGFloat tLH = self.height;
    CGFloat tLW = self.width * 0.4;
    
    self.timeLabel.frame = CGRectMake(tLX, tLY, tLW, tLH);
}

@end
