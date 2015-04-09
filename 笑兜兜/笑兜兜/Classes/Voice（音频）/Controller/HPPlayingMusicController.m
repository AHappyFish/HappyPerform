//
//  HPPlayingHeaderController.m
//  笑兜兜
//
//  Created by shaun on 14-8-10.
//  Copyright (c) 2014年 cn.happy. All rights reserved.
//

#import "HPPlayingMusicController.h"
#import <AVFoundation/AVFoundation.h>
#import "HPPlayingVoiceParam.h"
#import "HPPlayingVoiceResults.h"
#import "HPMediaFile.h"
#import "UIImageView+WebCache.h"
#import "HPManagerMusicTool.h"
#import "HPPlayingMusicTool.h"

#define HPStreamStatus @"status"
#define HPStreambufferingRatio @"bufferingRatio"

@interface HPPlayingMusicController ()

@property (weak, nonatomic) IBOutlet UIImageView *bigImageView;
@property (weak, nonatomic) IBOutlet UIImageView *midImageView;
@property (weak, nonatomic) IBOutlet UILabel *tagsLabel;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIScrollView *tagsScrollView;
@property (weak, nonatomic) IBOutlet UIScrollView *titlescrollView;

@property (weak, nonatomic) IBOutlet UIView *prograssBg;
@property (weak, nonatomic) IBOutlet UIView *cachePrograss;
@property (weak, nonatomic) IBOutlet UIView *playPrograss;
@property (weak, nonatomic) IBOutlet UIButton *sliderBtn;
@property (weak, nonatomic) IBOutlet UIButton *playOrPauseBtn;
@property (weak, nonatomic) IBOutlet UILabel *currentTimeLabel;
@property (weak, nonatomic) IBOutlet UILabel *durationLabel;

- (IBAction)backClick;
- (IBAction)playOrPauseClick;
- (IBAction)preMusicClick;
- (IBAction)nextMusciClick;

/** 数据结果 */
@property (nonatomic, strong) HPPlayingVoiceResults *musicResult;
@property (nonatomic, strong) DOUAudioStreamer *streamer;
@property (nonatomic, strong) NSTimer *currentTimeTimer;
// 正在播放的音频
@property (nonatomic, strong) NSString *playingMusicTrackId;


@end

@implementation HPPlayingMusicController

-(NSString *)playingMusicTrackId
{
    if (!_playingMusicTrackId) {
        _playingMusicTrackId = [NSString string];
    }
    return _playingMusicTrackId;
}

-(void)viewDidLoad
{
    [super viewDidLoad];
}



#pragma mark- 公共方法 展示播放器
-(void)show
{
    // 关闭整个交互性
    UIWindow *window = [[UIApplication sharedApplication].windows lastObject];
    window.userInteractionEnabled = NO;
    [window addSubview:self.view];
    self.view.frame = window.bounds;
    self.view.hidden = NO;
    // 从底部弹出
    self.view.y = window.height;
    [UIView animateWithDuration:0.5 animations:^{
        self.view.y = 0;
    } completion:^(BOOL finished) {
        [self setUpMusicData];
        // 还原系统的交互性
        window.userInteractionEnabled = YES;
    }];
}

#pragma mark- 请求音频数据
-(void)setUpMusicData
{
    HPManagerMusicTool *musicFileManager = [HPManagerMusicTool sharedMusicTool];
    // 记录正在播放的音乐
    if ([self.playingMusicTrackId isEqualToString:musicFileManager.playingMusicId]){
        return;
    }
    
    // 重置UI数据 当存在播放的曲目时需要重置
    if (![self.playingMusicTrackId isEqualToString:@""]) {
        [self resetPlayingStatus];
    }
    // 不是正在播放的音频文件 设置正在播放的音频文件
    self.playingMusicTrackId = musicFileManager.playingMusicId;
    // 开始重新加载音频数据
    HPPlayingVoiceParam *param = [[HPPlayingVoiceParam alloc] init];
    param.trackId = self.playingMusicTrackId;
    // 发送请求
    [HPPlayingMusicTool playintMusicWith:param successed:^(HPPlayingVoiceResults *result) {
        self.musicResult = result;
        // 数据加载成功 开始播放
        [self prepareToPlay];
    } failure:^(NSError *error) {
        HPLog(@"请求失败：%@", error);
    }];
    
}




- (IBAction)backClick {
    // 0.禁用整个app的点击事件
    UIWindow *window = [[UIApplication sharedApplication].windows lastObject];
    window.userInteractionEnabled = NO;
    // 1.动画隐藏
    [UIView animateWithDuration:0.5 animations:^{
        self.view.y = - self.view.height;
    } completion:^(BOOL finished) {
        self.view.hidden = YES;
        window.userInteractionEnabled = YES;
    }];
}

#pragma mark- 播放的逻辑处理
- (IBAction)playOrPauseClick {
    
    if (self.playOrPauseBtn.selected) { // 正在播放
        // 暂停播放
        [self pausePlay];
    }else{ // 处于暂停的状态
        [self playSound];
    }
}

