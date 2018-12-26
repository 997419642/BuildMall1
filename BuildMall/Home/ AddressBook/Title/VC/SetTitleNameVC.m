//
//  SetTitleNameVC.m
//  BuildMall
//
//  Created by 51wood on 2018/11/17.
//  Copyright © 2018年 51wood. All rights reserved.
//

#import "SetTitleNameVC.h"

@interface SetTitleNameVC ()
@property (weak, nonatomic) IBOutlet UITextField *nameTF;

@end

@implementation SetTitleNameVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.navigationItem.title = @"新建标签";
    
    UIBarButtonItem *backItem =[[UIBarButtonItem alloc]init];
    self.navigationItem.backBarButtonItem = backItem;
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"确定" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(pressRight) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:button];
    
    
}

-(void)pressRight
{
    
}

@end
