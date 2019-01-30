//
//  AddCustomGoodsVC.m
//  BuildMall
//
//  Created by 51wood on 2018/11/26.
//  Copyright © 2018 51wood. All rights reserved.
//

#import "AddCustomGoodsVC.h"
#import "ChooseCategoryVC.h"
#import "SWGOrderDetailControllerApi.h"
#import "SWGLoadingCustomBean.h"
#import "SWGOrderPackControllerApi.h"

@interface AddCustomGoodsVC ()<UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIButton *cancelBtn;
@property (weak, nonatomic) IBOutlet UIButton *sureBtn;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UILabel *pinmingLable;
@property (weak, nonatomic) IBOutlet UILabel *pingpaiLable;
@property (weak, nonatomic) IBOutlet UILabel *dengjiLable;
@property (weak, nonatomic) IBOutlet UILabel *cangKuLable;

@property (nonatomic, strong) UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UIButton *leimuBtn;
@property (weak, nonatomic) IBOutlet UITextField *baoHaoTF;
@property (weak, nonatomic) IBOutlet UITextField *houDuTF;
@property (weak, nonatomic) IBOutlet UITextField *kuanDuTF;
@property (weak, nonatomic) IBOutlet UITextField *changDuTF;
@property (weak, nonatomic) IBOutlet UITextField *genShuTF;
@property (weak, nonatomic) IBOutlet UITextField *liFanfshuTF;
@property (weak, nonatomic) IBOutlet UITextField *danJiaTF;

@property(nonatomic,strong)NSString* cangKuStr;
@property(nonatomic,strong)NSString* pinMingStr;
@property(nonatomic,strong)NSString* pinPaiStr;
@property(nonatomic,strong)NSString* dengJiStr;


@end

@implementation AddCustomGoodsVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.navigationItem.title = @"自定义添加商品";
    _cancelBtn.layer.borderColor = [UIColor colorWithHexString:@"52C9C5"].CGColor;
    _cancelBtn.layer.cornerRadius = 5;
    _cancelBtn.layer.masksToBounds =YES;
    _cancelBtn.layer.borderWidth = 1;
    
    _sureBtn.layer.cornerRadius = 5;
    _sureBtn.layer.masksToBounds =YES;
    _scrollView.delegate  = self;
    [self refreshing];
    
    if ([_categoryId isEqualToString:@"1"]) {
        
        [_leimuBtn setTitle:@"原木" forState:UIControlStateNormal];
        _kuanDuLable.text = @"口径";
        _pianShuLable.text = @"跟数";
        _top.constant = 30;
        _houDuTF.hidden = YES;
        _houdulable.hidden = YES;
        _houView.hidden = YES;
        _cangkuTop.constant = 15;
        _baohaoLable.hidden = YES;
        _baoHaoTF.hidden = YES;
        _baohaoView.hidden = YES;
    }else
    {
        [_leimuBtn setTitle:@"实木板材" forState:UIControlStateNormal];
        _kuanDuLable.text = @"宽度";
        _pianShuLable.text = @"片数";
    }
}

-(void)refreshing
{
    
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    [self.view endEditing:YES];
}

- (IBAction)cancelAction:(UIButton *)sender {
    
    
}