-(void)pausePlay
{
    // 停止定时器
    [self.currentTimeTimer invalidate];
    [self.streamer removeObserver:self forKeyPath:HPStreamStatus];
    [self.streamer removeObserver:self forKeyPath:HPStreambufferingRatio];
    [HPPlayingMusicTool pauseMusic:self.musicResult.playUrl32];
    // 改变图片
    self.playOrPauseBtn.selected = NO;
}

-(void)playSound
{
    // 添加定时器
    [self addCurrentTimeTimer];
    // 开始播放
    [HPPlayingMusicTool playMusic:self.musicResult.playUrl32];
    [self.streamer addObserver:self forKeyPath:HPStreamStatus options:NSKeyValueObservingOptionOld context:nil];
    [self.streamer addObserver:self forKeyPath:HPStreambufferingRatio options:NSKeyValueObservingOptionOld context:nil];
    // 改变图片
    self.playOrPauseBtn.selected = YES;
}

-(void)prepareToPlay
{
    // 展示相关的数据
    // 专辑图片
    NSURL *urlImage = [NSURL URLWithString:self.musicResult.coverLarge];
    [self.midImageView sd_setImageWithURL:urlImage completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        [UIView animateWithDuration:0.25 animations:^{
//            self.midImageView.alpha = 1.0;
            self.midImageView.layer.cornerRadius = 10;
        }];
    }];

    // 标题显示
    self.tagsLabel.text = self.musicResult.tags;
    self.titleLabel.text = self.musicResult.title;
    // 创建播放器
    self.streamer = [HPPlayingMusicTool createStreamByPlayUrl:self.musicResult.playUrl32];
    // 利用kvo监听播放进度
    [self playSound];
}

// 利用kvo监听streamer的属性
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    // 在主队列执行
    dispatch_async(dispatch_get_main_queue(), ^{
        if ([keyPath isEqualToString: HPStreamStatus]) {
            
        }else if ([keyPath isEqualToString:HPStreambufferingRatio]){ // 缓冲进度的改变
            // 总大小
            double expectedLength = self.streamer.expectedLength;
            // 下载大小
            double receivedLength = self.streamer.receivedLength;
            // 显示缓冲进度
            if ( receivedLength ==0 ) return;
            self.cachePrograss.width = self.prograssBg.width * (receivedLength/ expectedLength);
        }
    });
}

- (IBAction)preMusicClick
{
    HPManagerMusicTool *managerMusic = [HPManagerMusicTool sharedMusicTool];
    [managerMusic previousMusicId];
    [self setUpMusicData];
    
}

- (IBAction)nextMusciClick
{
    HPManagerMusicTool *managerMusic = [HPManagerMusicTool sharedMusicTool];
    [managerMusic nextMusicId];
    [self setUpMusicData];
}

// 重置歌曲
-(void)resetPlayingStatus
{
    // 重置所有的东西
    self.tagsLabel.text = nil;
    self.titleLabel.text = nil;
    self.sliderBtn.x = 0;
    [self.view setNeedsLayout];
    // 停止定时器
    if (self.playOrPauseBtn.selected) { // 正在播放
        // 暂停播放
        [self pausePlay];
    }
    // 停止播放
    [HPPlayingMusicTool stopMusic:self.musicResult.playUrl32];
}


#pragma mark- 处理定时器
- (void)addCurrentTimeTimer
{
    // 如果处于暂停状态 直接返回
    [self removeCurrentTimeTimer];
    // 保证定时器的工作是及时的
    [self updateCurrentTime];
    self.currentTimeTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(updateCurrentTime) userInfo:nil repeats:YES];
    [[NSRunLoop mainRunLoop] addTimer:self.currentTimeTimer forMode:NSRunLoopCommonModes];
}

- (void)updateCurrentTime
{
    // 分母为零的判断
    if ( (self.streamer.duration == 0) || self.streamer.currentTime == 0 )  return;
    
    // 1.计算进度值
    double progress = self.streamer.currentTime / self.streamer.duration;
    NSString *durationTime = [self strWithTime:self.streamer.duration];
    self.durationLabel.text = durationTime;
    CGFloat sliderMaxX = self.prograssBg.width - self.sliderBtn.width;
    
    // 2.设置滑块的x值
    self.sliderBtn.x = sliderMaxX * progress;
    [self.sliderBtn setTitle:[self strWithTime:self.streamer.currentTime] forState:UIControlStateNormal];
    // 坐标lab的时间显示
    self.currentTimeLabel.text = [self strWithTime:self.streamer.currentTime];
    
    // 3.设置进度条的宽度
    self.playPrograss.width = self.sliderBtn.center.x;
}

- (void)removeCurrentTimeTimer
{
    [self.currentTimeTimer invalidate];
    self.currentTimeTimer = nil;
}

#pragma mark- 其他私有方法
- (NSString *)strWithTime:(NSTimeInterval)time
{
    int minute = time / 60;
    int second = (int)time % 60;
    return [NSString stringWithFormat:@"%02d:%02d", minute, second];
}

@end
