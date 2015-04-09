//
//  HPVideoController.m
//  提升幸福感
//
//  Created by shaun on 14-7-29.
//  Copyright (c) 2014年 cn.happy. All rights reserved.
//

#import "HPVideoController.h"
#import "HPHomeVideo.h"
#import "HPHomeViedoCell.h"
#import "HPSeasonController.h"

#define MAXNum 114

@interface HPVideoController ()

@property (nonatomic, strong) NSMutableArray *homeVideos;


@end

@implementation HPVideoController

- (NSMutableArray *)homeVideos
{
    if (_homeVideos == nil) {
        _homeVideos = [NSMutableArray array];
    }
    return _homeVideos;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // 设置导航栏按钮
    
    [self loadHomeViedos];
    
    [self.tableView addFooterWithTarget:self action:@selector(loadMoreHomeViedos)];
}



- (void)friendSearch
{
    NSLog(@"最近浏览---");
}


/**
 *  集成刷新控件
 */
- (void)setupRefresh
{
    // 1.添加下拉刷新控件
    UIRefreshControl *refreshControl = [[UIRefreshControl alloc] init];
    [self.tableView addSubview:refreshControl];
    
    // 2.监听状态
    [refreshControl addTarget:self action:@selector(refreshControlStateChange:) forControlEvents:UIControlEventValueChanged];
    
    // 3.让刷新控件自动进入刷新状态
    [refreshControl beginRefreshing];
    
    // 4.加载数据
    [self refreshControlStateChange:refreshControl];
    
//    // 5.添加上拉加载更多控件
//    HMLoadMoreFooter *footer = [HMLoadMoreFooter footer];
//    self.tableView.tableFooterView = footer;
//    self.footer = footer;
}
/**
 *  当下拉刷新控件进入刷新状态（转圈圈）的时候会自动调用
 */
- (void)refreshControlStateChange:(UIRefreshControl *)refreshControl
{
    [self loadNewVideos:refreshControl];
}

- (void)loadNewVideos:(UIRefreshControl *)refreshControl
{
    HPLog(@"刷新的是最后一季的最新视频");
}

- (void)loadHomeViedos
{
    [MBProgressHUD showMessage:@"loading......"];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    NSString *strGet = @"http://gaoxiaoshipin.sinaapp.com/index.php/Index_v328/cate/sort/asc";
    [manager GET:strGet parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {

        NSArray *array = responseObject;

        NSArray *homeVideos = [HPHomeVideo objectArrayWithKeyValuesArray:array];
        
        //HPLog(@"%d", homeVideos.count);
        
        NSRange range = NSMakeRange(0, homeVideos.count);
        NSIndexSet *indexSet = [NSIndexSet indexSetWithIndexesInRange:range];
        [self.homeVideos insertObjects:homeVideos atIndexes:indexSet];
        
        [self.tableView reloadData];
        [MBProgressHUD hideHUD];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        //
        [MBProgressHUD hideHUD];
        
        [MBProgressHUD showError:@"服务器繁忙,请稍后再试!"];
    }];
}

- (void)loadMoreHomeViedos
{
    if (self.homeVideos.count == MAXNum + 1) {
        [self.tableView footerEndRefreshing];
        [MBProgressHUD showError:@"已经刷到最新季!!!(No More New Seasons!!)"];
    }
    /**
     *  ＊	＊＊＊＊＊＊＊＊＊＊＊＊
     URL: http://gaoxiaoshipin.sinaapp.com/index.php/Index_v328/cate/lastId/30/sort/asc
     http://gaoxiaoshipin.sinaapp.com/index.php/Index_v328/cate/lastId/61/sort/asc
     http://gaoxiaoshipin.sinaapp.com/index.php/Index_v328/cate/lastId/91/sort/asc
     */
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    NSString *strGet = [NSString stringWithFormat:@"http://gaoxiaoshipin.sinaapp.com/index.php/Index_v328/cate/lastId/%d/sort/asc", self.homeVideos.count];
    [manager GET:strGet parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSArray *array = responseObject;
        
        NSArray *homeVideos = [HPHomeVideo objectArrayWithKeyValuesArray:array];
        
        HPLog(@"%d", homeVideos.count);
        
        [self.homeVideos addObjectsFromArray:homeVideos];
        
        [self.tableView reloadData];
        
        [self.tableView footerEndRefreshing];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        //
        HPLog(@"%@", error);
    }];
}

#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.homeVideos.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    HPHomeViedoCell *cell = [HPHomeViedoCell cellWithTableView:tableView];
    
    cell.homeVideo = self.homeVideos[indexPath.row];
    
    return cell;
}


#pragma mark - TableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    HPSeasonController *newVc = [[HPSeasonController alloc] init];
    
    HPHomeVideo *homeVideo = self.homeVideos[indexPath.row];
    newVc.homeVideo = homeVideo;

    [self.navigationController pushViewController:newVc animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}

@end
