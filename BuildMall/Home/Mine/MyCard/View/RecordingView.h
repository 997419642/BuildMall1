//
//  RecordingView.h
//  BuildMall
//
//  Created by 51wood on 2019/1/25.
//  Copyright © 2019 51wood. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol RecordingViewDelegate <NSObject>
-(void)saveActionaudio:(NSString *)record;


@end
@interface RecordingView : UIView



@property(nonatomic,weak)id <RecordingViewDelegate>delegate;

+(instancetype)recordingView;

-(void)show;


@property(nonatomic,strong)UIView *backgroupView;

@property (weak, nonatomic) IBOutlet UIButton *voiceRecordButton;

@end

NS_ASSUME_NONNULL_END
