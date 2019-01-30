//
//  EditorCardDetailVC.m
//  BuildMall
//
//  Created by 51wood on 2019/1/23.
//  Copyright © 2019 51wood. All rights reserved.
//

#import "EditorCardDetailVC.h"
#import "ImageListView.h"
#import "SKTagView.h"
#import "RecordingView.h"
#import "AudioManager.h"
#import "AudioCell.h"


@interface EditorCardDetailVC ()<UIAlertViewDelegate,RecordingViewDelegate>


@property(nonatomic,strong)UIScrollView* SCView;

@property (strong, nonatomic) SKTagView *tagView;
@property (strong, nonatomic)NSMutableArray* dataArr;

@property (weak, nonatomic) IBOutlet UIButton *saveBTn;



@end

@implementation EditorCardDetailVC
- (IBAction)saveAction:(UIButton *)sender {
    
    
}

//录音
-(void)saveActionaudio:(NSString *)record
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:record forKey:@"vedio"];

}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.navigationItem.title = @"个人简介/语音/标签/图片";
    
    _dataArr = [NSMutableArray array];
    _saveBTn.layer.masksToBounds = YES;
    _saveBTn.layer.cornerRadius = 5;
    [self creatView];
    
 
}

-(void)creatView
{
    _SCView = [UIScrollView new];
    [self.view addSubview:_SCView];
    [_SCView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(self.view).offset(0);
        make.bottom.equalTo(self.view).offset(-80);
    }];
    
    UILabel* introductionLable = [UILabel new];
    introductionLable.text = @"我的个人简介";
    introductionLable.textColor = [UIColor colorWithHexString:@"999999"];
    introductionLable.font = [UIFont systemFontOfSize:12];
    [_SCView addSubview:introductionLable];
    [introductionLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_SCView).offset(15);
        make.left.equalTo(_SCView).offset(15);
        
    }];
    
    UILabel* numLabel = [UILabel new];
    numLabel.textColor = [UIColor colorWithHexString:@"999999"];
    numLabel.text = @"0/2000";
    numLabel.font = [UIFont systemFontOfSize:12];
    [_SCView addSubview:numLabel];
    [numLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(_SCView).offset(-15);
        make.centerY.equalTo(introductionLable);
    }];
    
    UITextView* textView = [UITextView new];
    [_SCView addSubview:textView];

    textView.textColor = [UIColor colorWithHexString:@"999999"];
    textView.text = @"请输入简介...";
    [textView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_SCView).offset(10);
        make.right.equalTo(_SCView).offset(-10);
        make.height.equalTo(@(120));
        make.top.equalTo(introductionLable.mas_bottom).offset(10);
    }];
    
    UIButton* notCantBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [notCantBtn setTitle:@"不会写简介？戳这里>>" forState:UIControlStateNormal];
    [notCantBtn setTitleColor:MINE_Color forState:UIControlStateNormal];
    notCantBtn.titleLabel.font = [UIFont systemFontOfSize:12];
    [_SCView addSubview:notCantBtn];
    [notCantBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(_SCView).offset(-15);
        make.top.equalTo(textView.mas_bottom).offset(10);
    }];
    
    UIView* jianJieView = [UIView new];
    [_SCView addSubview:jianJieView];
    jianJieView.backgroundColor = [UIColor colorWithHexString:@"F5F5F5"];
    [jianJieView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(notCantBtn.mas_bottom).offset(15);
        make.left.right.equalTo(_SCView).offset(0);
        make.height.equalTo(@(5));
    }];
    
    
    UILabel* myVodieLabel = [UILabel new];
    myVodieLabel.text = @"我的声音";
    myVodieLabel.textColor = [UIColor colorWithHexString:@"999999"];
    myVodieLabel.font = [UIFont systemFontOfSize:12];
    [_SCView addSubview:myVodieLabel];
    [myVodieLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(jianJieView.mas_bottom).offset(15);
        make.left.equalTo(_SCView).offset(15);
        
    }];
    
    UIButton* vedioBtn = [UIButton new];
    [vedioBtn setTitle:@"开始录音" forState:UIControlStateNormal];
    [_SCView addSubview:vedioBtn];
    [vedioBtn addTarget:self action:@selector(vedioAction) forControlEvents:UIControlEventTouchUpInside];
    vedioBtn.backgroundColor = MINE_Color;
    vedioBtn.layer.masksToBounds = YES;
    vedioBtn.layer.cornerRadius = 15;

    [vedioBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(myVodieLabel.mas_bottom).offset(10);
        make.left.equalTo(_SCView).offset(38);
        make.right.equalTo(_SCView).offset(-38);
        make.height.equalTo(@(50));
    }];
    
    UIView* vedioView = [UIView new];
    [_SCView addSubview:vedioView];
    vedioView.backgroundColor = [UIColor colorWithHexString:@"F5F5F5"];
    [vedioView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(vedioBtn.mas_bottom).offset(15);
        make.left.right.equalTo(_SCView).offset(0);
        make.height.equalTo(@(5));
        make.centerX.equalTo(_SCView);
    }];
    
    UILabel* titleLabel = [UILabel new];
    titleLabel.text = @"我的标签";
    titleLabel.textColor = [UIColor colorWithHexString:@"999999"];
    titleLabel.font = [UIFont systemFontOfSize:12];
    [_SCView addSubview:titleLabel];
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(vedioView.mas_bottom).offset(15);
        make.left.equalTo(_SCView).offset(15);
    }];
    
    UILabel* titleNum = [UILabel new];
    titleNum.text = @"0/10";
    titleNum.textColor = [UIColor colorWithHexString:@"999999"];
    titleNum.font = [UIFont systemFontOfSize:10];
    [_SCView addSubview:titleNum];
    [titleNum mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(titleLabel);
        make.right.equalTo(_SCView).offset(-15);
    }];
    
    
    self.tagView = ({
        SKTagView *view0 = [SKTagView new];
        view0.backgroundColor = [UIColor whiteColor];
        view0.padding = UIEdgeInsetsMake(40, 20, 40, 20);
        view0.interitemSpacing = 15;
        view0.lineSpacing = 10;
        __block SKTagView *blockView = view0;
        view0.didTapTagAtIndex = ^(NSUInteger index){
            if (index == 0) {
                UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"输入标签" message:nil delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
                alertView.alertViewStyle = UIAlertViewStylePlainTextInput;
                [alertView show];
            }else
            {
                [blockView removeTagAtIndex:index];
            }
        };
        view0;
    });

    [_SCView addSubview:self.tagView];
    [_tagView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(titleNum.mas_bottom).offset(0);
        make.left.right.equalTo(_SCView).offset(0);
    }];


    NSArray* array = @[@""];
    _dataArr = [NSMutableArray arrayWithArray:array];

    //Add Tags
    [_dataArr enumerateObjectsUsingBlock: ^(NSString *text, NSUInteger idx, BOOL *stop) {
        SKTag *tag = [SKTag tagWithText: text];
        if (idx == 0) {
            tag.text = @"";
            tag.padding = UIEdgeInsetsMake(0, 0, 0, 0);
            UIImage *image = [UIImage imageNamed:@"ft_newLS_addSkill"];
            NSLog(@"%@",NSStringFromCGSize(image.size));
            tag.bgImg = image;
        }else{
            tag.textColor = [UIColor blueColor];
            tag.slcTextColor = [UIColor whiteColor];
            tag.fontSize = 15;
            tag.padding = UIEdgeInsetsMake(11, 12.5, 11, 12.5);
            tag.slcColor = [UIColor blueColor];
            tag.nrmColor = [UIColor clearColor];
            tag.borderWidth = 1;
            tag.borderColor = [UIColor blueColor];
        }
        [self.tagView addTag:tag];
    }];

    ImageListView *imageList = [ImageListView new];
    imageList.banDel = NO;
    imageList.banMove = YES;
    imageList.maxImgCount = 4;
    [_SCView addSubview:imageList];
    imageList.backgroundColor = [UIColor redColor];
    [imageList mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(titleLabel.mas_bottom).offset(25);
        make.left.right.equalTo(_SCView).offset(0);
        make.bottom.equalTo(_SCView).offset(-20);
    }];
    
}

-(void)vedioAction
{
    RecordingView* View = [RecordingView recordingView];
    View.delegate = self;
    [View show];
    
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 1) {
        SKTag *tag = [SKTag tagWithText: [alertView textFieldAtIndex:0].text];
        tag.textColor = [UIColor blueColor];
        tag.slcTextColor = [UIColor whiteColor];
        tag.fontSize = 15;
        tag.padding = UIEdgeInsetsMake(11, 12.5, 11, 12.5);
        tag.slcColor = [UIColor blueColor];
        tag.nrmColor = [UIColor clearColor];
        tag.borderWidth = 1;
        tag.borderColor = [UIColor blueColor];
        
        [self.tagView insertTag:tag atIndex:1];
    }
}


@end
