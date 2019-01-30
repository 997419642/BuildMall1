//
//  PhoneChangeVC.m
//  BuildMall
//
//  Created by 51wood on 2019/1/22.
//  Copyright © 2019 51wood. All rights reserved.
//

#import "PhoneChangeVC.h"

@interface PhoneChangeVC ()
@property (weak, nonatomic) IBOutlet UITextField *phoneTF;
@property (weak, nonatomic) IBOutlet UITextField *VerificationCodeTF;
@property (weak, nonatomic) IBOutlet UITextField *passwordTF;
@property (weak, nonatomic) IBOutlet UIButton *sureBtn;

@end

@implementation PhoneChangeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.navigationItem.title = @"绑定设置";
    _sureBtn.layer.masksToBounds = YES;
    _sureBtn.layer.cornerRadius = 5;
}

- (IBAction)sureAction:(id)sender {
    
}


@end
