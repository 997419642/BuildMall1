//
//  complaintsVC.m
//  BuildMall
//
//  Created by 51wood on 2018/11/16.
//  Copyright © 2018年 51wood. All rights reserved.
//

#import "complaintsVC.h"
#import "ImageListView.h"


@interface complaintsVC ()
@property (weak, nonatomic) IBOutlet UIButton *submitBtn;
@property (weak, nonatomic) IBOutlet UITextView *ComplaintsTF;
@property (weak, nonatomic) IBOutlet UILabel *oneLable;
@property (weak, nonatomic) IBOutlet UILabel *twoLable;
@property (weak, nonatomic) IBOutlet UILabel *threeLable;
@property (weak, nonatomic) IBOutlet UILabel *fourLable;
@property (weak, nonatomic) IBOutlet UILabel *fivelable;

@property(nonatomic,strong)UIButton* selectBtn;
@property (weak, nonatomic) IBOutlet UIButton *oneBtn;

@property(nonatomic,strong)ImageListView *footerView;

@property(nonatomic,strong)NSMutableArray *temp;
@property(nonatomic,strong)NSMutableArray *imageListViewArray;

@property(nonatomic,strong)ImageListView *imageList;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *top;
@property (weak, nonatomic) IBOutlet UILabel *pickerLable;

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UILabel *chooseLable;

@end

@implementation complaintsVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.navigationItem.title = @"投诉";
    _selectBtn = _oneBtn;
    _submitBtn.layer.cornerRadius = 5;
    
    ImageListView *imageList = [ImageListView new];
//    [self.imageListViewArray addObject:imageList];
    imageList.banDel = NO;
    imageList.banMove = YES;
    imageList.maxImgCount = 10;

    _imageList = imageList;
    
    [_scrollView addSubview:imageList];
//    imageList.frame = CGRectMake(0, 0, screenW, _threeView.height);

    [imageList mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_pickerLable.mas_bottom).offset(10);
        make.left.right.equalTo(_scrollView).offset(0);
        make.bottom.equalTo(_chooseLable.mas_top).offset(-20);
    }];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeStatus4) name:@"paySucceedReturen" object:nil];

}

-(void)changeStatus4
{
    if (_imageList.num!=0) {
//        _threeView.height = _imageList.num;

        _top.constant = _imageList.num;
    }
}

- (IBAction)submitAction:(UIButton *)sender {
    
    
}

- (IBAction)oneBtnAction:(UIButton *)sender {
    if (self.selectBtn == sender) {
        return;
    }
    
    self.selectBtn.selected = !self.selectBtn.selected;
    if (sender.selected == NO) {
        sender.selected = YES;
        if (sender.tag == 0) {
            
        }else if(sender.tag == 1){
            
        }
        
    }else
    {
        sender.selected = NO;
    }
    
    self.selectBtn = sender;

}

- (IBAction)ComplaintsProcedureAction:(UIButton *)sender {
    
    
}


@end
