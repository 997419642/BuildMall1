//
//  DOPOrderDeatilVC.m
//  MiaoMiaoKnight
//
//  Created by app on 2017/9/12.
//  Copyright © 2017年 com.miaomiao. All rights reserved.
//

#import "DOPOrderDeatilVC.h"


@interface DOPOrderDeatilVC ()

@property (weak, nonatomic) IBOutlet UIButton *saveBtn;

@property (weak, nonatomic) IBOutlet UIScrollView *SCView;
@property (weak, nonatomic) IBOutlet UIButton *titleBtn;
@property (weak, nonatomic) IBOutlet UIButton *adressBtn;
@property (weak, nonatomic) IBOutlet UIButton *birthdayBtn;
@property (weak, nonatomic) IBOutlet UITextField *remarkNameTF;
@property (weak, nonatomic) IBOutlet UITextField *comNameTF;
@property (weak, nonatomic) IBOutlet UITextField *positionTF;

@property (weak, nonatomic) IBOutlet UITextField *phoneTF;
@property (weak, nonatomic) IBOutlet UITextField *emailTF;
@property (weak, nonatomic) IBOutlet UITextField *remarkTF;

@end

@implementation DOPOrderDeatilVC


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    _saveBtn.layer.masksToBounds = YES;
    _saveBtn.layer.cornerRadius = 5;
    CGFloat img_W = _titleBtn.imageView.frame.size.width;
    CGFloat tit_W = _titleBtn.titleLabel.frame.size.width;
    
    _titleBtn.titleEdgeInsets = (UIEdgeInsets){
        .top    = 0,
        .left   = - (img_W + 10 / 2),
        .bottom = 0,
        .right  =   (img_W + 10 / 2),
    };
    
    _titleBtn.imageEdgeInsets = (UIEdgeInsets){
        .top    = 0,
        .left   =   (tit_W + 10 / 2),
        .bottom = 0,
        .right  = - (tit_W + 10 / 2),
    };
    
    [_titleBtn sizeToFit];
    
    CGFloat img_WadressBtn = _adressBtn.imageView.frame.size.width;
    CGFloat tit_WadressBtn = _adressBtn.titleLabel.frame.size.width;
    
    _adressBtn.titleEdgeInsets = (UIEdgeInsets){
        .top    = 0,
        .left   = - (img_WadressBtn + 10 / 2),
        .bottom = 0,
        .right  =   (img_WadressBtn + 10 / 2),
    };
    
    _adressBtn.imageEdgeInsets = (UIEdgeInsets){
        .top    = 0,
        .left   =   (tit_WadressBtn + 10 / 2),
        .bottom = 0,
        .right  = - (tit_WadressBtn + 10 / 2),
    };
    
    [_adressBtn sizeToFit];
    
    CGFloat img_Wbirthday = _birthdayBtn.imageView.frame.size.width;
    CGFloat tit_Wbirthday = _birthdayBtn.titleLabel.frame.size.width;
    
    _birthdayBtn.titleEdgeInsets = (UIEdgeInsets){
        .top    = 0,
        .left   = - (img_Wbirthday + 10 / 2),
        .bottom = 0,
        .right  =   (img_Wbirthday + 10 / 2),
    };
    
    _birthdayBtn.imageEdgeInsets = (UIEdgeInsets){
        .top    = 0,
        .left   =   (tit_Wbirthday + 10 / 2),
        .bottom = 0,
        .right  = - (tit_Wbirthday + 10 / 2),
    };
    
    [_birthdayBtn sizeToFit];

   

}
- (IBAction)birthDayAction:(UIButton *)sender {
    
}
- (IBAction)detailAdressAction:(UIButton *)sender {
}
- (IBAction)ChooseTitle:(UIButton *)sender {
}


- (IBAction)womenAction:(UIButton *)sender {
    
    
}
- (IBAction)birthdayAction:(UIButton *)sender {
    
}
- (IBAction)adressAction:(UIButton *)sender {
    
}


- (IBAction)titleAction:(UIButton *)sender {
    
}
- (IBAction)saveAction:(UIButton *)sender {
}






- (BOOL)textFieldShouldReturn:(UITextField *)aTextfield {
    [aTextfield resignFirstResponder];//关闭键盘
    return YES;
}


- (IBAction)jobTypeAction:(id)sender {



}
- (IBAction)numAction:(id)sender {

   

}
- (IBAction)jobNatureAction:(id)sender {

    


}
- (IBAction)moneyAction:(id)sender {

  

}


- (IBAction)xueLiAction:(id)sender {

}
- (IBAction)experienceAction:(id)sender {


  
}
- (IBAction)zhiweiMiaoshuAction:(id)sender {


}

