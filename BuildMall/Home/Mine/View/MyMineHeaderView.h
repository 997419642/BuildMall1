//
//  MineHeaderView.h
//  BuildMall
//
//  Created by 51wood on 2019/1/21.
//  Copyright © 2019 51wood. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol MyMineHeaderViewDelegate <NSObject>
-(void)didClickMCardButton:(UIButton *)btn;


@end

@interface MyMineHeaderView : UIView

@property(nonatomic,weak)id <MyMineHeaderViewDelegate>delegate;

@property (weak, nonatomic) IBOutlet UIButton *myPickerBtn;

@end

NS_ASSUME_NONNULL_END
