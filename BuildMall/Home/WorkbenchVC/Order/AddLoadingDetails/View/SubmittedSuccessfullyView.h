//
//  SubmittedSuccessfullyView.h
//  BuildMall
//
//  Created by 51wood on 2018/12/3.
//  Copyright © 2018 51wood. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol SubmittedViewDelegate <NSObject>


@optional

-(void)deleteAction;

@end

@interface SubmittedSuccessfullyView : UIView

@property(nonatomic,weak)id <SubmittedViewDelegate>delegate;

@property (weak, nonatomic) IBOutlet UIButton *cancelBtn;

@property(nonatomic,strong)UIView *backgroupView;
+ (instancetype)addSubmittedView;

- (void)show;

@end

NS_ASSUME_NONNULL_END
