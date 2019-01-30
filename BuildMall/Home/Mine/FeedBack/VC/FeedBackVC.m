//
//  FeedBackVC.m
//  BuildMall
//
//  Created by 51wood on 2019/1/21.
//  Copyright © 2019 51wood. All rights reserved.
//

#import "FeedBackVC.h"
#import "FeedBackChooseView.h"
#import "ImageListView.h"

@interface FeedBackVC ()<UITextViewDelegate,FeedBackChooseViewDelegate>
@property (weak, nonatomic) IBOutlet UITextView *textView;

@property(nonatomic,strong)FeedBackChooseView * chooseView;
@property (weak, nonatomic) IBOutlet UILabel *sendLabel;
@property (weak, nonatomic) IBOutlet UIButton *saveBtn;
@property (weak, nonatomic) IBOutlet UIButton *oneBtn;
@property (weak, nonatomic) IBOutlet UIButton *twoBtn;
@property (weak, nonatomic) IBOutlet UIButton *threeBtn;
@property (weak, nonatomic) IBOutlet UIButton *fourBtn;

@end

@implementation FeedBackVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.navigationItem.title = @"意见反馈";
    _textView.text = @"对我们的产品或服务，你还有什么建议吗？你希望我们为你解决什么问题？请告诉我们...";
    _textView.textColor = [UIColor colorWithHexString:@"#D5D5D5"];
    _textView.delegate = self;
    
    ImageListView *imageList = [ImageListView new];
    imageList.banDel = NO;
    imageList.banMove = YES;
    imageList.maxImgCount = 4;
    [self.view addSubview:imageList];
    [imageList mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_sendLabel.mas_bottom).offset(25);
        make.left.right.equalTo(self.view).offset(0);
        make.bottom.equalTo(_saveBtn.mas_top).offset(-20);
    }];
    
    _oneBtn.layer.masksToBounds = YES;
    _oneBtn.layer.cornerRadius = 5;
    _oneBtn.backgroundColor = MINE_Color;
    [_oneBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    _oneBtn.selected = YES;
    
    _twoBtn.layer.masksToBounds = YES;
    _twoBtn.layer.cornerRadius = 5;
    
    _threeBtn.layer.masksToBounds = YES;
    _threeBtn.layer.cornerRadius = 5;
    
    _fourBtn.layer.masksToBounds = YES;
    _fourBtn.layer.cornerRadius = 5;
    
}

//-(void)didClickButton:(UIButton *)btn
//{
//    if (btn.tag == 0) {
//        _typeLabel.hidden = NO;
//        _typeLabel.text = @"功能异常";
//        [_chooseView removeFromSuperview];
//        [_chooseView.backgroupView removeFromSuperview];
//
//    }else if (btn.tag == 1)
//    {
//        _typeLabel.hidden = NO;
//        _typeLabel.text = @"客户服务";
//        [_chooseView removeFromSuperview];
//        [_chooseView.backgroupView removeFromSuperview];
//    }else if (btn.tag == 2)
//    {
//        _typeLabel.hidden = NO;
//        _typeLabel.text = @"产品建议";
//        [_chooseView removeFromSuperview];
//        [_chooseView.backgroupView removeFromSuperview];
//        
//    }else if (btn.tag == 3)
//    {
//        _typeLabel.hidden = NO;
//        _typeLabel.text = @"其他";
//        [_chooseView removeFromSuperview];
//        [_chooseView.backgroupView removeFromSuperview];
//    }
//    
//}

- (void)textViewDidEndEditing:(UITextView *)textView
{
    if(textView.text.length < 1){
        textView.text = @"对我们的产品或服务，你还有什么建议吗？你希望我们为你解决什么问题？请告诉我们...";
        textView.textColor = [UIColor lightGrayColor];
    }
}

- (void)textViewDidBeginEditing:(UITextView *)textView
{
    if([textView.text isEqualToString:@"对我们的产品或服务，你还有什么建议吗？你希望我们为你解决什么问题？请告诉我们..."]){
        textView.text=@"";
        textView.textColor=[UIColor colorWithHexString:@"666666"];
    }
}

//- (IBAction)ChooseTypeAction:(UIButton *)sender {
//    
//    _chooseView = [FeedBackChooseView FeedBackView];
//    _chooseView.delegate = self;
//    [_chooseView show];
//}



@end
