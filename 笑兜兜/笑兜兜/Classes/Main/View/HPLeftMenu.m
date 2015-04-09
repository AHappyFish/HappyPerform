//
//  HPLeftMenu.m
//  笑兜兜
//
//  Created by shaun on 14-9-1.
//  Copyright (c) 2014年 cn.happy. All rights reserved.
//

#import "HPLeftMenu.h"
#import "SDImageCache.h"
#import "HMCommonLabelItem.h"
#import "NSString+File.h"
#import "HMCommonGroup.h"
#import "HMCommonItem.h"
#import "HMCommonArrowItem.h"
#import "HMCommonSwitchItem.h"


@interface HPLeftMenu ()

@property (nonatomic, strong) NSMutableArray *groups;

@property (nonatomic ,strong) HMCommonArrowItem *clearCache;


@end

@implementation HPLeftMenu

-(NSMutableArray *)groups
{
    if (!_groups) {
        
        _groups = [NSMutableArray array];
    }
    return _groups;
}

-(id)init
{
    return [self initWithStyle:UITableViewStyleGrouped];
}

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tableView.backgroundColor = [UIColor clearColor];
    CGFloat margin = 30;
    self.tableView.x = 0;
    self.tableView.y = margin;
    self.tableView.height = self.view.height - 2 * margin;;
    self.tableView.width = 240;
    
    [self setupGroup0];
    [self setupGroup1];   
}

- (void)setupGroup0
{
    // 1.创建组
    HMCommonGroup *group = [HMCommonGroup group];
    group.header = @"设置";
    [self.groups addObject:group];
    
    // 2.设置组的所有行数据
    HMCommonSwitchItem *readMdoe = [HMCommonSwitchItem itemWithTitle:@"夜间模式"];
    
    group.items = @[readMdoe];
}

- (void)setupGroup1
{
    // 1.创建组
    HMCommonGroup *group = [HMCommonGroup group];
    group.header = @"其他";
    [self.groups addObject:group];
    // 2.设置组的所有行数据
    HMCommonArrowItem *clearCache = [HMCommonArrowItem itemWithTitle:@"清除图片缓存"];
    _clearCache = clearCache;
   
    _clearCache.subtitle = [self getCacheSize];
    
    __weak typeof(_clearCache) weakClearCache = _clearCache;
    __weak typeof(self) weakVc = self;
    _clearCache.operation = ^{
        [MBProgressHUD showMessage:@"正在清除缓存...."];
        // 清除缓存
        [[SDImageCache sharedImageCache] cleanDisk];
        weakClearCache.subtitle = @"0k";
        // 刷新表格
        [weakVc.tableView reloadData];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [MBProgressHUD hideHUD];
        });
    };
    if (_clearCache == nil) {
        return;
    }
    group.items = @[_clearCache];
}

- (NSString *)getCacheSize
{
    
    double fileSize = [[SDImageCache sharedImageCache] getSize]/1024.0;
    NSString *cacheStr = [NSString string];
    if (fileSize > 1000) {
        cacheStr = [NSString stringWithFormat:@"%.2fM",fileSize/1024.0];
    }else{
        cacheStr = [NSString stringWithFormat:@"%.2fK",fileSize];
    }
    return cacheStr;
}


-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    HMCommonGroup *group = self.groups[section];
    return group.header;
}


@end
