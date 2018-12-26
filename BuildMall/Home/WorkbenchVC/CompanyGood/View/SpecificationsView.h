//
//  SpecificationsView.h
//  BuildMall
//
//  Created by 51wood on 2018/12/1.
//  Copyright © 2018 51wood. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SpecificationsView : UIView
@property (weak, nonatomic) IBOutlet UIButton *reductionBtn;
@property (weak, nonatomic) IBOutlet UIButton *addBtn;
@property (weak, nonatomic) IBOutlet UILabel *numLable;
@property (weak, nonatomic) IBOutlet UIView *topView;
@property (weak, nonatomic) IBOutlet UILabel *boomLable;



@property(nonatomic,strong)UIView *backgroupView;
+ (instancetype)addSpecificationsView;

- (void)show;
@end

NS_ASSUME_NONNULL_END
