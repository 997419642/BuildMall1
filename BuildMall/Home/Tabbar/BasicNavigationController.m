
//
//  BasicNavigationController.m
//  BuildMall
//
//  Created by 51wood on 2018/11/8.
//  Copyright © 2018年 51wood. All rights reserved.
//

#import "BasicNavigationController.h"

@interface BasicNavigationController ()<UINavigationControllerDelegate>
@property (nonatomic, weak) id PopDelegate;

@end

@implementation BasicNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

}


- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    UIBarButtonItem *backItem =[[UIBarButtonItem alloc]init];
    backItem.title =@"返回";
    viewController.navigationItem.backBarButtonItem = backItem;
    if (self.childViewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
        [UITabBar appearance].translucent = NO;

        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(0, 0, 40, 40);

        [button setImage:[UIImage imageNamed:@"n_back_arrow"] forState:UIControlStateNormal];

        [button addTarget:self action:@selector(goBack) forControlEvents:UIControlEventTouchUpInside];
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:button];
        ;
    }
    [super pushViewController:viewController animated:YES];
}

- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (viewController == self.viewControllers[0]) {
        self.interactivePopGestureRecognizer.delegate = self.PopDelegate;
    }else{
        self.interactivePopGestureRecognizer.delegate = nil;
    }
}

-(void)goBack{
    if (self.willBackBlock) {
        if (self.willBackBlock()) {
            [self popViewControllerAnimated:YES];
        }
    }else{
        [self popViewControllerAnimated:YES];
    }
}


@end
