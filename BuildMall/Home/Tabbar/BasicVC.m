//
//  BasicVC.m
//  BuildMall
//
//  Created by 51wood on 2018/11/7.
//  Copyright © 2018年 51wood. All rights reserved.
//

#import "BasicVC.h"

@interface BasicVC ()<MBProgressHUDDelegate>

{
    MBProgressHUD *hub;
}


@end

@implementation BasicVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
}
#pragma mark - 消息指示器
/**显示提示消息**/
-(void) showMessage:(NSString*)message{
    
    if (hub == nil) {
        hub = [[MBProgressHUD alloc] initWithView:self.view];
        hub.delegate=self;
    }
    [self.view addSubview:hub];
    hub.mode = MBProgressHUDModeText;
    hub.labelText = message;
    __block CGFloat seconds = 2;
    
    [hub showAnimated:NO whileExecutingBlock:^{
        sleep(seconds);
    } completionBlock:nil];
}


-(void) showAlert:(NSString*)message{
    [self showCustom:message img:[UIImage imageNamed:@"toast_alert"]];
}

-(void)showCustom:(NSString *)message img:(UIImage*)image{
    if (hub == nil) {
        hub = [[MBProgressHUD alloc] initWithView:self.view];
        hub.delegate=self;
    }
    [self.view addSubview:hub];
    hub.customView = [[UIImageView alloc] initWithImage:image];
    hub.mode = MBProgressHUDModeCustomView;
    hub.labelText = message;
    __block CGFloat seconds = 2;
    [hub showAnimated:NO whileExecutingBlock:^{
        sleep(seconds);
    } completionBlock:nil];
}

#pragma mark - 无数据时显示暂无

- (void)setNoDataAttentionView:(NSString *)attention
{
    UIView *bottomView = [self.view viewWithTag:9999];
    if (!bottomView) {
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 48, 90)];
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 48, 56)];
        imageView.image = [UIImage imageNamed:@"background_mei"];
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(-5, 66, 200, 24)];
        label.text = attention;
        label.font = [UIFont systemFontOfSize:15];
        label.textAlignment = NSTextAlignmentCenter;
        label.textColor = [UIColor lightGrayColor];
        label.centerX = view.centerX;
        
        [view addSubview:label];
        [view addSubview:imageView];
        bottomView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, screenW, screenH - 44)];
        bottomView.tag = 9999;
        bottomView.backgroundColor = [UIColor whiteColor];
        [bottomView addSubview:view];
        view.center = bottomView.center;
        view.top = 340/2;
    }
    [self.view addSubview:bottomView];
}

- (void)removeNoDataAttentionView{
    
    UIView *view = [self.view viewWithTag:9999];
    [view removeFromSuperview];
    view = nil;
}


@end
