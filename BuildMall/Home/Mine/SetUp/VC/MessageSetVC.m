//
//  MessageSetVC.m
//  BuildMall
//
//  Created by 51wood on 2019/1/25.
//  Copyright © 2019 51wood. All rights reserved.
//

#import "MessageSetVC.h"
#import "InteractiveSetVC.h"
#import "WelcomeSettingVC.h"

@interface MessageSetVC ()
@property (weak, nonatomic) IBOutlet UISwitch *swich;

@end

@implementation MessageSetVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.navigationItem.title = @"消息设置";
    
    
}


- (IBAction)welcomeAction:(UIButton *)sender {
    WelcomeSettingVC* VC = [WelcomeSettingVC new];
    
    [self.navigationController pushViewController:VC animated:YES];
    
}
- (IBAction)interactiveAction:(UIButton *)sender {
    
    InteractiveSetVC* VC = [InteractiveSetVC new];
    [self.navigationController pushViewController:VC animated:YES];
}

@end