- (IBAction)addAction:(UIButton *)sender {

    
    if ([_categoryId intValue] == 2) {
        if ([_houDuTF.text isEqualToString:@""]) {
            [self showAlert:@"请输入厚度"];
            return;
        }
        
        if ([_baoHaoTF.text isEqualToString:@""]) {
            [self showAlert:@"请输入包号"];
            return;
        }
    }
    
    if ([_kuanDuTF.text isEqualToString:@""]) {
        [self showAlert:@"请输入宽度"];
        return;
    }
    
    if ([_changDuTF.text isEqualToString:@""]) {
        [self showAlert:@"请输入长度"];
        return;
    }
    if ([_categoryId intValue] == 2) {
        if ([_genShuTF.text isEqualToString:@""]) {
            [self showAlert:@"请输入片数"];
            return;
        }
    }else
    {
        if ([_genShuTF.text isEqualToString:@""]) {
            [self showAlert:@"请输入根数"];
            return;
        }
    }
    
    if ([_liFanfshuTF.text isEqualToString:@""]) {
        [self showAlert:@"请输入立方数"];
        return;
    }
    
    if ([_danJiaTF.text isEqualToString:@""]) {
        [self showAlert:@"请输入单价"];
        return;
    }
    
    if ( _cangKuStr == nil) {
        [self showAlert:@"请选择仓库"];
        return;
    }
    
    if ([_pinMingStr isEqualToString:@""] || _pinMingStr == nil) {
        [self showAlert:@"请选择品名"];
        return;
    }
    
    if (_pinPaiStr == nil) {
        [self showAlert:@"请选择品牌"];
        return;
    }
    
    if ([_dengJiStr isEqualToString:@""] || _dengJiStr == nil) {
        [self showAlert:@"请选择等级"];
        return;
    }
    
    if (_isZhuanghuo == YES) {
        //装货时添加
        NSMutableDictionary* dataDict =[NSMutableDictionary new];

        if ([_categoryId intValue] == 1) {
            //原木
            [dataDict setObject:_pinmingLable.text forKey:@"shuzhong"];
            [dataDict setObject:_pingpaiLable.text forKey:@"pinpai"];
            [dataDict setObject:_dengjiLable.text forKey:@"dengji"];
            [dataDict setObject:_kuanDuTF.text forKey:@"kuandu"];
            [dataDict setObject:_changDuTF.text forKey:@"changdu"];
            [dataDict setObject:_liFanfshuTF.text forKey:@"lifangshu"];
            [dataDict setObject:_cangKuStr forKey:@"cangku"];
            [dataDict setObject:_categoryId forKey:@"categoryId"];
            [dataDict setObject:_genShuTF.text forKey:@"genshu"];

        }else if([_categoryId intValue] == 2)
        {
            //板材
            [dataDict setObject:_pinmingLable.text forKey:@"shuzhong"];
            [dataDict setObject:_pingpaiLable.text forKey:@"pinpai"];
            [dataDict setObject:_dengjiLable.text forKey:@"dengji"];
            [dataDict setObject:_houDuTF.text forKey:@"houdu"];
            [dataDict setObject:_kuanDuTF.text forKey:@"kuandu"];
            [dataDict setObject:_changDuTF.text forKey:@"changdu"];
            [dataDict setObject:_liFanfshuTF.text forKey:@"lifangshu"];
            [dataDict setObject:_baoHaoTF.text forKey:@"packetNum"];
            [dataDict setObject:_cangKuStr forKey:@"cangku"];
            [dataDict setObject:_categoryId forKey:@"categoryId"];
            [dataDict setObject:_genShuTF.text forKey:@"genshu"];


        }

        NSString* packages = [dataDict mj_JSONString];
        SWGLoadingCustomBean* bean = [SWGLoadingCustomBean new];
        NSNumber* cubicNum = [NSNumber  numberWithInt:[_liFanfshuTF.text intValue]];
        bean.cubicNum = cubicNum;
        bean.piecesNum = _genShuTF.text;
        bean.price = _danJiaTF.text;
        bean.species = _pinmingLable.text;
        bean.orderId = [NSNumber numberWithInt:[_orderId intValue]];
        bean.categoryId = [NSNumber  numberWithInt:[_categoryId intValue]];
        bean.packages = packages;
        __weak typeof(self)weakSelf = self;
        
        SWGOrderPackControllerApi* OrderDetail = [SWGOrderPackControllerApi new];
        [OrderDetail insertLoadingCustomUsingPOSTWithAuthorization:@"Q" loadingCustomBean:bean completionHandler:^(SWGMessageResult *output, NSError *error) {
  
            if (!error) {
                if ([output.code intValue] == 0) {
                    [weakSelf showAlert:@"添加成功"];
                    [weakSelf.navigationController popViewControllerAnimated:YES];
                }
            }else
            {
                NSData * data = error.userInfo[@"com.alamofire.serialization.response.error.data"];
                NSString * str = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
                NSLog(@"错误原因:%@",str);
            }
        }];
    }else
    {
        //审核时添加
        OrderDBTool *noticeDBTool = [OrderDBTool shareInstance];
        [noticeDBTool createTable];
        NSMutableDictionary* dict0 = [NSMutableDictionary dictionary];
        [dict0 setObject:@"" forKey:@"orderDetailId"];
        [dict0 setObject:_danJiaTF.text forKey:@"buyPrice"];
        [dict0 setObject:_liFanfshuTF.text forKey:@"unitNum"];
        [dict0 setObject:@"0" forKey:@"goodsId"];
        [dict0 setObject:@"0" forKey:@"stockNum"];
        [dict0 setObject:@"0" forKey:@"lockNum"];
        [dict0 setObject:@"m³" forKey:@"goodsNuit"];
        [dict0 setObject:_kuanDuTF.text forKey:@"kuandu"];
        [dict0 setObject:_changDuTF.text forKey:@"changdu"];
        [dict0 setObject:_pinmingLable.text forKey:@"shuzhong"];
        [dict0 setObject:_pingpaiLable.text forKey:@"pinpai"];
        [dict0 setObject:_dengjiLable.text forKey:@"dengji"];
        if ([_categoryId isEqualToString:@"1"]) {
            [dict0 setObject:_genShuTF.text forKey:@"buyNumber"];
            [dict0 setObject:@"" forKey:@"genshu"];
            [dict0 setObject:@"" forKey:@"houdu"];
            [dict0 setObject:@"" forKey:@"packages"];
            
        }else if([_categoryId isEqualToString:@"2"])
        {
            //板材
            [dict0 setObject:@"1" forKey:@"buyNumber"];
            //片数
            [dict0 setObject:_genShuTF.text forKey:@"genshu"];
            [dict0 setObject:_houDuTF.text forKey:@"houdu"];
            [dict0 setObject:_baoHaoTF.text forKey:@"packages"];
        }
        [dict0 setObject:_cangKuStr forKey:@"cangku"];
        [dict0 setObject:@"YES" forKey:@"isCus"];
        [dict0 setObject:_categoryId forKey:@"categoryId"];

        
        NSMutableDictionary* dict2 = [NSMutableDictionary dictionary];
        [dict2 setObject:@"" forKey:@"orderDetailId"];
        [dict2 setObject:_danJiaTF.text forKey:@"buyPrice"];
        //lifangshu不一样
        [dict2 setObject:_liFanfshuTF.text forKey:@"lifangshu"];
        [dict2 setObject:@"0" forKey:@"goodsId"];
        [dict2 setObject:@"0" forKey:@"stockNum"];
        [dict2 setObject:@"0" forKey:@"lockNum"];
        [dict2 setObject:@"m³" forKey:@"goodsNuit"];
        
        [dict2 setObject:_kuanDuTF.text forKey:@"kuandu"];
        [dict2 setObject:_changDuTF.text forKey:@"changdu"];
        [dict2 setObject:_pinmingLable.text forKey:@"shuzhong"];
        [dict2 setObject:_pingpaiLable.text forKey:@"pinpai"];
        [dict2 setObject:_dengjiLable.text forKey:@"dengji"];
        
        if ([_categoryId isEqualToString:@"1"]) {
            [dict2 setObject:_genShuTF.text forKey:@"buyNumber"];
            [dict2 setObject:@"" forKey:@"genshu"];
            [dict2 setObject:@"" forKey:@"houdu"];
            [dict2 setObject:@"" forKey:@"packages"];
            
        }else if([_categoryId isEqualToString:@"2"])
        {
            //板材
            [dict2 setObject:@"1" forKey:@"buyNumber"];
            //片数
            [dict2 setObject:_genShuTF.text forKey:@"genshu"];
            [dict2 setObject:_houDuTF.text forKey:@"houdu"];
            [dict2 setObject:_baoHaoTF.text forKey:@"packages"];
        }
        [dict2 setObject:_cangKuStr forKey:@"cangku"];
        [dict2 setObject:_categoryId forKey:@"categoryId"];
        NSString* packages = [dict2 mj_JSONString];
        [dict0 setObject:packages forKey:@"packages"];
        
        OrderDBModel *noticeModel =[[OrderDBModel alloc]initWithDictionary:dict0];
        [noticeDBTool insertModel:noticeModel];
        [self.navigationController popViewControllerAnimated:YES];

        
        
//        NSString* packages = [dataDict mj_JSONString];
//        SWGLoadingCustomBean* bean = [SWGLoadingCustomBean new];
//        NSNumber* cubicNum = [NSNumber  numberWithInt:[_liFanfshuTF.text intValue]];
//        bean.cubicNum = cubicNum;
//        if ([_categoryId isEqualToString:@"1"]) {
//            bean.piecesNum = _genShuTF.text;
//        }else
//        {
//            bean.piecesNum = @"1";
//        }
//        bean.price = _danJiaTF.text;
//        bean.species = _pinmingLable.text;
//        bean.orderId = [NSNumber numberWithInt:[_orderId intValue]];
//        bean.categoryId = [NSNumber  numberWithInt:[_categoryId intValue]];
//        bean.packages = packages;
//
//        __weak typeof(self)weakSelf = self;

//        SWGOrderDetailControllerApi* OrderDetail = [SWGOrderDetailControllerApi new];
//        [OrderDetail customAddBoardGoodsUsingPOSTWithAuthorization:@"Q" bean:bean completionHandler:^(SWGMessageResult *output, NSError *error) {
//            if (!error) {
//                if ([output.code intValue] == 0) {
//                    [weakSelf showAlert:@"添加成功"];
//                    [weakSelf.navigationController popViewControllerAnimated:YES];
//                }
//            }else
//            {
//                NSData * data = error.userInfo[@"com.alamofire.serialization.response.error.data"];
//                NSString * str = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
//                NSLog(@"错误原因:%@",str);
//            }
//        }];
    }
    
}


