//
//  AddOrderView.h
//  BuildMall
//
//  Created by 51wood on 2018/12/7.
//  Copyright © 2018 51wood. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "OrderDetailModel.h"
#import "OrderManageModel.h"

#import "GoodsBeansListModel.h"

NS_ASSUME_NONNULL_BEGIN


@protocol AddOrderViewDelegate <NSObject>


-(void)sureAction:(NSMutableDictionary* )dict;

@end

@interface AddOrderView : UIView<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UILabel *specifLable;
@property (weak, nonatomic) IBOutlet UIButton *priceBtn;
@property (weak, nonatomic) IBOutlet UITextField *priceTF;
@property (weak, nonatomic) IBOutlet UIButton *jianBtn;
@property (weak, nonatomic) IBOutlet UIButton *jiaAction;
@property (weak, nonatomic) IBOutlet UIButton *numBtn;
@property (weak, nonatomic) IBOutlet UIButton *addBtn;
@property (weak, nonatomic) IBOutlet UILabel *houLable;
@property (weak, nonatomic) IBOutlet UILabel *keshouLable;
@property (weak, nonatomic) IBOutlet UILabel *lenthLable;
@property (weak, nonatomic) IBOutlet UILabel *unitLable;

@property(nonatomic,strong)UIView *backgroupView;

@property(nonatomic,assign)BOOL isDetail;

+ (instancetype)addSureView;

- (void)show;

@property(nonatomic,weak)id <AddOrderViewDelegate>delegate;

@property(nonatomic,strong)OrderDetailModel* detailModel;

@property(nonatomic,strong)GoodsBeansListModel* beanModel;

@property(nonatomic,strong)NSMutableDictionary* dict;

@property(nonatomic,strong)NSMutableDictionary* genshuDict;


@property(nonatomic,strong)OrderDBModel* DBmodel;

//装货
@property(nonatomic,strong)GoodsBeansListModel* parksModel;

@property(nonatomic,strong)NSMutableDictionary* parksDict;
@property(nonatomic,strong)NSMutableDictionary* detailParkDict;



@property(nonatomic,assign)BOOL isZhuanghuo;

@property(nonatomic,assign)BOOL isChange;

@end

NS_ASSUME_NONNULL_END
