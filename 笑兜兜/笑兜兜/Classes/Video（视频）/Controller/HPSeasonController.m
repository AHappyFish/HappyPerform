//
//  HPSeasonController.m
//  笑兜兜
//
//  Created by dyf on 14-8-8.
//  Copyright (c) 2014年 cn.happy. All rights reserved.
//

#import "HPSeasonController.h"
#import "HPSeasonStatus.h"
#import "HPSeasonCell.h"
#import "HPSeasonStatusFrame.h"
#import "HPHomeVideo.h"
#import <AVFoundation/AVFoundation.h>
#import <MediaPlayer/MediaPlayer.h>

#define HPInsertOfSeason self.homeVideo.id
#define HPCountOfSeason [self.homeVideo.info intValue]
#define HPLastID [[[self.seasonStatusFrames lastObject] seasonStatus] news_id]

@interface HPSeasonController () <HPSeasonCellDelegate>

@property (nonatomic, strong) MPMoviePlayerController *player;
@property (nonatomic, strong) NSMutableArray *seasonStatusFrames;

@property (nonatomic, assign) int page;

@end

@implementation HPSeasonController



- (NSMutableArray *)seasonStatusFrames
{
    if (_seasonStatusFrames == nil) {
        _seasonStatusFrames = [NSMutableArray array];
    }
    return _seasonStatusFrames;
}
- (NSArray *)seasonStatusFramesWithStatuses:(NSArray *)seasonStatuses
{
    NSMutableArray *frames = [NSMutableArray array];
    for (HPSeasonStatus *seasonStatus in seasonStatuses) {
        HPSeasonStatusFrame *frame = [[HPSeasonStatusFrame alloc] init];
        // 传递微博模型数据，计算所有子控件的frame
        frame.seasonStatus = seasonStatus;
        [frames addObject:frame];
    }
    return frames;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = self.homeVideo.name;
    
    [self loadSeasonStatuses];
    
    [self.tableView addFooterWithTarget:self action:@selector(loadMoreSeasonStatuses)];
}


- (void)loadSeasonStatuses
{
    [MBProgressHUD showMessage:@"loading......"];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    //NSString *insertOfSeason = [self.title substringWithRange:NSMakeRange(1, 1)];
    NSString *strOfUrl = [NSString stringWithFormat:@"http://gaoxiaoshipin.sinaapp.com/index.php/Index_v328/index/type/0/cateId/%@", HPInsertOfSeason];
    
    [manager GET:strOfUrl parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSArray *array = responseObject;
        
        // 返回的字典数组数据转成模型数据数组
        NSArray *seasonStatuses = [HPSeasonStatus objectArrayWithKeyValuesArray:array];
        NSArray *seasonStatusFrames = [self seasonStatusFramesWithStatuses:seasonStatuses];
        
        NSRange range = NSMakeRange(0, seasonStatuses.count);
        
        NSIndexSet *indexSet = [NSIndexSet indexSetWithIndexesInRange:range];
        //[self.seasonStatuses insertObjects:seasonStatuses atIndexes:indexSet];
        [self.seasonStatusFrames insertObjects:seasonStatusFrames atIndexes:indexSet];
        
        [self.tableView reloadData];
        [MBProgressHUD hideHUD];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        //
        [MBProgressHUD hideHUD];
        [MBProgressHUD showError:@"error!!!"];
    }];
}

- (void)loadMoreSeasonStatuses
{
    if (self.seasonStatusFrames.count >= HPCountOfSeason) {
        [self.tableView footerEndRefreshing];
        [MBProgressHUD showError:@"NO MORE!!"];
        return;
    }
    self.page = 1;
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSString *strGet = [NSString stringWithFormat:@"http://gaoxiaoshipin.sinaapp.com/index.php/Index_v328/index/type/0/cateId/%@/lastId/%@/page/%d", HPInsertOfSeason, HPLastID, self.page];
    [manager GET:strGet parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSArray *array = responseObject;
        
        NSArray *seasonStatuses = [HPSeasonStatus objectArrayWithKeyValuesArray:array];
        NSArray *seasonStatusFrames = [self seasonStatusFramesWithStatuses:seasonStatuses];
        
        
        [self.seasonStatusFrames addObjectsFromArray:seasonStatusFrames];
        
//        [self.seasonStatuses enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
//            //
//        }];
        
        [self.tableView reloadData];
        self.page++;
        
        [self.tableView footerEndRefreshing];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        //
        [MBProgressHUD showError:@"服务器繁忙,请稍后再试!!"];
    }];
}
/**
 ---------------------第一季加载更多时候的数据:
 URL: http://gaoxiaoshipin.sinaapp.com/index.php/Index_v328/index/type/0/cateId/1/lastId/79/page/1
 http://gaoxiaoshipin.sinaapp.com/index.php/Index_v328/index/type/0/cateId/1/lastId/61/page/2
 http://gaoxiaoshipin.sinaapp.com/index.php/Index_v328/index/type/0/cateId/1/lastId/42/page/3
 http://gaoxiaoshipin.sinaapp.com/index.php/Index_v328/index/type/0/cateId/1/lastId/21/page/4
 
 http://gaoxiaoshipin.sinaapp.com/index.php/Index_v328/index/type/0/cateId/1/lastId/8/page/5
 (上面 page5无数据)
 */


#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.seasonStatusFrames.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    HPSeasonCell *cell = [HPSeasonCell cellWithTableView:tableView];
    
    cell.seasonStatusFrame = self.seasonStatusFrames[indexPath.row];
    cell.delegate = self;
    
    return cell;
}
#pragma mark - TableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    HPSeasonStatusFrame *frame = self.seasonStatusFrames[indexPath.row];
    return frame.cellHight;
}

#pragma mark - HPSeasonCellDelegate
- (void)openViedoOfCellWithUrl:(NSURL *)url
{
   
    
    
//    self.player.view.frame = CGRectMake(10, 50, 300, 100);
//    
//    self.player.contentURL = url;
//    
//    [self.view addSubview:self.player.view];
#warning 待完善
//    UIViewController *vc = [[UIViewController alloc] init];
//    vc.title = @"test";
    MPMoviePlayerViewController *mpVc = [[MPMoviePlayerViewController alloc] initWithContentURL:url];
    [self presentMoviePlayerViewControllerAnimated:mpVc];
}

@end
