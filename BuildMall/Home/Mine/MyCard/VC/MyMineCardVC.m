//
//  MyMineCardVC.m
//  BuildMall
//
//  Created by 51wood on 2019/1/22.
//  Copyright © 2019 51wood. All rights reserved.
//

#import "MyMineCardVC.h"
#import "MyCardCollectionViewCell.h"
#import "EditorMyCardVC.h"
#import "AudioCell.h"
#import "AudioManager.h"

@interface MyMineCardVC ()<UICollectionViewDataSource, UICollectionViewDelegate>
{
    CGFloat _imgItemWH;

}

@property(nonatomic,strong)UIScrollView* scView;
@property(nonatomic, strong)UIButton *last;

@property(nonatomic,strong)UICollectionView *collectionView;


@end

@implementation MyMineCardVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.navigationItem.title = @"我的名片主页";
    UIBarButtonItem *backItem =[[UIBarButtonItem alloc]init];
    self.navigationItem.backBarButtonItem = backItem;
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:[UIImage imageNamed:@"icongood"] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(pressright) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:button];

    [self creatView];
}

-(void)pressright
{
    EditorMyCardVC* VC = [EditorMyCardVC new];
    [self.navigationController pushViewController:VC animated:YES];
}

-(void)creatView
{
    
    UIScrollView* scView = [UIScrollView new];
    [self.view addSubview:scView];
    _scView = scView;
    [scView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(self.view).offset(0);
        make.bottom.equalTo(self.view).offset(0);
    }];
    
    UIImageView* topImg = [UIImageView new];
    topImg.image = [UIImage imageNamed:@""];
    [_scView addSubview:topImg];
    [topImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.equalTo(_scView).offset(10);
        make.right.equalTo(_scView).offset(-10);
        make.height.equalTo(@(205));
        
    }];
    
    UILabel* comLable = [UILabel new];
    comLable.text = @"优推科技";
    comLable.font = [UIFont systemFontOfSize:14];
    comLable.textColor = [UIColor colorWithHexString:@"333333"];
    [topImg addSubview:comLable];
    [comLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(topImg).offset(20);
        make.right.equalTo(topImg).offset(-30);
        
    }];
    
    UIImageView* headImg = [UIImageView new];
    headImg.image = [UIImage imageNamed:@"avatar"];
    [topImg addSubview:headImg];
    [headImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(comLable.mas_bottom).offset(39);
        make.right.equalTo(topImg).offset(-30);
        make.width.height.equalTo(@(80));
    }];
    
    UILabel* nameLabel = [UILabel new];
    nameLabel.text = @"Steven";
    nameLabel.font = [UIFont systemFontOfSize:19];
    nameLabel.textColor = [UIColor colorWithHexString:@"333333"];
    [topImg addSubview:nameLabel];
    [nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(comLable.mas_bottom).offset(25);
        make.left.equalTo(topImg).offset(25);
    }];
    
    UILabel* posiLabel = [UILabel new];
    posiLabel.text = @"首席服务官";
    posiLabel.textColor = [UIColor colorWithHexString:@"333333"];
    posiLabel.font = [UIFont systemFontOfSize:13];
    [topImg addSubview:posiLabel];
    [posiLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(nameLabel.mas_bottom).offset(8);
        make.left.equalTo(topImg).offset(25);
    }];
    
    UILabel* phoneLabel = [UILabel new];
    phoneLabel.text = @"31234214321";
    phoneLabel.textColor = [UIColor colorWithHexString:@"666666"];
    phoneLabel.font = [UIFont systemFontOfSize:12];
    [topImg addSubview:phoneLabel];
    [phoneLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(posiLabel.mas_bottom).offset(25);
        make.left.equalTo(topImg).offset(25);
    }];
    
    UILabel* weiXinLabel = [UILabel new];
    weiXinLabel.text = @"31234214321";
    weiXinLabel.textColor = [UIColor colorWithHexString:@"666666"];
    weiXinLabel.font = [UIFont systemFontOfSize:12];
    [topImg addSubview:weiXinLabel];
    [weiXinLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(phoneLabel.mas_bottom).offset(6);
        make.left.equalTo(topImg).offset(25);
        
    }];
    
    UILabel* emilLabel = [UILabel new];
    emilLabel.textColor = [UIColor colorWithHexString:@"666666"];
    emilLabel.text = @"frfre@fre";
    emilLabel.font = [UIFont systemFontOfSize:12];
    [topImg addSubview:emilLabel];
    [emilLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weiXinLabel.mas_bottom).offset(6);
        make.left.equalTo(topImg).offset(25);
        
    }];
    
    UILabel* adressCardLabel = [UILabel new];
    adressCardLabel.textColor = [UIColor colorWithHexString:@"666666"];
    adressCardLabel.text = @"上海";
    adressCardLabel.font = [UIFont systemFontOfSize:12];
    [topImg addSubview:adressCardLabel];
    [adressCardLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(emilLabel.mas_bottom).offset(6);
        make.left.equalTo(topImg).offset(25);
        
    }];
    
    UIView* oneLine = [UIView new];
    [_scView addSubview:oneLine];
    oneLine.backgroundColor = [UIColor colorWithHexString:@"F5F5F5"];
    [oneLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(topImg.mas_bottom).offset(20);
        make.left.right.equalTo(_scView).offset(0);
        make.height.equalTo(@(5));
        make.centerX.equalTo(_scView);
    }];
    
    UILabel* infoLable = [UILabel new];
    infoLable.textColor = [UIColor colorWithHexString:@"999999"];
    infoLable.text = @"个人信息";
    infoLable.font = [UIFont systemFontOfSize:12];
    [_scView addSubview:infoLable];
    [infoLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(oneLine.mas_bottom).offset(10);
        make.left.equalTo(_scView).offset(15);
    }];
    
    UILabel* phoneInfo = [UILabel new];
    phoneInfo.text = @"手机";
    phoneInfo.textColor = [UIColor colorWithHexString:@"666666"];
    phoneInfo.font = [UIFont systemFontOfSize:14];
    [_scView addSubview:phoneInfo];
    [phoneInfo mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_scView).offset(15);
        make.top.equalTo(infoLable.mas_bottom).offset(10);
        
    }];
    
    UILabel* phoneNum = [UILabel new];
    phoneNum.text = @"1343543534";
    phoneNum.textColor = [UIColor colorWithHexString:@"333333"];
    phoneNum.font = [UIFont systemFontOfSize:14];
    [_scView addSubview:phoneNum];
    [phoneNum mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(phoneInfo.mas_right).offset(30);
        make.centerY.equalTo(phoneInfo);
    }];
    
    UILabel* weiXinLable = [UILabel new];
    weiXinLable.text = @"微信";
    weiXinLable.textColor = [UIColor colorWithHexString:@"666666"];
    weiXinLable.font = [UIFont systemFontOfSize:14];
    [_scView addSubview:weiXinLable];
    [weiXinLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_scView).offset(15);
        make.top.equalTo(phoneInfo.mas_bottom).offset(10);
    }];
    
    UILabel* weiXinNum = [UILabel new];
    weiXinNum.textColor = [UIColor colorWithHexString:@"333333"];
    weiXinNum.text = @"132434324";
    weiXinNum.font = [UIFont systemFontOfSize:14];
    [_scView addSubview:weiXinNum];
    [weiXinNum mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weiXinLable.mas_right).offset(30);
        make.centerY.equalTo(weiXinLable);
    }];
    
    UILabel* emeilInfo = [UILabel new];
    emeilInfo.text = @"邮箱";
    emeilInfo.textColor = [UIColor colorWithHexString:@"666666"];
    emeilInfo.font = [UIFont systemFontOfSize:14];
    [_scView addSubview:emeilInfo];
    [emeilInfo mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_scView).offset(15);
        make.top.equalTo(weiXinLable.mas_bottom).offset(10);
        
    }];
    
    UILabel* emeilNum = [UILabel new];
    emeilNum.text = @"frfre@fre";
    emeilNum.textColor = [UIColor colorWithHexString:@"333333"];
    emeilNum.font = [UIFont systemFontOfSize:14];
    [_scView addSubview:emeilNum];
    [emeilNum mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(emeilInfo.mas_right).offset(30);
        make.centerY.equalTo(emeilInfo);
    }];
    
    UILabel* adressLable = [UILabel new];
    adressLable.text = @"地区";
    adressLable.textColor = [UIColor colorWithHexString:@"666666"];
    adressLable.font = [UIFont systemFontOfSize:14];
    [_scView addSubview:adressLable];
    [adressLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(emeilInfo.mas_bottom).offset(10);
        make.left.equalTo(_scView).offset(15);
        
    }];
    
    UILabel* adressNum = [UILabel new];
    adressNum.textColor = [UIColor colorWithHexString:@"333333"];
    adressNum.text = @"上海市";
    adressNum.font = [UIFont systemFontOfSize:14];
    [_scView addSubview:adressNum];
    [adressNum mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(adressLable.mas_right).offset(30);
        make.centerY.equalTo(adressLable);
    }];
    
    UIView* twoLine = [UIView new];
    [_scView addSubview:twoLine];
    twoLine.backgroundColor = [UIColor colorWithHexString:@"F5F5F5"];

    [twoLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(adressLable.mas_bottom).offset(15);
        make.left.right.equalTo(_scView).offset(0);
        make.height.equalTo(@(5));
    }];
    
    UILabel* goodsLable = [UILabel new];
    goodsLable.text = @"我推荐的商品";
    goodsLable.textColor = [UIColor colorWithHexString:@"333333"];
    goodsLable.font = [UIFont systemFontOfSize:14];
    [_scView addSubview:goodsLable];
    [goodsLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(twoLine.mas_bottom).offset(10);
        make.left.equalTo(_scView).offset(15);
    }];
    
    UIView* backView = [UIView new];
    [_scView addSubview:backView];
    [backView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(goodsLable.mas_bottom).offset(15);
        make.left.equalTo(scView).offset(5);
        make.right.equalTo(scView).offset(-5);
        make.height.equalTo(@(120));
    }];
    

    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;

    CGFloat margin = 20;
    
    CGFloat itemWH = ((screenW - margin*6) / 5);
    _imgItemWH = itemWH;
    flowLayout.itemSize = CGSizeMake(itemWH, itemWH);
    flowLayout.minimumInteritemSpacing = margin;//行间距
    flowLayout.minimumLineSpacing = margin;//列间距
    flowLayout.sectionInset = UIEdgeInsetsMake(10, 20, 10, 20);
    _collectionView = [[UICollectionView alloc]initWithFrame:backView.bounds collectionViewLayout:flowLayout];
    
    _collectionView.dataSource = self;
    _collectionView.delegate = self;
    _collectionView.backgroundColor = [UIColor whiteColor];
    _collectionView.showsHorizontalScrollIndicator = NO;
    
    [_collectionView registerNib:[UINib nibWithNibName:@"MyCardCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"MyCardCollectionViewCell"];
    [backView addSubview:_collectionView];
    [_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.bottom.equalTo(backView).offset(0);
        
    }];
    
    
    
    UIView* threeLine = [UIView new];
    threeLine.backgroundColor = [UIColor colorWithHexString:@"F5F5F5"];

    [_scView addSubview:threeLine];
    [threeLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(backView.mas_bottom).offset(15);
        make.left.right.equalTo(_scView).offset(0);
        make.height.equalTo(@(5));
    }];
    
    
    UILabel* MyJianjieLabel = [UILabel new];
    MyJianjieLabel.text = @"个人简介";
    MyJianjieLabel.textColor = [UIColor colorWithHexString:@"333333"];
    MyJianjieLabel.font = [UIFont systemFontOfSize:15];
    [_scView addSubview:MyJianjieLabel];
    [MyJianjieLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(threeLine.mas_bottom).offset(15);
        make.left.equalTo(_scView).offset(15);
    }];
    
    UIImageView* headSmallImg = [UIImageView new];
    headSmallImg.image = [UIImage imageNamed:@"avatar"];
    [topImg addSubview:headSmallImg];
    [headSmallImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(MyJianjieLabel.mas_bottom).offset(30);
        make.left.equalTo(_scView).offset(15);
        make.width.height.equalTo(@(60));
    }];
    
