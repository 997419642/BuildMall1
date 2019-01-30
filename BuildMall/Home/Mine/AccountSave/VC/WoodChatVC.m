//
//  WoodChatVC.m
//  BuildMall
//
//  Created by 51wood on 2019/1/22.
//  Copyright © 2019 51wood. All rights reserved.
//

#import "WoodChatVC.h"
#import "ErrorMessageView.h"

@interface WoodChatVC ()
@property (weak, nonatomic) IBOutlet UIButton *saveBtn;

@end

@implementation WoodChatVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.title = @"修改账号";
    _saveBtn.layer.masksToBounds= YES;
    _saveBtn.layer.cornerRadius = 5;
}
- (IBAction)saveAction:(UIButton *)sender {
    ErrorMessageView* view = [ErrorMessageView errorMessageView];
    [view show];
}



@end
