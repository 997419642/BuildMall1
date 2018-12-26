//
//  WorkbenchVC.m
//  BuildMall
//
//  Created by 51wood on 2018/11/7.
//  Copyright © 2018年 51wood. All rights reserved.
//

#import "WorkbenchVC.h"
#import "CompanyGoodVC.h"
#import "BossReportVC.h"
#import "OrderManagementVC.h"
#import "MyAIDataVC.h"
#import "SalesReportsVC.h"

@interface WorkbenchVC ()

@end

@implementation WorkbenchVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
}
- (IBAction)dynamicAction:(UIButton *)sender {
    
    
}

- (IBAction)ERPAction:(UIButton *)sender {
}

- (IBAction)BOSSAction:(UIButton *)sender {
    BossReportVC* VC = [BossReportVC new];
    
    [self.navigationController pushViewController:VC animated:YES];
}
- (IBAction)companyGood:(UIButton *)sender {
    CompanyGoodVC* VC = [CompanyGoodVC new];
    
    [self.navigationController pushViewController:VC animated:YES];
}
- (IBAction)AIAction:(UIButton *)sender {
    
    MyAIDataVC* VC = [MyAIDataVC new];
    [self.navigationController pushViewController:VC animated:YES];
}
- (IBAction)salesAction:(UIButton *)sender {
    SalesReportsVC* VC = [SalesReportsVC new];
    
    [self.navigationController pushViewController:VC animated:YES];
}
- (IBAction)cardAction:(UIButton *)sender {
}
- (IBAction)orderAction:(UIButton *)sender {
    OrderManagementVC* VC  =[OrderManagementVC new];
    
    [self.navigationController pushViewController:VC animated:YES];
}
- (IBAction)myLogist:(UIButton *)sender {
}
- (IBAction)myAddAction:(id)sender {
}
- (IBAction)mallAction:(UIButton *)sender {
}

@end
