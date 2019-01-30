//
//  FeedBackChooseView.h
//  BuildMall
//
//  Created by 51wood on 2019/1/22.
//  Copyright © 2019 51wood. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol FeedBackChooseViewDelegate <NSObject>
-(void)didClickButton:(UIButton *)btn;


@end

@interface FeedBackChooseView : UIView

@property(nonatomic,weak)id <FeedBackChooseViewDelegate>delegate;

+(instancetype)FeedBackView;

-(void)show;


@property(nonatomic,strong)UIView *backgroupView;

@end

NS_ASSUME_NONNULL_END
