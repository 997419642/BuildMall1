//
//  AddCustomGoodsVC.h
//  BuildMall
//
//  Created by 51wood on 2018/11/26.
//  Copyright © 2018 51wood. All rights reserved.
//

#import "BasicVC.h"

NS_ASSUME_NONNULL_BEGIN

@interface AddCustomGoodsVC : BasicVC
@property(nonatomic,copy)NSString *categoryId;

@property(nonatomic,copy)NSString *orderId;

@property(nonatomic,assign)BOOL isZhuanghuo;

@property (weak, nonatomic) IBOutlet UILabel *houdulable;
@property (weak, nonatomic) IBOutlet UILabel *kuanDuLable;
@property (weak, nonatomic) IBOutlet UILabel *pianShuLable;
@property (weak, nonatomic) IBOutlet UIView *houView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *top;
@property (weak, nonatomic) IBOutlet UILabel *baohaoLable;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *cangkuTop;
@property (weak, nonatomic) IBOutlet UIView *baohaoView;

@end

NS_ASSUME_NONNULL_END
