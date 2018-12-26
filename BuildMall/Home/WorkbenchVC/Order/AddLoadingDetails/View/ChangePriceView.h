//
//  ChangePriceView.h
//  BuildMall
//
//  Created by 51wood on 2018/12/19.
//  Copyright © 2018 51wood. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol ChangePriceViewDelegate <NSObject>


-(void)sureChangeAction:(NSMutableDictionary* )dict;

@end

@interface ChangePriceView : UIView<UITextFieldDelegate>

@property(nonatomic,weak)id <ChangePriceViewDelegate>delegate;

@property (weak, nonatomic) IBOutlet UILabel *nameLable;
@property (weak, nonatomic) IBOutlet UILabel *detailLable;
@property (weak, nonatomic) IBOutlet UILabel *numLable;
@property (weak, nonatomic) IBOutlet UILabel *volumeLable;
@property (weak, nonatomic) IBOutlet UITextField *priceTF;
@property (weak, nonatomic) IBOutlet UIButton *priceBtn;
@property (weak, nonatomic) IBOutlet UIButton *chageBtn;

@property(nonatomic,strong)UIView *backgroupView;
+ (instancetype)addChangePriceView;

- (void)show;

@property(nonatomic,strong)NSMutableDictionary* dict;

@end

NS_ASSUME_NONNULL_END