//-(void)loadUI
//{
//    UIButton* lastButton = nil;
//    // 间距为10
//    int intes = 10;
//    // 每行3个
//    int num = 4;
//
////    NSArray* array = @[@"包吃",@"包住",@"全勤奖",@"年终奖",@"社会保险",@"岗位津贴",@"双休",@"带薪休假"];
//    for (NSInteger i = 0; i < _welfarDataArray.count; i++) {
//        UIButton* firstButton = [UIButton new];
//        DOPwelfareModel* model = _welfarDataArray[i];
//
//        NSString* str = model.name;
//        firstButton.tag = i;
//        [firstButton setTitle:str forState:UIControlStateNormal];
//        [firstButton setBackgroundColor:[UIColor groupTableViewBackgroundColor]];
//        [firstButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//        firstButton.titleLabel.font = [UIFont systemFontOfSize:12];
//        [firstButton addTarget:self action:@selector(seleAction:) forControlEvents:UIControlEventTouchUpInside];
//        [self.backView addSubview:firstButton];
//        firstButton.layer.cornerRadius = 13;
//        firstButton.clipsToBounds = YES;
//        [firstButton mas_makeConstraints:^(MASConstraintMaker *make) {
//
//            if ([model.status isEqualToString:@"1"]) {
//                [firstButton setBackgroundColor:[UIColor colorWithHexString:@"ff4200" ]];
//                [firstButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//                firstButton.selected = YES;
//            }
//
//            // 1. 判断是否存在上一个view
//            if (lastButton) {
//                // 存在的话宽度与上一个宽度相同
//                make.width.equalTo(lastButton);
//            } else {
//
//                if (i % num != 0) {
//                    make.width.mas_equalTo((firstButton.superview.frame.size.width - (num + 1)* intes)/4);
//                }
//            }
//            // 2. 判断是否是第一列
//            if (i % num == 0) {
//                // 一：是第一列时 添加左侧与父视图左侧约束
//                make.left.mas_equalTo(firstButton.superview).offset(intes);
//            } else {
//                // 二： 不是第一列时 添加左侧与上个view左侧约束
//                make.left.mas_equalTo(lastButton.mas_right).offset(intes);
//            }
//            // 3. 判断是否是最后一列 给最后一列添加与父视图右边约束
//            if (i % num == (num - 1)) {
//                make.right.mas_equalTo(firstButton.superview).offset(-intes);
//            }
//            // 4. 判断是否为第一列
//            if (i / num == 0) {
//                // 第一列添加顶部约束
//                make.top.mas_equalTo(firstButton.superview).offset(intes*4);
//            } else {
//                // 其余添加顶部约束 intes*10 是我留出的距顶部高度
//                make.top.mas_equalTo(intes * 4 + ( i / num )* (30 + intes));
//            }
//
//        }];
//
//        lastButton = firstButton;
//    }
//
//
//    UIButton* lastButton0 = nil;
//    // 间距为10
//    int intes0 = 10;
//    // 每行3个
//    int num0 = 4;
//
////    NSArray* array0 = @[@"包吃",@"包住",@"全勤奖",@"年终奖",@"社会保险",@"岗位津贴",@"双休",@"带薪休假"];
//    for (NSInteger i = 0; i < _brightDataArray.count; i++) {
//        UIButton* firstButton0 = [UIButton new];
//        DOPBrightSpotModel* model = _brightDataArray[i];
//
//        NSString* str = model.name;
//        firstButton0.tag = i;
//        [firstButton0 setTitle:str forState:UIControlStateNormal];
//        [firstButton0 setBackgroundColor:[UIColor groupTableViewBackgroundColor]];
//        [firstButton0 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//        firstButton0.titleLabel.font = [UIFont systemFontOfSize:12];
//        [firstButton0 addTarget:self action:@selector(seleAction0:) forControlEvents:UIControlEventTouchUpInside];
//        [self.twoBackView addSubview:firstButton0];
//        firstButton0.layer.cornerRadius = 13;
//        firstButton0.clipsToBounds = YES;
//        [firstButton0 mas_makeConstraints:^(MASConstraintMaker *make) {
//
//
//        if ([model.status isEqualToString:@"1"]) {
//            [firstButton0 setBackgroundColor:[UIColor colorWithHexString:@"ff4200" ]];
//            [firstButton0 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//            firstButton0.selected = YES;
//
//        }
//            // 1. 判断是否存在上一个view
//            if (lastButton0) {
//                // 存在的话宽度与上一个宽度相同
//                make.width.equalTo(lastButton0);
//            } else {
//
//                if (i % num0 != 0) {
//                    make.width.mas_equalTo((firstButton0.superview.frame.size.width - (num0 + 1)* intes0)/4);
//                }
//            }
//            // 2. 判断是否是第一列
//            if (i % num0 == 0) {
//                // 一：是第一列时 添加左侧与父视图左侧约束
//                make.left.mas_equalTo(firstButton0.superview).offset(intes0);
//            } else {
//                // 二： 不是第一列时 添加左侧与上个view左侧约束
//                make.left.mas_equalTo(lastButton0.mas_right).offset(intes0);
//            }
//            // 3. 判断是否是最后一列 给最后一列添加与父视图右边约束
//            if (i % num0 == (num0 - 1)) {
//                make.right.mas_equalTo(firstButton0.superview).offset(-intes0);
//            }
//            // 4. 判断是否为第一列
//            if (i / num0 == 0) {
//                // 第一列添加顶部约束
//                make.top.mas_equalTo(firstButton0.superview).offset(intes0*4);
//            } else {
//                // 其余添加顶部约束 intes*10 是我留出的距顶部高度
//                make.top.mas_equalTo(intes0 * 4 + ( i / num0 )* (30 + intes0));
//            }
//
//        }];
//
//        lastButton0 = firstButton0;
//    }
//}




- (IBAction)fabuAction:(id)sender {

   

}

-(void)pressleft
{
    [self.navigationController popViewControllerAnimated:YES];

}

@end
