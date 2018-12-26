//
//  AddGroupView.h
//  BuildMall
//
//  Created by 51wood on 2018/11/17.
//  Copyright © 2018年 51wood. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AddGroupView;


@protocol AddGroupViewDelegate <NSObject>

@optional

- (void)addGroupView:(AddGroupView *)photoView selectBtn:(UIButton *)btn;

@end

@interface AddGroupView : UIView

@property(nonatomic,weak)id <AddGroupViewDelegate>delegate;

@property (weak, nonatomic) IBOutlet UITextField *addTF;

@property (weak, nonatomic) IBOutlet UILabel *toptitle;

+ (instancetype)addGroupView;

- (void)show;

@end
