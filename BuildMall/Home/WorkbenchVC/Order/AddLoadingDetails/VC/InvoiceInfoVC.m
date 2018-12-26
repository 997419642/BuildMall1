//
//  InvoiceInfoVC.m
//  BuildMall
//
//  Created by 51wood on 2018/11/29.
//  Copyright © 2018 51wood. All rights reserved.
//

#import "InvoiceInfoVC.h"

@interface InvoiceInfoVC ()
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIButton *sureBtn;
@property (weak, nonatomic) IBOutlet UILabel *orderNum;
@property (weak, nonatomic) IBOutlet UILabel *timelable;
@property (weak, nonatomic) IBOutlet UILabel *carNum;
@property (weak, nonatomic) IBOutlet UILabel *DistributionQuantity;
@property (weak, nonatomic) IBOutlet UILabel *orderAmount;
@property (weak, nonatomic) IBOutlet UILabel *companyName;
@property (weak, nonatomic) IBOutlet UILabel *einLable;
@property (weak, nonatomic) IBOutlet UILabel *bankName;
@property (weak, nonatomic) IBOutlet UILabel *bankNun;
@property (weak, nonatomic) IBOutlet UILabel *phoneLable;
@property (weak, nonatomic) IBOutlet UILabel *adressLable;
@property (weak, nonatomic) IBOutlet UILabel *mailingAddress;
@property (weak, nonatomic) IBOutlet UILabel *namePhone;
@property (weak, nonatomic) IBOutlet UITextField *invoiceNum;
@property (weak, nonatomic) IBOutlet UITextField *invoicePrice;
@property (weak, nonatomic) IBOutlet UITextField *courierNum;

@end

@implementation InvoiceInfoVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.navigationItem.title = @"发票信息";
    
    _sureBtn.layer.masksToBounds = YES;
    _sureBtn.layer.cornerRadius = 4;
    
}

- (IBAction)sureAction:(UIButton *)sender {
    
    
}


@end
