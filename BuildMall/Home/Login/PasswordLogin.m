//
//  PasswordLogin.m
//  BuildMall
//
//  Created by 51wood on 2018/11/19.
//  Copyright © 2018 51wood. All rights reserved.
//

#import "PasswordLogin.h"

@interface PasswordLogin ()
@property (weak, nonatomic) IBOutlet UITextField *phoneTF;
@property (weak, nonatomic) IBOutlet UITextField *passwordTf;
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;

@end

@implementation PasswordLogin

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    
    
    
    _phoneTF.clearButtonMode= UITextFieldViewModeWhileEditing;
    
    UIButton* backBtn  = [UIButton buttonWithType:(UIButtonTypeCustom)];

    backBtn.frame = CGRectMake(20, 20, 20, 35);
    [backBtn setImage:[UIImage imageNamed:@"icon人"] forState:UIControlStateNormal];
    [self.view addSubview:backBtn];
    [backBtn addTarget:self action:@selector(handleAction) forControlEvents:(UIControlEventTouchUpInside)];
    
    _loginBtn.layer.cornerRadius = 5;

    
}

-(void)handleAction
{
    [self dismissViewControllerAnimated:NO completion:NULL];

}
- (IBAction)xinXiLogin:(UIButton *)sender {
    
    [self dismissViewControllerAnimated:NO completion:NULL];
    
}
- (IBAction)forgetPassword:(UIButton *)sender {
}
- (IBAction)lookAction:(UIButton *)sender {
    
    
}
- (IBAction)nextAction:(UIButton *)sender {
}



@end