//    UIButton* vedioBtn = [UIButton buttonWithType:UIButtonTypeCustom];
//    [_scView addSubview:vedioBtn];
//    [vedioBtn setBackgroundColor:MINE_Color];
//    [vedioBtn mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerY.equalTo(headSmallImg);
//        make.left.equalTo(headSmallImg.mas_right).offset(20);
//        make.height.equalTo(@(30));
//        make.width.equalTo(@(130));
//
//    }];
    
    
    AudioCell *cellvedio = [[AudioCell alloc] init];
    cellvedio.playButton.hidden = NO;
    [cellvedio.playButton setTitle:@"" forState:UIControlStateNormal];
    cellvedio.tipLabel.hidden = YES;
    [self.view addSubview:cellvedio];
    
    cellvedio.backgroundColor = [UIColor whiteColor];
    
    // // 赋值
//    NSString *audio =[[aryPhoto objectAtIndex:0] objectForKey:@"photoUrl"];
//    NSURL* audioUrl = [NSURL URLWithString:audio];
//    NSData* data = [[NSData alloc] initWithContentsOfURL:audioUrl];
//    NSString* filePath = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/audio.arm"];
//    [data writeToFile:filePath atomically:YES];
//    NSString *amrFiltPath = [[filePath stringByDeletingPathExtension] stringByAppendingPathExtension:@"wav"];
//    [[AudioManager manager] amrToWav:filePath wavSavePath:amrFiltPath];
//    cellvedio.audioFilePath = amrFiltPath;
    [_scView addSubview:cellvedio];
    [cellvedio mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(headSmallImg);
        make.left.equalTo(headSmallImg.mas_right).offset(20);
        make.height.equalTo(@(40));
        make.width.equalTo(@(130));
    }];
    
    
    UILabel* jianjieDetail = [UILabel new];
    jianjieDetail.text = @"大家好，我是XXX";
    jianjieDetail.textColor = [UIColor colorWithHexString:@"333333"];
    jianjieDetail.font = [UIFont systemFontOfSize:14];
    [_scView addSubview:jianjieDetail];
    [jianjieDetail mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_scView).offset(15);
        make.top.equalTo(headSmallImg.mas_bottom).offset(15);
    }];
    
    UILabel* vedioLable = [UILabel new];
    vedioLable.numberOfLines = 0;
    vedioLable.text = @"感谢您关注我的名片，在这里您可以详细了解我的名片，为你提供更便捷的服务。";
    vedioLable.textColor = [UIColor colorWithHexString:@"999999"];
    vedioLable.font = [UIFont systemFontOfSize:14];
    [_scView addSubview:vedioLable];
    [vedioLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(jianjieDetail.mas_bottom).offset(24);
        make.left.equalTo(_scView).offset(15);
        make.right.equalTo(_scView).offset(-15);
    }];
    
    UIView* vedioLine = [UIView new];
    vedioLine.backgroundColor = [UIColor colorWithHexString:@"F5F5F5"];
    
    [_scView addSubview:vedioLine];
    [vedioLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(vedioLable.mas_bottom).offset(15);
        make.left.equalTo(_scView).offset(15);
        make.right.equalTo(_scView).offset(-15);
        make.height.equalTo(@(1));
    }];
    
    
    NSArray* array = @[@"原则性强",@"原则性强",@"原则性强",@"原则性强",@"原则性强",@"原则性强",@"原则性强",@"原则性强"];
    NSMutableArray* dataArr = [NSMutableArray arrayWithArray:array];
    
    CGFloat marginX = 30;//按钮距离左边和右边的距离
    CGFloat gapX = 25; //左右按钮之间的距离
    CGFloat gapY = 10; //上下按钮之间的距离
    NSInteger col = 3;  //布局3列
    
    UIButton *last = nil;
    _last = last;
    
    for (int i=0; i<dataArr.count; i++) {
        
        UIButton* imgView = [UIButton new];
        [imgView setTitle:dataArr[i] forState:UIControlStateNormal];
        imgView.backgroundColor = [UIColor colorWithHexString:@"BCE6FD"];
        imgView.titleLabel.textColor = [UIColor colorWithHexString:@"333333"];
        imgView.titleLabel.font = [UIFont systemFontOfSize:14];
        imgView.layer.masksToBounds = YES;
        imgView.layer.cornerRadius = 10;
        [_scView addSubview:imgView];
        [imgView mas_makeConstraints:^(MASConstraintMaker *make) {
            
            float width = (screenW-60-25*2)/3;
            make.width.equalTo(@(width));
            
            make.height.equalTo(@(25));
            
            CGFloat top = 10 + (i / col) * (30 + gapY);
            
            make.top.equalTo(vedioLine.mas_bottom).offset(top);
            
            
            if (!last || (i%col) == 0) {
                make.left.mas_offset(marginX);
                
            }else
            {
                make.left.mas_equalTo(last.mas_right).offset(gapX);
            }
            
        }];
        
        last = imgView;
    }
    
    UIView* fourLine = [UIView new];
    fourLine.backgroundColor = [UIColor colorWithHexString:@"F5F5F5"];
    [_scView addSubview:fourLine];
    [fourLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(last.mas_bottom).offset(15);
        make.left.right.equalTo(_scView).offset(0);
        make.height.equalTo(@(5));
    }];
    
    
    
    UILabel* vudioLable = [UILabel new];
    vudioLable.text = @"我的视频";
    vudioLable.textColor = [UIColor colorWithHexString:@"333333"];

    vudioLable.font = [UIFont systemFontOfSize:15];
    [_scView addSubview:vudioLable];
    [vudioLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(fourLine.mas_bottom).offset(15);
        make.left.equalTo(_scView).offset(15);
    }];
    
    UIButton* vudioBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [vudioBtn setImage:[UIImage imageNamed:@"h1"] forState:UIControlStateNormal];
    [_scView addSubview:vudioBtn];
    [vudioBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_scView).offset(15);
        make.right.equalTo(_scView).offset(-15);
        make.top.equalTo(vudioLable.mas_bottom).offset(10);
        make.height.equalTo(@(200));
    }];
    
    UIView* fiveLabel = [UIView new];
    fiveLabel.backgroundColor = [UIColor colorWithHexString:@"F5F5F5"];
    [_scView addSubview:fiveLabel];
    [fiveLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(vudioBtn.mas_bottom).offset(20);
        make.left.right.equalTo(_scView).offset(0);
        make.height.equalTo(@(5));
    }];
    
    UILabel* pickerLabel = [UILabel new];
    pickerLabel.text = @"我的照片";
    pickerLabel.textColor = [UIColor colorWithHexString:@"333333"];
    pickerLabel.font = [UIFont systemFontOfSize:15];
    [_scView addSubview:pickerLabel];
    [pickerLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(fiveLabel.mas_bottom).offset(10);
        make.left.equalTo(_scView).offset(15);

    }];
    
    
    UIButton* pickerBtnOne = [UIButton buttonWithType:UIButtonTypeCustom];
    [pickerBtnOne setImage:[UIImage imageNamed:@"h1"] forState:UIControlStateNormal];
    [_scView addSubview:pickerBtnOne];
    [pickerBtnOne mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_scView).offset(15);
        make.right.equalTo(_scView).offset(-15);
        make.top.equalTo(pickerLabel.mas_bottom).offset(10);
        make.height.equalTo(@(200));
    }];
    
    UIButton* pickerBtnTwo = [UIButton buttonWithType:UIButtonTypeCustom];
    [pickerBtnTwo setImage:[UIImage imageNamed:@"h1"] forState:UIControlStateNormal];
    [_scView addSubview:pickerBtnTwo];
    [pickerBtnTwo mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_scView).offset(15);
        make.right.equalTo(_scView).offset(-15);
        make.top.equalTo(pickerBtnOne.mas_bottom).offset(10);
        make.height.equalTo(@(200));
        make.bottom.equalTo(_scView).offset(-20);

    }];
    
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 14;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    MyCardCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"MyCardCollectionViewCell" forIndexPath:indexPath];
    
    return cell;
}


-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    
}

- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout *)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(210,110);
}


@end