- (IBAction)cangKuAction:(UIButton *)sender {
    
    ChooseCategoryVC* VC = [ChooseCategoryVC new];
    VC.titleStr = @"仓库";
    VC.categoryId = _categoryId;
    VC.slectChooseBlock = ^(NSMutableDictionary * _Nonnull dict) {
        _cangKuLable.text = dict[@"attrValue"];
        _cangKuStr = dict[@"attrValue"];
        
    };
    [self.navigationController pushViewController:VC animated:YES];
}

- (IBAction)ChoosePinmingAction:(UIButton *)sender {
    ChooseCategoryVC* VC = [ChooseCategoryVC new];
    VC.titleStr = @"品名";
    VC.categoryId = _categoryId;
    VC.slectChooseBlock = ^(NSMutableDictionary * _Nonnull dict) {
        _pinmingLable.text = dict[@"attrValue"];
        _pinMingStr = dict[@"attrValue"];

    };
    [self.navigationController pushViewController:VC animated:YES];
}

- (IBAction)choosePinpaiAction:(UIButton *)sender {
    
    ChooseCategoryVC* VC = [ChooseCategoryVC new];
    VC.titleStr = @"品牌";
    VC.categoryId = _categoryId;
    VC.slectChooseBlock = ^(NSMutableDictionary * _Nonnull dict) {
        _pingpaiLable.text = dict[@"attrValue"];
        _pinPaiStr = dict[@"attrValue"];
    };
    [self.navigationController pushViewController:VC animated:YES];
}

- (IBAction)chooseDengjiAction:(UIButton *)sender {
    
    ChooseCategoryVC* VC = [ChooseCategoryVC new];
    VC.titleStr = @"等级";
    VC.categoryId = _categoryId;
    VC.slectChooseBlock = ^(NSMutableDictionary * _Nonnull dict) {
        _dengjiLable.text = dict[@"attrValue"];
        _dengJiStr = dict[@"attrValue"];
    };
    [self.navigationController pushViewController:VC animated:YES];
}


@end
