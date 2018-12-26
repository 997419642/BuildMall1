//
//  TimeChooseView.h
//  BuildMall
//
//  Created by 51wood on 2018/11/8.
//  Copyright © 2018年 51wood. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TimeChooseViewDelegate <NSObject>
-(void)didClickCancelButton;
-(void)didClickLeftChooseButton;
-(void)didClickRightChooseButton;
-(void)didClickSureButton;

@end

@interface TimeChooseView : UIView

@property(nonatomic,strong)UIView *backgroupView;
@property(nonatomic,weak)id <TimeChooseViewDelegate>delegate;
@property (weak, nonatomic) IBOutlet UIButton *leftbtn;
@property (weak, nonatomic) IBOutlet UIButton *rightBtn;

+(instancetype)timeChooseView;

-(void)show;

@end
