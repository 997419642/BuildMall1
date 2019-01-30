//
//  RecordingView.m
//  BuildMall
//
//  Created by 51wood on 2019/1/25.
//  Copyright © 2019 51wood. All rights reserved.
//

#import "RecordingView.h"
#import "AudioManager.h"
#import "AudioCell.h"
#import "XMProgressHUD.h"
#import <MBProgressHUD.h>

@interface RecordingView ()<MBProgressHUDDelegate>
{
    NSString *_audioPath;

    MBProgressHUD *hub;
    
}


@property(nonatomic,strong) AudioCell* cell;

@property (weak, nonatomic) IBOutlet UILabel *luLable;
@property (weak, nonatomic) IBOutlet UIButton *saveBtn;

@end

@implementation RecordingView

-(void)awakeFromNib
{
    [super awakeFromNib];
    
    _saveBtn.layer.masksToBounds = YES;
    _saveBtn.layer.cornerRadius = 5;
    _voiceRecordButton.backgroundColor = [UIColor whiteColor];
    _voiceRecordButton.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    _voiceRecordButton.titleLabel.font = [UIFont systemFontOfSize:15.0f];
    [_voiceRecordButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_voiceRecordButton addTarget:self action:@selector(startRecordVoice) forControlEvents:UIControlEventTouchDown];
    [_voiceRecordButton addTarget:self action:@selector(cancelRecordVoice) forControlEvents:UIControlEventTouchUpOutside];
    [_voiceRecordButton addTarget:self action:@selector(confirmRecordVoice) forControlEvents:UIControlEventTouchUpInside];
    [_voiceRecordButton addTarget:self action:@selector(updateCancelRecordVoice) forControlEvents:UIControlEventTouchDragExit];
    [_voiceRecordButton addTarget:self action:@selector(updateContinueRecordVoice) forControlEvents:UIControlEventTouchDragEnter];
    __weak typeof(self)weakSelf = self;
//    [[XMProgressHUD sharedView]setDidRecordMaxTimeBlock:^{
//        [weakSelf confirmRecordVoice];
//    }];
    
    AudioCell *cell = [[AudioCell alloc] init];
    self.cell = cell;
    [self addSubview:cell];
    cell.backgroundColor = [UIColor whiteColor];
    [cell mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(40);
        make.right.equalTo(self).offset(-40);
        make.height.equalTo(@(40));
        make.top.equalTo(_luLable.mas_bottom).offset(10);
    }];
    
    cell.audioFilePath = _audioPath;
    [cell setDelBlcok:^{
        _audioPath = @"";
    }];
    
}


#pragma mark -录音相关
/**
 *  开始录音
 */
- (void)startRecordVoice{
    if (_audioPath && ![_audioPath isEqualToString:@""]) {
        [self showMessage:@"录音已存在"];
        return;
    }
    AVAudioSessionRecordPermission permissionStatus = [[AVAudioSession sharedInstance] recordPermission];
    if (permissionStatus == AVAudioSessionRecordPermissionUndetermined) {
        if (![[AudioManager manager] checkMicrophoneAvailability]) {
            return;
        }
    }else if(permissionStatus == AVAudioSessionRecordPermissionDenied){
        [self showMessage:@"请在设置隐身中打开麦克风"];
        return;
    }
    
    [XMProgressHUD show];
    [[AudioManager manager] startRecording:nil];
}
/**
 *  取消录音
 */
- (void)cancelRecordVoice{
    [XMProgressHUD dismissWithMessage:@"取消录音"];
    [[AudioManager manager] cancelRecording];
}
/**
 *  录音结束
 */

-(void)showMessage:(NSString*)message{
    
    if (hub == nil) {
        hub = [[MBProgressHUD alloc] initWithView:self];
        hub.delegate=self;
    }
    [self addSubview:hub];
    hub.mode = MBProgressHUDModeText;
    hub.labelText = message;
    __block CGFloat seconds = 2;
    
    [hub showAnimated:NO whileExecutingBlock:^{
        sleep(seconds);
    } completionBlock:nil];
}

- (void)confirmRecordVoice{
    if ([[AudioManager manager]isRecording]) {
        __weak typeof(self)weakSelf = self;
        [[AudioManager manager] stopRecordingWithCompletion:^(NSString *recordPath, NSInteger aDuration, NSError *error) {
            if (aDuration < 1) {
                NSLog(@"录音时间太短");
                [XMProgressHUD dismissWithProgressState:XMProgressError];
                return ;
            }
            if (!error) {
                [XMProgressHUD dismissWithProgressState:XMProgressSuccess];
                _audioPath = recordPath;
                self.cell.audioFilePath = recordPath;
                NSLog(@"%@",recordPath);
            }
        }];
    }
}
- (IBAction)saveAction:(id)sender {
    
    [_delegate saveActionaudio:_audioPath];
}

/**
 *  更新录音显示状态,手指向上滑动后提示松开取消录音
 */
- (void)updateCancelRecordVoice{
    [XMProgressHUD changeSubTitle:@"松开取消录音"];
}

/**
 *  更新录音状态,手指重新滑动到范围内,提示向上取消录音
 */
- (void)updateContinueRecordVoice{
    [XMProgressHUD changeSubTitle:@"向上滑动取消录音"];
}



- (UIView *)backgroupView
{
    if (_backgroupView == nil) {
        _backgroupView = [UIView new];
        _backgroupView.frame = CGRectMake(0, 0, screenW, screenH);
        _backgroupView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.2];
    
    }
    return _backgroupView;
}

+ (instancetype)recordingView
{
    return [[[NSBundle mainBundle] loadNibNamed:@"RecordingView" owner:nil options:0] firstObject];
}

///显示
- (void)show
{
    [[UIApplication sharedApplication].keyWindow addSubview:self.backgroupView];
    [self.backgroupView addSubview:self];
    self.frame = CGRectMake(30, (screenH-450)/2, screenW-60 ,450);
    
}

- (IBAction)cancelAction:(UIButton *)sender {
    
    [_backgroupView removeFromSuperview];
    [self removeFromSuperview];
}





@end
