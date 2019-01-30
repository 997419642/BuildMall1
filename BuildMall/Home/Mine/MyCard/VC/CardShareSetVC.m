//
//  CardShareSetVC.m
//  BuildMall
//
//  Created by 51wood on 2019/1/26.
//  Copyright © 2019 51wood. All rights reserved.
//

#import "CardShareSetVC.h"

@interface CardShareSetVC ()
@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (weak, nonatomic) IBOutlet UIImageView *xiaoguoImg;

@end

@implementation CardShareSetVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.navigationItem.title = @"名片分享设置";
    
//    _textView.textColor = [UIColor colorWithHexString:@"999999"];
}
- (IBAction)reductionBtnAction:(id)sender {
    
}

- (IBAction)notCantAction:(id)sender {
    
}


@end
