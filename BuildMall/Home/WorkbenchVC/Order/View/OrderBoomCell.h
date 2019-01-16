//
//  OrderBoomCell.h
//  BuildMall
//
//  Created by 51wood on 2018/11/26.
//  Copyright © 2018 51wood. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OrderManageModel.h"

@protocol OrderBoomCellDelegate <NSObject>

- (void)closeAction:(UITableViewCell *)cell;

-(void)shenheOrder:(UIButton *)btn;

-(void)addLoadingDetail:(UIButton *)btn;

-(void)oneBtnAction:(UIButton *)btn;

-(void)payNumAction;

-(void)lookAction:(NSString* )str btn:(UIButton *)btn;

-(void)imgAction:(UIImageView *)imgUrl;


@end

@interface OrderBoomCell : UITableViewCell
@property (nonatomic, weak) id<OrderBoomCellDelegate> delegate;

@property (weak, nonatomic) IBOutlet UIView *bottomView;

@property (weak, nonatomic) IBOutlet UIButton *shenheBtn;
@property (weak, nonatomic) IBOutlet UIButton *closeBtn;
@property (weak, nonatomic) IBOutlet UIButton *guizeBtn;
@property (weak, nonatomic) IBOutlet UIButton *lookBtn;
@property (weak, nonatomic) IBOutlet UIButton *addLoadingDetails;
@property (weak, nonatomic) IBOutlet UILabel *sureLable;

@property (weak, nonatomic) IBOutlet UIButton *payNum;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *top;

@property (weak, nonatomic) IBOutlet UIButton *oneBtn;
@property (weak, nonatomic) IBOutlet UIButton *twoBtn;
@property (weak, nonatomic) IBOutlet UIButton *threeBtn;
@property (weak, nonatomic) IBOutlet UIButton *fourBtn;

@property (weak, nonatomic) IBOutlet UITextField *actualTF;

@property (weak, nonatomic) IBOutlet UIButton *oneRightBtn;
@property (weak, nonatomic) IBOutlet UIButton *twoRightBtn;
@property (weak, nonatomic) IBOutlet UILabel *threeLable;
@property (weak, nonatomic) IBOutlet UIButton *fourRightBtn;
@property (weak, nonatomic) IBOutlet UIButton *fiveRightBtn;

@property(nonatomic,strong)OrderManageModel* model;

@property(nonatomic,strong)NSMutableDictionary* pickerDict;

@property (weak, nonatomic) IBOutlet UILabel *youhuiLable;
@property (weak, nonatomic) IBOutlet UITextField *youhuiTF;
@property (weak, nonatomic) IBOutlet UIButton *zhuanBtn;
@property (weak, nonatomic) IBOutlet UILabel *trueLable;
@property (weak, nonatomic) IBOutlet UIView *zhuanView;
@property (weak, nonatomic) IBOutlet UIView *zheView;
@property (weak, nonatomic) IBOutlet UILabel *shneheOne;
@property (weak, nonatomic) IBOutlet UIButton *shenheTwo;
@property (weak, nonatomic) IBOutlet UILabel *shneheThree;
@property (weak, nonatomic) IBOutlet UIButton *imgBtn;
@property (weak, nonatomic) IBOutlet UIImageView *oneImg;
@property (weak, nonatomic) IBOutlet UIImageView *twoImg;
@property (weak, nonatomic) IBOutlet UIImageView *threeImg;
@property (weak, nonatomic) IBOutlet UIImageView *fourImg;
@property (weak, nonatomic) IBOutlet UILabel *remarkLable;
@property (weak, nonatomic) IBOutlet UILabel *threenameLable;
@property (weak, nonatomic) IBOutlet UIView *shouView;
@property (weak, nonatomic) IBOutlet UILabel *weiKuanLable;
@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@property (weak, nonatomic) IBOutlet UIImageView *dingjinImg;
@property (weak, nonatomic) IBOutlet UIButton *dingjinBtn;
@property (weak, nonatomic) IBOutlet UILabel *youhuiTwoLable;
@property (weak, nonatomic) IBOutlet UITextField *huiyouTwoTF;
@property (weak, nonatomic) IBOutlet UIView *youhuiTwoView;
@property (weak, nonatomic) IBOutlet UIView *daifuView;
@property (weak, nonatomic) IBOutlet UILabel *daifuleftLable;
@property (weak, nonatomic) IBOutlet UILabel *daifuLable;
@property (weak, nonatomic) IBOutlet UIImageView *imgTwo;
@property (weak, nonatomic) IBOutlet UIImageView *imgThree;
@property (weak, nonatomic) IBOutlet UIImageView *imgFour;
@property (weak, nonatomic) IBOutlet UIImageView *imgFive;
@property (weak, nonatomic) IBOutlet UIImageView *Imgsix;

@end


