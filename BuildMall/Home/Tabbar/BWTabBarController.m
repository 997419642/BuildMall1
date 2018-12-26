//
//  BWTabBarController.m
//  BuildMall
//
//  Created by 51wood on 2018/11/7.
//  Copyright © 2018年 51wood. All rights reserved.
//

#import "BWTabBarController.h"

#import "MessageVC.h"
#import "AdressCustomerVC.h"
#import "WorkbenchVC.h"
#import "MineVC.h"
#import "BasicNavigationController.h"
#import "SendCardVC.h"

@interface BWTabBarController ()

@end

@implementation BWTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setUpItemTitleTextAttributes];
    
    //添加子控制器
    [self setupOneChildViewCOntroller];
    
}

-(void)setupOneChildViewCOntroller
{
    
    [self setupChildNavigationControllerWithClass:[BasicNavigationController class] tabBarImageName:@"message" rootViewControllerClass:[MessageVC class] rootViewControllerTitle:@"消息"];
    
    [self setupChildNavigationControllerWithClass:[BasicNavigationController class] tabBarImageName:@"person" rootViewControllerClass:[AdressCustomerVC class] rootViewControllerTitle:@"联系人"];

    [self setupChildNavigationControllerWithClass:[BasicNavigationController class] tabBarImageName:@"sendCard" rootViewControllerClass:[SendCardVC class] rootViewControllerTitle:@"发送名片"];
    
    [self setupChildNavigationControllerWithClass:[BasicNavigationController class] tabBarImageName:@"job" rootViewControllerClass:[WorkbenchVC class] rootViewControllerTitle:@"工作台"];
    
    [self setupChildNavigationControllerWithClass:[BasicNavigationController class] tabBarImageName:@"Mine" rootViewControllerClass:[MineVC class] rootViewControllerTitle:@"我"];
    
}

- (void)setupChildNavigationControllerWithClass:(Class)class tabBarImageName:(NSString *)name rootViewControllerClass:(Class)rootViewControllerClass rootViewControllerTitle:(NSString *)title
{
    
    UIViewController *rootVC = [[rootViewControllerClass alloc] init];
    rootVC.title = title;
    rootVC.view.backgroundColor = [UIColor whiteColor];
    UINavigationController *navVc = [[class  alloc] initWithRootViewController:rootVC];
    navVc.tabBarItem.image = [UIImage imageNamed:name];
    navVc.tabBarItem.selectedImage = [UIImage imageNamed:[NSString stringWithFormat:@"%@选中", name]];
    navVc.navigationBar.translucent = NO;
    [self addChildViewController:navVc];
    
}

-(void)setUpItemTitleTextAttributes
{ UITabBarItem *item = [UITabBarItem appearance];
    // 普通状态下的文字属性
    NSMutableDictionary *normalAttrs = [NSMutableDictionary dictionary];
    normalAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:12];
    normalAttrs[NSForegroundColorAttributeName] = [UIColor grayColor];
    [item setTitleTextAttributes:normalAttrs forState:UIControlStateNormal];
    
    // 选中状态下的文字属性
    NSMutableDictionary *selectedAttrs = [NSMutableDictionary dictionary];
    selectedAttrs[NSForegroundColorAttributeName] =  [UIColor colorWithHexString:@"52C9C5"];
    [item setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];
    
}



@end
