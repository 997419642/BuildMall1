//
//  PasswordChangeVC.m
//  BuildMall
//
//  Created by 51wood on 2019/1/22.
//  Copyright © 2019 51wood. All rights reserved.
//

#import "PasswordChangeVC.h"

@interface PasswordChangeVC ()
@property (weak, nonatomic) IBOutlet UIButton *sureBtn;

@end

@implementation PasswordChangeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.navigationItem.title = @"重置密码";
    _sureBtn.layer.masksToBounds = YES;
    _sureBtn.layer.cornerRadius = 5;
}

- (IBAction)forgetAction:(UIButton *)sender {
    
}

- (IBAction)sureAction:(id)sender {
}

@end
