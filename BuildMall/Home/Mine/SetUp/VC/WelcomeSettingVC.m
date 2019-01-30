//
//  WelcomeSettingVC.m
//  BuildMall
//
//  Created by 51wood on 2019/1/25.
//  Copyright © 2019 51wood. All rights reserved.
//

#import "WelcomeSettingVC.h"

@interface WelcomeSettingVC ()
@property (weak, nonatomic) IBOutlet UITextView *welcomTextView;
@property (weak, nonatomic) IBOutlet UIButton *saveBtn;

@end

@implementation WelcomeSettingVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.navigationItem.title = @"欢迎语设置";
    _saveBtn.layer.masksToBounds = YES;
    _saveBtn.layer.cornerRadius = 5;
    
    _welcomTextView.layer.masksToBounds = YES;
    _welcomTextView.layer.cornerRadius = 5;
}

- (IBAction)saveAction:(UIButton *)sender {
    
    
}


@end
