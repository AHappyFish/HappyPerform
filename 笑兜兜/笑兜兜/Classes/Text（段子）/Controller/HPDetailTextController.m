//
//  HPDetailTextController.m
//  笑兜兜
//  Created by shaun on 14-8-8.
//  Copyright (c) 2014年 cn.happy. All rights reserved.
//

#import "HPDetailTextController.h"
#import "HPGroupsFrame.h"
#import "HPGroupsToolbar.h"
#import "HPGroupsToolbarFrame.h"
#import "HPGroupsView.h"
#import "UIView+Extension.h"
#import "XBHttpTool.h"
#import "HPCommentData.h"
#import "HPCommentDatas.h"
#import "HPComment.h"
#import "MBProgressHUD+MJ.h"
#import "HPGroupsBodyView.h"
#import "HPGroupsBodyFrame.h"

@interface HPDetailTextController () <UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,weak) UITableView *tableView;
@property (nonatomic ,strong) NSArray *comments;

@end

@implementation HPDetailTextController

- (void)viewDidLoad
{
    self.view.backgroundColor = [UIColor grayColor];
    [super viewDidLoad];
    
    [self setupTableview];
    [self setupDetailGroup];
    [self setupBottomToolbar];
    [self loadComments];
    
}

- (void)loadComments
{
    NSString *url = @"http://isub.snssdk.com/2/data/get_essay_comments/?iid=2267271383&group_id=3445066070&sort=hot&count=20&device_id=2703281351&offset=0&tag=joke&ac=wifi&channel=App%20Store&app_name=joke_essay&version_code=2.7.1&device_platform=iphone&os_version=7.1";
    [XBHttpTool Get:url params:nil success:^(NSDictionary *repsonseDict) {
        HPCommentData *data = [HPCommentData objectWithKeyValues:repsonseDict];
        HPCommentDatas *datas = data.data;
        self.comments = datas.recent_comments;
        [self.tableView reloadData];
    } failure:^(NSError *error) {
        [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
    }];
}

- (void)setupTableview
{
    UITableView *tableView = [[UITableView alloc]init];
    tableView.width = self.view.width;
    tableView.height = self.view.height- 35;
    tableView.backgroundColor = [UIColor grayColor];
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    tableView.delegate = self;
    tableView.dataSource  = self;
    [self.view addSubview:tableView];
    self.tableView = tableView;
}

- (void)setupDetailGroup
{
    HPGroupsBodyView *detailView = [[HPGroupsBodyView alloc]init];
    HPGroupsBodyFrame *detailFrame = [[HPGroupsBodyFrame alloc] init];
    detailFrame.group = self.group;
    detailView.bodyFrame = detailFrame;
    self.tableView.tableHeaderView = detailView;
}

- (void)setupBottomToolbar
{
    HPGroupsToolbar *toobar = [[HPGroupsToolbar alloc] init];
    toobar.y = CGRectGetMaxY(self.tableView.frame);
    toobar.height = self.view.height- self.tableView.height;
    toobar.width = self.view.width;
    [self.view addSubview:toobar];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.comments.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static  NSString *ID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    HPComment *comment = self.comments[indexPath.row];
    cell.textLabel.text = comment.user_name;
    cell.textLabel.font = [UIFont systemFontOfSize:13];
    cell.detailTextLabel.text = comment.text;
    cell.detailTextLabel.backgroundColor = [UIColor redColor];
    cell.detailTextLabel.font = [UIFont systemFontOfSize:14];
    NSString *imgUrl = comment.user_profile_image_url;
    [cell.imageView setImageWithURLString:imgUrl placeholderImage:[UIImage imageNamed:@"avatar_default_small"]];
    
    return cell;
}

@end
