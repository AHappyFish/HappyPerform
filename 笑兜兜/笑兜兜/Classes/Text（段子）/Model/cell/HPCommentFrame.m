//
//  HPCommentFrame.m
//  笑兜兜
//
//  Created by shaun on 14-8-15.
//  Copyright (c) 2014年 cn.happy. All rights reserved.
//

#import "HPCommentFrame.h"
#import "HPComment.h"
@implementation HPCommentFrame
- (void)setComment:(HPComment *)comment
{
    _comment = comment;
    
    // 1.头像
    CGFloat iconX = 10;
    CGFloat iconY = 10;
    CGFloat iconW = 30;
    CGFloat iconH = 30;
    self.iconFrame = CGRectMake(iconX, iconY, iconW, iconH);
    
    // 2.昵称
    CGFloat nameX = CGRectGetMaxX(self.iconFrame) + 10;
    CGFloat nameY = iconY + 5;
    
    CGSize maxNameSize = CGSizeMake(MAXFLOAT-10, MAXFLOAT-10);
    NSDictionary *nameDict = @{NSFontAttributeName: HPGroupNameFont};
    
    CGSize nameSize = [comment.user_name boundingRectWithSize:maxNameSize options:NSStringDrawingUsesLineFragmentOrigin attributes:nameDict context:nil].size;
    self.nameFrame = (CGRect){{nameX, nameY}, nameSize};
    
    // 3.正文
    CGFloat contentX = iconX;
    CGFloat contentY = CGRectGetMaxY(self.iconFrame) + 10;
    CGFloat maxW = 320 - 2 * contentX;
    CGSize maxSize = CGSizeMake(maxW, MAXFLOAT);
    NSDictionary *dict = @{NSFontAttributeName: HPGroupContentFont};
    CGSize contentSize = [comment.text boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil].size;
    self.textFrame = (CGRect){{contentX, contentY}, contentSize};
    
    // 自己
    CGFloat x = 0;
    CGFloat y = 10;
    CGFloat w = 320;
    CGFloat h = CGRectGetMaxY(self.textFrame) + 10;
    //    CGFloat h  = CGRectGetMaxY(self.contentFrame) +10;
    self.frame = CGRectMake(x, y, w, h);
}


@end
