//
//  LoadingListVC.m
//  BuildMall
//
//  Created by 51wood on 2018/12/1.
//  Copyright © 2018 51wood. All rights reserved.
//

#import "LoadingListVC.h"
#import "LoadingListCell.h"
#import "SubmittedSuccessfullyView.h"
#import "SWGOrderPackControllerApi.h"
#import "SWGConfirmLoadingBean.h"

@interface LoadingListVC ()<UITableViewDelegate,UITableViewDataSource,SubmittedViewDelegate>

@property(nonatomic,strong)UITableView* tableView;
@property(nonatomic) NSArray<SWGConfirmLoadingBean>* loadingBeanList;

@end

@implementation LoadingListVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.navigationItem.title = @"装车详单";

    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, screenW, screenH-64) style:UITableViewStyleGrouped];
    
    [self.view addSubview:self.tableView];
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.rowHeight = 70;
    [_tableView registerNib:[UINib nibWithNibName:@"LoadingListCell" bundle:nil] forCellReuseIdentifier:@"LoadingListCell"];
    
    
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 69;

}


- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
    return 250;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView* view = [UIView new];
    view.backgroundColor = [UIColor colorWithHexString:@"F5F5F5"];

    UILabel * lable = [UILabel new];
    lable.text = @"订单编号：QG20180911011";
    lable.textColor = [UIColor colorWithHexString:@"333333"];
    [view addSubview:lable];
    lable.font = [UIFont systemFontOfSize:12];
    [lable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(view).offset(20);
        make.top.equalTo(view).offset(15);
    }];
    
    
    UILabel * priceLable = [UILabel new];
    priceLable.text = @"订单金额：￥26387.54";
    priceLable.textColor = [UIColor colorWithHexString:@"333333"];
    [view addSubview:priceLable];
    priceLable.font = [UIFont systemFontOfSize:12];
    [priceLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(view).offset(20);
        make.top.equalTo(lable.mas_bottom).offset(5);
    }];

    UILabel* stateLable = [UILabel new];
    stateLable.text = @"待装车";
    stateLable.textColor = [UIColor colorWithHexString:@"52C9C5"];
    stateLable.font = [UIFont systemFontOfSize:16];
    [view addSubview:stateLable];
    [stateLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(view).offset(-20);
        make.centerY.equalTo(view);
    }];
    
    OrderManageModel* model = _dataArray[0];
    lable.text = [NSString stringWithFormat:@"订单编号：%@",model.orderSn];
    priceLable.text = [NSString stringWithFormat:@"订单金额：￥%@",model.totalPrice];
    
    
    
    return view;
}


- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UIView* firstFooter = [UIView new];
    UILabel* numLable = [UILabel new];
    numLable.text = @"共2件 50：432m";
    numLable.textColor = [UIColor colorWithHexString:@"666666"];
    numLable.font = [UIFont systemFontOfSize:12];
    [firstFooter addSubview:numLable];
    [numLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(firstFooter);
        make.top.equalTo(firstFooter).offset(15);
    }];
    
    UILabel* priceLable = [UILabel new];
    priceLable.text = @"￥50389.00";
    priceLable.textColor = [UIColor colorWithHexString:@"E82434"];
    priceLable.font = [UIFont systemFontOfSize:16];
    [firstFooter addSubview:priceLable];
    [priceLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(firstFooter).offset(-20);
        make.top.equalTo(firstFooter).offset(15);
    }];
    
    
    UIButton* btn = [UIButton new];
    [btn setTitle:@"确认提交" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn setBackgroundColor:[UIColor colorWithHexString:@"52C9C5"]];
    [firstFooter addSubview:btn];
    [btn addTarget:self action:@selector(btnAction) forControlEvents:UIControlEventTouchUpInside];
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(firstFooter).offset(-50);
        make.left.equalTo(firstFooter).offset(20);
        make.right.equalTo(firstFooter).offset(-20);
        make.height.equalTo(@(43));
    }];
    
    btn.layer.masksToBounds = YES;
    btn.layer.cornerRadius = 5;
    
    priceLable.text = [NSString stringWithFormat:@"￥%.2f",_allPrice];
    numLable.text = [NSString stringWithFormat:@"共%d件 %.2f%@",_allNum,_allUnit,@"m³"];

    return firstFooter;
    
}

