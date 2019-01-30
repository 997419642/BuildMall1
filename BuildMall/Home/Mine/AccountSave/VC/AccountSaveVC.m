//
//  AccountSaveVC.m
//  BuildMall
//
//  Created by 51wood on 2019/1/22.
//  Copyright © 2019 51wood. All rights reserved.
//

#import "AccountSaveVC.h"
#import "WoodChatVC.h"
#import "PasswordChangeVC.h"
#import "PhoneChangeVC.h"

@interface AccountSaveVC ()

@end

@implementation AccountSaveVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.navigationItem.title = @"账号与安全";
    
    
}

- (IBAction)muLiaoAction:(UIButton *)sender {
    WoodChatVC* VC = [WoodChatVC new];
    
    [self.navigationController pushViewController:VC animated:YES];
}

- (IBAction)phoneAction:(UIButton *)sender {
    PhoneChangeVC* VC = [PhoneChangeVC new];
                        
    [self.navigationController pushViewController:VC animated:YES];
}

- (IBAction)passwordAction:(UIButton *)sender {
    PasswordChangeVC* VC = [PasswordChangeVC new];
    [self.navigationController pushViewController:VC animated:YES];
}

@end
