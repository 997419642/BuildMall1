//
//  DSendynamicVC.m
//  BuildMall
//
//  Created by 51wood on 2019/1/18.
//  Copyright © 2019 51wood. All rights reserved.
//

#import "SendDynamicVC.h"
#import "ImageListView.h"

@interface SendDynamicVC ()<UITextViewDelegate>
@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end

@implementation SendDynamicVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.navigationItem.title = @"发动态";
    UIBarButtonItem *backItem =[[UIBarButtonItem alloc]init];
    self.navigationItem.backBarButtonItem = backItem;
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"发动态" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(onDone) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:button];
    
    
    _textView.text = @"这一刻的想法...";
    _textView.textColor = [UIColor lightGrayColor];
    _textView.delegate = self;

    
    if (_isPhoto == YES) {
        //发布图文
        ImageListView *imageList = [ImageListView new];
        imageList.banDel = NO;
        imageList.banMove = YES;
        imageList.maxImgCount = 9;
//        imageList.isSendDynamic = YES;
        [self.view addSubview:imageList];
        [imageList mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_textView.mas_bottom).offset(25);
            make.left.right.equalTo(self.view).offset(0);
            make.bottom.equalTo(self.view).offset(-120);
        }];
    }else
    {
        //发布视频
        UIButton* videoBtn = [UIButton new];
        [videoBtn setImage:[UIImage imageNamed:@"iconadd"] forState:UIControlStateNormal];
        [self.view addSubview:videoBtn];
        [videoBtn addTarget:self action:@selector(videoAction) forControlEvents:UIControlEventTouchUpInside];
        [videoBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_textView.mas_bottom).offset(10);
            make.left.equalTo(self.view).offset(20);
            make.width.height.equalTo(@(60));
        }];
    }
}

-(void)videoAction
{

}

-(void)onDone
{
    
}

- (void)textViewDidEndEditing:(UITextView *)textView
{
    if(textView.text.length < 1){
        textView.text = @"这一刻的想法...";
        textView.textColor = [UIColor lightGrayColor];
    }
}
- (void)textViewDidBeginEditing:(UITextView *)textView
{
    if([textView.text isEqualToString:@"这一刻的想法..."]){
        textView.text=@"";
        textView.textColor=[UIColor blackColor];
    }
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}


@end
