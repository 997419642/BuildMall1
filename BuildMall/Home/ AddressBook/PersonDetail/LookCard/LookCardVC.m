//
//  LookCardVC.m
//  BuildMall
//
//  Created by 51wood on 2018/11/17.
//  Copyright © 2018年 51wood. All rights reserved.
//

#import "LookCardVC.h"

@interface LookCardVC ()
@property (weak, nonatomic) IBOutlet UIImageView *imgView;

@end

@implementation LookCardVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    
//    UITapGestureRecognizer *r5 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(doTapChange)];
//    r5.numberOfTapsRequired = 2;
//    [_imgView addGestureRecognizer:r5];
}
- (IBAction)lookCard:(id)sender {
    [self doTapChange];
    
}

-(void)doTapChange{
 
    
}

@end
