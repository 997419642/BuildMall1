//
//  InteractiveSetVC.m
//  BuildMall
//
//  Created by 51wood on 2019/1/25.
//  Copyright © 2019 51wood. All rights reserved.
//

#import "InteractiveSetVC.h"

@interface InteractiveSetVC ()
@property (weak, nonatomic) IBOutlet UIButton *oneBtn;

@end

@implementation InteractiveSetVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    
    self.navigationItem.title = @"互动窗口";
    
    _oneBtn.layer.borderWidth = 1;
    _oneBtn.layer.borderColor = [UIColor colorWithHexString:@"999999"].CGColor;
    _oneBtn.layer.masksToBounds = YES;
    _oneBtn.layer.cornerRadius = 10;
    
    
    CGFloat width = (_oneBtn.titleLabel.text.length + 2) * 12;
    
    _oneBtn.size = CGSizeMake(width+50, 25);
    
    CGFloat img_W = _oneBtn.imageView.frame.size.width;
    CGFloat tit_W = _oneBtn.titleLabel.frame.size.width;
    _oneBtn.titleEdgeInsets = (UIEdgeInsets){
        .top    = 0,
        .left   = - (img_W + 10 / 2),
        .bottom = 0,
        .right  =   (img_W + 10 / 2),
    };

    _oneBtn.imageEdgeInsets = (UIEdgeInsets){
        .top    = 0,
        .left   =   (tit_W + 10 / 2),
        .bottom = 0,
        .right  = - (tit_W + 10 / 2),
    };

    [self creatView];
}

-(void)creatView
{
    
}


@end
