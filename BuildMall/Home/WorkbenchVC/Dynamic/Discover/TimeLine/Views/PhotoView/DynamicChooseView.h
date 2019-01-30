//
//  DynamicChooseView.h
//  BuildMall
//
//  Created by 51wood on 2019/1/19.
//  Copyright © 2019 51wood. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DynamicChooseView;
@protocol DynamicChooseViewDelegate <NSObject>

@optional
- (void)photoView:(DynamicChooseView *)photoView selectBtn:(UIButton *)btn;

@end

NS_ASSUME_NONNULL_BEGIN

@interface DynamicChooseView : UIView
@property(nonatomic,weak)id <DynamicChooseViewDelegate>delegate;


@property (weak, nonatomic) IBOutlet UIButton *videoBtn;
@property (weak, nonatomic) IBOutlet UIButton *photoBtn;

+ (instancetype)dynamicChooseView;

- (void)show;

@end

NS_ASSUME_NONNULL_END
