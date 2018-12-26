//
//  LoginVC.m
//  BuildMall
//
//  Created by 51wood on 2018/11/19.
//  Copyright © 2018 51wood. All rights reserved.
//

#import "LoginVC.h"
#import "PasswordLogin.h"

@interface LoginVC ()
@property (weak, nonatomic) IBOutlet UIButton *xeiyiBtn;
@property (weak, nonatomic) IBOutlet UITextField *phoneTF;
@property (weak, nonatomic) IBOutlet UIButton *nextBtn;

@end

@implementation LoginVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
        //利用富文本的方式增加button下划线
        
        NSMutableAttributedString *str = [[NSMutableAttributedString alloc]initWithString:_xeiyiBtn.titleLabel.text];
        
        NSRange strRange = {0,[str length]};
        
        [str addAttribute:NSUnderlineStyleAttributeName value:[NSNumber numberWithInteger:NSUnderlineStyleSingle] range:strRange];
        
        [_xeiyiBtn setAttributedTitle:str forState:UIControlStateNormal];
    
        _phoneTF.clearButtonMode=UITextFieldViewModeWhileEditing;
    
        _nextBtn.layer.cornerRadius = 5;
    
}

- (IBAction)passwordLogin:(UIButton *)sender {
    
    PasswordLogin* VC = [PasswordLogin new];
    [self presentViewController:VC
                       animated:NO
                     completion:nil];
}



@end
