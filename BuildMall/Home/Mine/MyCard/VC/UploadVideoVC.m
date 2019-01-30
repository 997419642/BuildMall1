//
//  UploadVideoVC.m
//  BuildMall
//
//  Created by 51wood on 2019/1/26.
//  Copyright © 2019 51wood. All rights reserved.
//

#import "UploadVideoVC.h"

@interface UploadVideoVC ()

@end

@implementation UploadVideoVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.navigationItem.title = @"上传视频";
    UIBarButtonItem *backItem =[[UIBarButtonItem alloc]init];
    self.navigationItem.backBarButtonItem = backItem;
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"下一步" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(pressright) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:button];
    
}

-(void)pressright
{
    
}

@end
