//
//  HPStatusListController.m
//  笑兜兜
//
//  Created by shaun on 14-8-6.
//  Copyright (c) 2014年 cn.happy. All rights reserved.
//

#import "HPVoiceListController.h"
#import "HPEntertainmentTool.h"
#import "HPEntertainmentParam.h"
#import "HPEntertainmentResult.h"
#import "HPEntertainmentList.h"
#import "UIImageView+WebCache.h"
#import "XBHttpTool.h"
#import "HPStatusListCell.h"
#import "HPVoiceStatusController.h"

@interface HPVoiceListController ()

@property (nonatomic, strong) NSArray *statusList;

@end

@implementation HPVoiceListController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // tableview的设置
    self.tableView.rowHeight = 100;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
//    self.tableView.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"leftbg"]];
    self.tableView.backgroundColor = HPColor(224, 224, 224);
    self.navigationController.navigationBar.backgroundColor = HPColor(240, 244, 241);

    [self.tableView headerBeginRefreshing];
    [self.tableView addHeaderWithCallback:^{
       
    }];
    
    // 加载数据
    [self loadList];
    
}

-(void)loadList
{
    // 请求参数
    HPEntertainmentParam *param = [[HPEntertainmentParam alloc] init];
    param.tag_name = self.title;
    [HPEntertainmentTool entertainmentWith:param successed:^(HPEntertainmentResult *result) {
        self.statusList = result.list;
        [self.tableView reloadData];
        [self.tableView headerEndRefreshing];
    } failure:^(NSError *error) {
        HPLog(@"请求失败--%@", error);
        [self.tableView headerEndRefreshing];
    }];
}


#pragma mark  dataSource数据源方法


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.statusList.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    HPStatusListCell *cell = [HPStatusListCell cellWithTableView:tableView];
    // 设置数据
    HPEntertainmentList *list = self.statusList[indexPath.row];
    cell.statuslist = list;
    return cell;
}

// 点击
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    HPEntertainmentList *list = self.statusList[indexPath.row];
    // 不同的请求只和请求参数的id又关系
    HPVoiceStatusController *statusController = [[HPVoiceStatusController alloc] init];
    statusController.list = list;
    [self.navigationController pushViewController:statusController animated:YES];
    
}

@end
