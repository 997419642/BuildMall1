//
//  ForwardingSetVC.m
//  BuildMall
//
//  Created by 51wood on 2019/1/25.
//  Copyright © 2019 51wood. All rights reserved.
//

#import "ForwardingSetVC.h"

@interface ForwardingSetVC ()
@property (weak, nonatomic) IBOutlet UISwitch *swich;

@end

@implementation ForwardingSetVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.navigationItem.title = @"禁止转发";
    
    
}


@end
