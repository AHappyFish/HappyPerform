//
//  HPTextController.m
//  提升幸福感
//
//  Created by shaun on 14-7-29.
//  Copyright (c) 2014年 cn.happy. All rights reserved.
//

#import "HPTextController.h"
#import "XBHttpTool.h"
#import "MJExtension.h"
#import "UIImageView+WebCache.h"
#import "HPDatas.h"
#import "HPGroup.h"
#import "HPData.h"
#import "HPUser.h"
#import "HPDataDetail.h"
#import "HPGroupsView.h"
#import "HPGroupsFrame.h"
#import "HPGroupParam.h"
#import "HPDetailTextController.h"
#import "MJRefresh.h"


@interface HPTextController ()//<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) NSMutableArray *GroupsFrames;

@end

@implementation HPTextController

- (void)viewDidLoad
{
    [super viewDidLoad];
    //[MBProgressHUD showMessage:@"正在拼命加载中" toView:self.view];
    self.tableView.backgroundColor = HPColor(211, 211, 211);
     self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self loadNewGroup];
    
    [self.tableView addFooterWithTarget:self action:@selector(loadMoreGroup)];
    
}

  /* 下拉刷新更新 */
- (void)loadNewGroup
{
      __weak HPTextController *temp = self;
    [self.tableView addHeaderWithCallback:^{
        [temp setUpNewDataRequest];
        
    }];
    
    [self.tableView headerBeginRefreshing];
}

  /*  上拉加载更多  */
- (void)loadMoreGroup
{
    __weak HPTextController *temp = self;
    [self.tableView addFooterWithCallback:^{
        [temp setUpMoreDataRequest];
    }];
    [self.tableView footerEndRefreshing];
}

- (NSMutableArray *)GroupsFrames
{
    if (!_GroupsFrames) {
        _GroupsFrames = [NSMutableArray array];
//        [self setUpDataRequest];
    }
    return _GroupsFrames;
}

- (NSArray *)GroupsFramesWithGroups:(NSArray *)groups
{
//    NSMutableArray *groupsFrames = [NSMutableArray array];
    NSMutableArray *arrM = [NSMutableArray array];
    for (HPDataDetail *detail in groups) {
        HPGroupsFrame *groupsFrame = [[HPGroupsFrame alloc]init];
        groupsFrame.group = detail.group;
        
        [arrM addObject:groupsFrame];
    }
//    NSRange range = NSMakeRange(0, arrM.count);
//    NSIndexSet *indexSet = [NSIndexSet indexSetWithIndexesInRange:range];
//    [self.GroupsFrames insertObjects:arrM atIndexes:indexSet];
    return arrM;
}

-(void)setUpMoreDataRequest
{
    NSString *url = @"http://ic.snssdk.com/2/essay/zone/category/data";
    
    HPGroupsFrame *gf = [self.GroupsFrames lastObject];
    
    HPGroupParam *param = [[HPGroupParam alloc] init];
    if (gf) {
        HPGroup *grp = gf.group;
        param.max_time = grp.create_time;
    }
    
    NSDictionary *dictParam = [param keyValues];
    
    [XBHttpTool Get:url params:dictParam success:^(NSDictionary *repsonseDict) {
        [MBProgressHUD hideHUDForView:self.view animated:YES];
        
        HPData *data = [HPData objectWithKeyValues:repsonseDict];
        HPDatas *datas = data.data;
        
        NSArray *arr =  [self GroupsFramesWithGroups:datas.data];
//        NSRange range = NSMakeRange(0, arr.count);
//        NSIndexSet *indexSet = [NSIndexSet indexSetWithIndexesInRange:range];


        [self.GroupsFrames addObjectsFromArray:arr];
        [self.tableView reloadData];
        [self.tableView footerEndRefreshing];
    } failure:^(NSError *error) {
        [MBProgressHUD hideHUDForView:self.view animated:YES];
        [self.tableView footerEndRefreshing];
        
    }];
    
}


-(void)setUpNewDataRequest
{
    NSString *url = @"http://ic.snssdk.com/2/essay/zone/category/data";

    HPGroupsFrame *gf = [self.GroupsFrames firstObject];
    HPGroupParam *param = [[HPGroupParam alloc] init];
    if (gf) {
        HPGroup *grp = gf.group;
        param.min_time = grp.create_time;
    }
    
    NSDictionary *dictParam = [param keyValues];
    
    [XBHttpTool Get:url params:dictParam success:^(NSDictionary *repsonseDict) {
        [MBProgressHUD hideHUDForView:self.view animated:YES];
        
        HPData *data = [HPData objectWithKeyValues:repsonseDict];
        HPDatas *datas = data.data;
        
        NSArray *arr =  [self GroupsFramesWithGroups:datas.data];
        NSRange range = NSMakeRange(0, arr.count);
        NSIndexSet *indexSet = [NSIndexSet indexSetWithIndexesInRange:range];
        [self.GroupsFrames insertObjects:arr atIndexes:indexSet];
        [self.tableView reloadData];
        [self.tableView headerEndRefreshing];
        
    } failure:^(NSError *error) {
          [MBProgressHUD hideHUDForView:self.view animated:YES];
        [self.tableView headerEndRefreshing];

    }];
    
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.GroupsFrames.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    HPGroupsView *cell = [HPGroupsView  cellWithTableView:tableView];
    cell.groupsFrame = self.GroupsFrames[indexPath.row];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    HPGroupsFrame *groupsFrame = self.GroupsFrames[indexPath.row];
    return groupsFrame.cellHeight;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//    HPDetailTextController *detail = [[HPDetailTextController alloc] init];
//    HPGroupsFrame *frame = self.GroupsFrames[indexPath.row];
//    detail.group = frame.group; 
//    detail.title = @"内涵段子";
//    [self.navigationController pushViewController:detail animated:YES];
}

@end