-(void)btnAction
{
    [self submittedAction];
}

-(void)submittedAction
{
    SWGOrderPackControllerApi* orderPack = [SWGOrderPackControllerApi new];
    NSMutableArray* arrayData = [NSMutableArray array];
    OrderManageModel* model0 = self.dataArray[0];
    
    AMUserAccountInfo *userInfo = [AMUserAccountInfo shareInfo];
    OrderManageModel* model = _dataArray[0];

    for (NSMutableDictionary* dict in self.deliveryOrderArray) {
        SWGConfirmLoadingBean* bean;
        if ([dict[@"goodsId"] intValue] != 0) {
            
            bean = [SWGConfirmLoadingBean new];
            bean.buyNumber = [NSNumber numberWithInt:1];
            bean.buyPrice = dict[@"buyPrice"];
         
            bean.cubicNum = [NSNumber numberWithInt:[dict[@"unitNum"] intValue]];
            bean.orderId = [NSNumber numberWithInt:[model0.orderId intValue]];
            bean.orderStatus = [NSNumber numberWithInt:[model.orderStatus intValue]];
            bean.userId = [NSNumber numberWithInt:[userInfo.userId intValue]];
            

        }else
        {
            NSMutableDictionary* datadict = [dict[@"packages"] mj_JSONObject];
            bean = [SWGConfirmLoadingBean new];
            bean.buyNumber = [NSNumber numberWithInt:1];
            bean.buyPrice = [NSString stringWithFormat:@"%@",dict[@"buyPrice"]];
            bean.cubicNum = [NSNumber numberWithInt:[datadict[@"lifangshu"] intValue]];
            bean.orderId = [NSNumber numberWithInt:[model0.orderId intValue]];
            bean.orderStatus = [NSNumber numberWithInt:[model.orderStatus intValue]];
            bean.userId = [NSNumber numberWithInt:[userInfo.userId intValue]];
        
        }
        [arrayData addObject:bean];
        
    }
    
    _loadingBeanList = arrayData;
    NSLog(@"--%@",arrayData);
    __weak typeof(self)weakSelf = self;

    NSLog(@"---%@",_loadingBeanList);
    [orderPack confirmLoadingUsingPOSTWithAuthorization:@"Q" beans:_loadingBeanList completionHandler:^(SWGMessageResult *output, NSError *error) {
        if (!error) {
            if ([output.code intValue] == 0) {
                SubmittedSuccessfullyView *photoView = [SubmittedSuccessfullyView addSubmittedView];
                photoView.delegate = self;
                [photoView show];
                OrderManageModel* model = _dataArray[0];
                NSLog(@"---%@",weakSelf.navigationController.childViewControllers);

                if ([model.orderStatus isEqualToString:@"4"]) {
                    [weakSelf.navigationController popToViewController:weakSelf.navigationController.childViewControllers[1] animated:YES];

                }else
                {
                    [weakSelf.navigationController popViewControllerAnimated:YES];
                }
            }
        }else
        {
            NSData * data = error.userInfo[@"com.alamofire.serialization.response.error.data"];
            NSString * str = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
            NSLog(@"错误原因:%@",str);
        }
        
    }];
    
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _deliveryOrderArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *identifier1 = @"LoadingListCell";
    LoadingListCell *cell1 = [_tableView dequeueReusableCellWithIdentifier:identifier1];
    tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    
    cell1.selectionStyle = UITableViewCellSelectionStyleNone;
    NSMutableDictionary* dict = _deliveryOrderArray[indexPath.row];
    cell1.dict = dict;
    return cell1;
    
}



@end
