//
//  HPVoiceController.m
//  提升幸福感
//
//  Created by shaun on 14-7-29.
//  Copyright (c) 2014年 cn.happy. All rights reserved.
//

#import "HPVoiceController.h"
#import "XBHttpTool.h"
#import "HPCategoryParam.h"
#import "HPCategoryResult.h"
#import "HPCategoryView.h"
#import "HPCategoryTool.h"
#import "HPCategoryList.h"
#import "HPVoiceListController.h"


#define HPCollectionCellID @"cell"
#define HPCollectionMargin 10

@interface HPVoiceController ()<NSXMLParserDelegate>

@property (nonatomic, strong) NSArray *enterModels;

@end

@implementation HPVoiceController

// 懒加载
-(NSArray *)enterModels
{
    if (!_enterModels) {
        _enterModels = [NSArray array];
    }
    return _enterModels;
}

// 重写init 对collectionview进行流水布局
-(id)init
{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
//    layout.minimumInteritemSpacing = HPCollectionMargin * 2;
    layout.minimumLineSpacing = HPCollectionMargin * 2;
    layout.itemSize = CGSizeMake(90, 90);
    layout.sectionInset = UIEdgeInsetsMake(HPCollectionMargin * 2, HPCollectionMargin, HPCollectionMargin * 3, HPCollectionMargin);
    if (self = [super initWithCollectionViewLayout: layout]) {
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.collectionView.backgroundColor = [UIColor clearColor];
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:HPCollectionCellID];
    self.collectionView.scrollEnabled = YES;
    // 发送网络请求初始化数据
    [self.collectionView addHeaderWithTarget:self action:@selector(setUpData)];
    // 继承上拉刷新
    [self.collectionView headerBeginRefreshing];
}

-(void)setUpData
{
    // 创建请求参数
    HPCategoryParam *param = [[HPCategoryParam alloc] init];
    [HPCategoryTool categoryWith:param successed:^(HPCategoryResult *result) {
        self.enterModels = result.list;
        [self.collectionView reloadData];
        [self.collectionView headerEndRefreshing];
    } failure:^(NSError *error) {
        HPLog(@"请求失败：%@", error);
        [self.collectionView headerEndRefreshing];
    }];
    
}

#pragma mark- collection 数据源和代理


-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.enterModels.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:HPCollectionCellID forIndexPath:indexPath];
    
    // 取出模型
    HPCategoryList *resultModel = self.enterModels[indexPath.item];
    // 创建view
    HPCategoryView *enterView = [HPCategoryView categoryView];
    enterView.icon = resultModel.cover_path;
    enterView.title = resultModel.tname;
    [cell.contentView addSubview:enterView];
    return cell;
}

// 点击item的处理
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    HPCategoryList *list = self.enterModels[indexPath.item];
    HPVoiceListController *listController = [[HPVoiceListController alloc] init];
    listController.title = list.tname;
    [self.navigationController pushViewController:listController animated:YES];
}


@end
