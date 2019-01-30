//
//  LoginOutView.h
//  BuildMall
//
//  Created by 51wood on 2019/1/22.
//  Copyright © 2019 51wood. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol LoginOutViewDelegate <NSObject>
-(void)didClickOutButton:(UIButton *)btn;


@end

@interface LoginOutView : UIView

@property(nonatomic,weak)id <LoginOutViewDelegate>delegate;


+(instancetype)loginOut;

-(void)show;


@property(nonatomic,strong)UIView *backgroupView;

@end

NS_ASSUME_NONNULL_END
