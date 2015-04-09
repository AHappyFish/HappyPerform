//
//  HPWaterFlowViewController.m
//  笑兜兜
//
//  Created by shaun on 14-9-7.
//  Copyright (c) 2014年 cn.happy. All rights reserved.
//

#import "HPWaterFlowViewController.h"
#import "XBWaterFlowView.h"
#import "XBWaterFlowCell.h"
#import "HPPictures.h"
#import "HPThumbUrl.h"
#import "HPImageCover.h"

static NSString *urlString = @"http://i.snssdk.com/2/image/recent/?tag=comic&count=40&device_platform=iphone&channel=App%20Store&app_name=comic_gallery&device_type=iPhone%205&os_version=7.1&version_code=1.3&uuid=FFFFFFFF839763ADC43E497DA3632193FEC1C600";

//#define URL @"http://i.snssdk.com/2/image/recent/?tag=comic&count=40&device_platform=iphone&channel=App%20Store&app_name=comic_gallery&device_type=iPhone%205&os_version=7.1&version_code=1.3&uuid=FFFFFFFF839763ADC43E497DA3632193FEC1C600";

@interface HPWaterFlowViewController ()<XBWaterFlowViewDelegate, XBWaterFlowViewDataSource>
@property (nonatomic, weak) XBWaterFlowView *waterFlowView;

@property (nonatomic, strong) NSMutableArray *pictures;
@end

@implementation HPWaterFlowViewController

- (NSMutableArray *)pictures
{
    if (!_pictures) {
        
        _pictures = [NSMutableArray array];
    }
    return _pictures;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // 创建瀑布流对象
    XBWaterFlowView *waterFlowView = [[XBWaterFlowView alloc] init];
    waterFlowView.frame = self.view.bounds;
    waterFlowView.dataSource = self;
    waterFlowView.delegate = self;
    self.waterFlowView = waterFlowView;
    [self.view addSubview:waterFlowView];
    [self.waterFlowView addHeaderWithTarget:self action:@selector(loadNewPictures)];
    [self.waterFlowView addFooterWithTarget:self action:@selector(loadMorePictures)];
    // 集成上拉刷新
    [self.waterFlowView headerBeginRefreshing];
    
}

-(void)loadNewPictures
{
    AFHTTPRequestOperationManager *mgr = [AFHTTPRequestOperationManager manager];
    NSString *url = urlString;
    HPPictures *pic = [self.pictures firstObject];
    if (pic) {
        // min_behot_time=1410024977
        NSNumber *min_behot_time = pic.behot_time;
        url = [urlString stringByAppendingString:[NSString stringWithFormat:@"&min_behot_time=%@", min_behot_time]];
    }
    
    [mgr GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, NSDictionary *responseDict) {
        NSArray *datas = responseDict[@"data"];
        NSArray *pics = [HPPictures objectArrayWithKeyValuesArray:datas];
        if (pics.count) {
            
            [self.pictures insertObjects:pics atIndexes:[NSIndexSet indexSetWithIndexesInRange:NSMakeRange(0, pics.count)]];
            [self.waterFlowView reloadData];
        }else{
            [MBProgressHUD showError:@"没有新数据, 请稍后再试"];
        }
        [self.waterFlowView headerEndRefreshing];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        HPLog(@"请求失败：%@", error);
        [self.waterFlowView headerEndRefreshing];
    }];
}

-(void)loadMorePictures
{
    AFHTTPRequestOperationManager *mgr = [AFHTTPRequestOperationManager manager];
    NSString *url = urlString;
    HPPictures *pic = [self.pictures lastObject];
    if (pic) {
        NSNumber *max_behot_time = pic.behot_time;
        url = [urlString stringByAppendingString:[NSString stringWithFormat:@"&max_behot_time=%@", max_behot_time]];
    }
    [mgr GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, NSDictionary *responseDict) {
        NSMutableArray *datas = responseDict[@"data"];
        NSArray *pics = [HPPictures objectArrayWithKeyValuesArray:datas];
        if (pics.count) {
            [self.pictures addObjectsFromArray:pics];
        }
        [self.waterFlowView reloadData];
        [self.waterFlowView footerEndRefreshing];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        HPLog(@"请求失败：%@", error);
        [self.waterFlowView footerEndRefreshing];
    }];
}

#pragma mark- XBWaterFlowView数据源方法的实现
-(NSInteger)numbersOfCellInWaterFlowView:(XBWaterFlowView *)waterFlowView
{
    return self.pictures.count;
}

-(XBWaterFlowCell *)waterFlowView:(XBWaterFlowView *)waterFlowView cellAtIndex:(int)index
{
    XBWaterFlowCell *cell = [XBWaterFlowCell waterFlowCellWith:waterFlowView];
    cell.pictures = self.pictures[index];
//    cell.backgroundColor = HPRandomColor;
    return cell;
}

-(CGFloat)waterFlowView:(XBWaterFlowView *)waterFlowView heightAtIndex:(int)index
{
    HPPictures *pic = self.pictures[index];
    double scale =  [pic.middle_height doubleValue]/[pic.middle_width doubleValue] ;
    return 280/3 * scale;
}

-(NSInteger)columnsOfWaterFlowView:(XBWaterFlowView *)waterFlowView
{
    return 3;
}

-(void)waterFlowView:(XBWaterFlowView *)XBWaterFlowView didSelectCellAtIndex:(int)index
{
    // 取出对应的模型
    HPPictures *pic = self.pictures[index];
    HPImageCover *cover = [[HPImageCover alloc] init];
    CGRect tempFrame = [XBWaterFlowView cellFrameAtIndex:index];
    // 转换坐标系
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    CGRect realFrame = [XBWaterFlowView convertRect:tempFrame toView:window];
    [cover showWithCellFrame:realFrame pictures:(HPPictures *)pic];
    // 添加蒙版搞定大图
    
    
}

@end
