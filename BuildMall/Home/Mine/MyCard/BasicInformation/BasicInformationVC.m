//
//  BasicInformationVC.m
//  BuildMall
//
//  Created by 51wood on 2019/1/24.
//  Copyright © 2019 51wood. All rights reserved.
//

#import "BasicInformationVC.h"

@interface BasicInformationVC ()
@property (weak, nonatomic) IBOutlet UIButton *saveBtn;
@property (weak, nonatomic) IBOutlet UIView *backView;

@end

@implementation BasicInformationVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.navigationItem.title = @"编辑名片基本信息";
    
    _backView.layer.masksToBounds = YES;
    _backView.layer.cornerRadius = 5;
    _saveBtn.layer.masksToBounds = YES;
    _saveBtn.layer.cornerRadius = 5;
    
}

- (IBAction)saveAction:(id)sender {
    
}


@end
