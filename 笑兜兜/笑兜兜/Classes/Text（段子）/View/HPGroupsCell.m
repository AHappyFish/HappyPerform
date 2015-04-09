//
//  HPTgroupsCell.m
//  笑兜兜
//
//  Created by shaun on 14-8-1.
//  Copyright (c) 2014年 cn.happy. All rights reserved.
//

#import "HPGroupsCell.h"
#import "HPGroupsFrame.h"
#import "HPGroupsBodyView.h"
#import "HPGroupsToolbar.h"

@interface HPGroupsCell()
@property (nonatomic, weak) HPGroupsBodyView *bodyView;
@property (nonatomic, weak) HPGroupsToolbar *toolbar;
@end

@implementation HPGroupsCell

+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"groups";
    HPGroupsCell*cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[HPGroupsCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    
    return cell;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) { // 初始化子控件
        
        //1.添加正文
        HPGroupsBodyView *bodyView = [[HPGroupsBodyView alloc] init];
        //bodyView.backgroundColor = [UIColor blueColor];
        [self.contentView addSubview:bodyView];
        self.bodyView = bodyView;
        
        // 2.添加工具条
        HPGroupsToolbar *toolbar = [[HPGroupsToolbar alloc] init];
        toolbar.backgroundColor = [UIColor yellowColor];
        [self.contentView addSubview:toolbar];
        self.toolbar = toolbar;
        
        // 3.cell的设置
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void)setGroupsFrame:(HPGroupsFrame *)groupsFrame
{
    _groupsFrame = groupsFrame;
    
    // 1.具体内容的frame数据
    self.bodyView.bodyFrame= groupsFrame.bodyFrame;
   
    // 2.底部工具条的frame数据
    self.toolbar.frame = groupsFrame.toolbarFrame;

}@end
