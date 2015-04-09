//
//  HPVoiceStatusController.m
//  笑兜兜
//
//  Created by shaun on 14-8-7.
//  Copyright (c) 2014年 cn.happy. All rights reserved.
//

#import "HPVoiceStatusController.h"
#import "HPEntertainmentList.h"
#import "HPVoiceStatusRequestTool.h"
#import "HPVoiceStatusHeaderView.h"
#import "HPVoiceAlbum.h"
#import "HPVoiceAlbumItem.h"
#import "HPVoiceTrackList.h"
#import "HPVoiceTracks.h"
#import "HPStatusItemCell.h"
#import "HPPlayingMusicController.h"
#import "HPStatusSectionTabView.h"
#import "HPStatusIntroCell.h"
#import "HPManagerMusicTool.h"

@interface HPVoiceStatusController ()<HPStatusSectionTabViewDelegate>
@property (nonatomic, strong) HPStatusSectionTabView *tabbar;

// 大字典
@property (nonatomic, strong) NSMutableDictionary *voiceItems;
// 简介的数组
@property (nonatomic, strong) NSMutableArray *introCells;
// 展示数组
@property (nonatomic, strong) NSArray *showCells;
// 数据展示数组
@property (nonatomic, strong) NSArray *listCells;
// 专辑数组
@property (nonatomic, strong) NSArray *relateCells;
// 变量来记录当前点击的按钮
@property (nonatomic, assign) int buttonType;
// 播放view
@property (nonatomic, strong) HPPlayingMusicController *playingView;

@end

@implementation HPVoiceStatusController

-(NSMutableDictionary *)voiceItems
{
    if (!_voiceItems) {
        _voiceItems = [NSMutableDictionary dictionary];
    }
    return _voiceItems;
}

-(NSArray *)showCells
{
    if (!_showCells) {
        _showCells = [NSArray array];
    }
    return _showCells;
}

-(NSMutableArray *)introCells
{
    if (!_introCells) {
        _introCells = [NSMutableArray array];
    }
    return _introCells;
}

-(NSArray *)listCells
{
    if (!_listCells) {
        _listCells = [NSArray array];
    }
    return _listCells;
}

-(NSArray *)relateCells
{
    if (!_relateCells) {
        _relateCells = [NSArray array];
    }
    return _relateCells;
}

-(HPStatusSectionTabView *)tabbar
{
    if (!_tabbar) {
        // 设置组的头部视图
        HPStatusSectionTabView *tabbar = [[HPStatusSectionTabView alloc] init];
        tabbar.delegate = self;
        self.tabbar = tabbar;
    }
    return _tabbar;
}

-(void)setButtonType:(int)buttonType
{
    _buttonType = buttonType;
    [self.tableView reloadData];
}
-(HPPlayingMusicController *)playingView
{
    if (!_playingView) {
        _playingView = [[HPPlayingMusicController alloc] init];
    }
    return _playingView;
}
-(void)viewDidLoad
{
    [super viewDidLoad];
    self.title = self.list.title;
    
    // 设置头部视图
    HPVoiceStatusHeaderView *headV = [[HPVoiceStatusHeaderView alloc] init];
    headV.image = [UIImage imageNamed:@"bg_albumView_header"];
    headV.contentMode = UIViewContentModeBottom;
    headV.frame = CGRectMake(0, 0, self.view.width, 120);
    self.tableView.tableHeaderView = headV;
    self.tableView.backgroundColor = HPColor(224, 224, 224);
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.navigationController.navigationBar.backgroundColor = HPColorAlpha(240, 244, 241, 0.4);
    
    // 设置默认显示为音频列表
    self.buttonType = HPStatusSectionButtonTypeList;
}


-(void)setList:(HPEntertainmentList *)list
{
    _list = list;
    // 拿到id拼接请求url，发送请求
    NSString *urlString = [NSString stringWithFormat:@"http://mobile.ximalaya.com/mobile/others/ca/album/track/%@/true/1/30?device=iPhone", list.id];
    [HPVoiceStatusRequestTool voiceStatusWithUrl:urlString successed:^(HPVoiceAlbum *album) {
        HPVoiceAlbum *alm = album;
        // 初始化数据
        [self setUpdatasWith:alm];
    } failure:^(NSError *error) {
        HPLog(@"请求失败：%@", error);
    }];
}

-(void)setUpdatasWith:(HPVoiceAlbum *)alm
{
    HPVoiceTracks *tracks = alm.tracks;
    
    // cell 列表
    self.listCells = tracks.list;
    HPManagerMusicTool *musicTool = [[HPManagerMusicTool alloc] init];
    musicTool.musicLists = self.listCells;
    [self.voiceItems setObject:self.listCells forKey:@(HPStatusSectionButtonTypeList)];
    
    // 简介
    HPVoiceAlbumItem *albumIntro = alm.album;
    [self.introCells addObject:albumIntro];
    [self.voiceItems setObject:self.introCells forKey:@(HPStatusSectionButtonTypeIntro)];
    
    // 专辑
    [self.voiceItems setObject:self.relateCells forKey:@(HPStatusSectionButtonTypeRelate)];
    [self.tableView reloadData];
}

#pragma mark- tablview数据源方法
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // 取出字典中对应的要显示的数组
    self.showCells = self.voiceItems[@(self.buttonType)];
    return self.showCells.count;
}

// 每个cell要展示的数据
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    int statusButtonType = self.buttonType;
    if (statusButtonType == HPStatusSectionButtonTypeIntro) {
        HPVoiceAlbumItem *albumItem = self.showCells[indexPath.row];
        HPStatusIntroCell *cell = [HPStatusIntroCell cellWithTableView:tableView];
        cell.albumItem = albumItem;
        return cell;
    }else if (statusButtonType == HPStatusSectionButtonTypeList){
        HPStatusItemCell *cell = [HPStatusItemCell cellWithTableView:tableView];
        cell.track = self.showCells[indexPath.row];
        return cell;
    
    }else if(statusButtonType == HPStatusSectionButtonTypeRelate){
        UITableViewCell *cell = [[UITableViewCell alloc] init];
        return cell;
    }
    UITableViewCell *cell = [[UITableViewCell alloc] init];
    return cell;
}


// section的头部视图
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    return self.tabbar;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 34;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.buttonType == HPStatusSectionButtonTypeIntro) {
        return HPScreenH - 218;
    }else if (self.buttonType == HPStatusSectionButtonTypeList){
        return 95;
    }else if(self.buttonType == HPStatusSectionButtonTypeRelate){
        return 44;
    };
    return 44;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 取消选中
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    // 拿出对应的数据
    HPVoiceTrackList *track = [[HPVoiceTrackList alloc] init];
    track = self.showCells[indexPath.row];
    // 设置正在播放的歌曲
    [HPManagerMusicTool sharedMusicTool].playingMusicId = track.trackId;
    // 弹出播放界面
    [self.playingView show];
}


#pragma mark- tab代理方法
-(void)statusSection:(HPStatusSectionTabView *)sectionTabView TabClick:(HPStatusSectionButtonType)statusButtonType
{
    if (statusButtonType == HPStatusSectionButtonTypeIntro) {
        self.buttonType = HPStatusSectionButtonTypeIntro;
    }else if (statusButtonType == HPStatusSectionButtonTypeList){
        self.buttonType = HPStatusSectionButtonTypeList;
    }else if(statusButtonType == HPStatusSectionButtonTypeRelate){
        self.buttonType = HPStatusSectionButtonTypeRelate;
    }
}



@end
