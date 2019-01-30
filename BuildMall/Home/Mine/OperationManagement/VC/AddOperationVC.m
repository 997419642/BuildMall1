//
//  AddOperationVC.m
//  BuildMall
//
//  Created by 51wood on 2019/1/21.
//  Copyright © 2019 51wood. All rights reserved.
//

#import "AddOperationVC.h"

@interface AddOperationVC ()<UITextViewDelegate>
@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (weak, nonatomic) IBOutlet UILabel *numlabel;
@property (weak, nonatomic) IBOutlet UIButton *saveBtn;

@end

@implementation AddOperationVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.navigationItem.title = @"新增话术";
    
    _saveBtn.layer.masksToBounds = YES;
    _saveBtn.layer.cornerRadius = 5;
    
    _textView.text = @"编写您的话术内容";
    _textView.textColor = [UIColor colorWithHexString:@"#D5D5D5"];
    _textView.delegate = self;
    
}

- (void)textViewDidEndEditing:(UITextView *)textView
{
    if(textView.text.length < 1){
        textView.text = @"编写您的话术内容";
        textView.textColor = [UIColor lightGrayColor];
    }
}

- (void)textViewDidBeginEditing:(UITextView *)textView
{
    if([textView.text isEqualToString:@"编写您的话术内容"]){
        textView.text=@"";
        textView.textColor=[UIColor blackColor];
    }
}

- (IBAction)saveAction:(UIButton *)sender {
    
    
}


@end
