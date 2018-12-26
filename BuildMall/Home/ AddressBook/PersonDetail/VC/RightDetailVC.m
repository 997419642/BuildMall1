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

@interface RightDetailVC ()
@property (weak, nonatomic) IBOutlet UIButton *deleBtn;

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
    
}


@end
