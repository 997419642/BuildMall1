//
//  RightDetailVC.m
//  BuildMall
//
//  Created by 51wood on 2018/11/16.
//  Copyright © 2018年 51wood. All rights reserved.
//

#import "RightDetailVC.h"
#import "SetRemarkVC.h"
#import "complaintsVC.h"
#import "UIAlertView+NTESBlock.h"
#import "SVProgressHUD.h"
#import "UIView+Toast.h"


@interface RightDetailVC ()
@property (weak, nonatomic) IBOutlet UIButton *deleBtn;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *top;

@end

@implementation RightDetailVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.navigationItem.title = @"详细信息";
    _deleBtn.layer.cornerRadius =5;
    
}
- (IBAction)complaintsAction:(UIButton *)sender {
    complaintsVC* VC = [complaintsVC new];
    [self.navigationController pushViewController:VC animated:YES];

    
}
- (IBAction)RecommendAction:(UIButton *)sender {
    
}
- (IBAction)remarkAction:(UIButton *)sender {
    SetRemarkVC* VC = [SetRemarkVC new];
    [self.navigationController pushViewController:VC animated:YES];
}



- (IBAction)deleteAction:(UIButton *)sender {
    
    __weak typeof(self) wself = self;
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"删除好友" message:@"删除好友后，将同时解除双方的好友关系" delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    [alert showAlertWithCompletionHandler:^(NSInteger index) {
        if (index == 1) {
            [SVProgressHUD show];
            [[NIMSDK sharedSDK].userManager deleteFriend:wself.userId completion:^(NSError *error) {
                [SVProgressHUD dismiss];
                if (!error) {
                    [wself.view makeToast:@"删除成功"duration:2.0f position:CSToastPositionCenter];
//                    [wself refresh];
                }else{
                    [wself.view makeToast:@"删除失败"duration:2.0f position:CSToastPositionCenter];
                }
            }];
        }
    }];
}


@end
