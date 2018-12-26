//
//  CompanyGoodDetailVC.m
//  BuildMall
//
//  Created by 51wood on 2018/11/30.
//  Copyright © 2018 51wood. All rights reserved.
//

#import "CompanyGoodDetailVC.h"
#import "SDPhotoBrowser.h"
#import <UIImageView+WebCache.h>
#import "CompanyDetailCollcCell.h"
#import "ServiceGuaranteeView.h"
#import "ProductParametersView.h"
#import "SpecificationsView.h"


@interface CompanyGoodDetailVC ()<SDPhotoBrowserDelegate,UIScrollViewDelegate,UICollectionViewDelegateFlowLayout,UICollectionViewDataSource,ServiceGuaranteeViewDelegate,ProductParametersViewDelegate>


@property (weak, nonatomic) IBOutlet UIImageView *likeImg;

//@property(nonatomic,strong)UIScrollView* scrollView;

@property(nonatomic,strong)UIScrollView* topScrollView;

@property(nonatomic,strong)UILabel* numLable;
@property (weak, nonatomic) IBOutlet UIScrollView *boomSC;

@property (nonatomic, strong) UICollectionView *collectionView;



@end

@implementation CompanyGoodDetailVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.navigationItem.title = @"商品详情";
    
//    _scrollView = [UIScrollView new];
//
//    [self.view addSubview:_scrollView];
//    [_scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.right.top.equalTo(_scrollView).offset(0);
//        make.bottom.equalTo(self.view).offset(38);
//    }];
    
    [self creatTopScrollView];
    
    [self creatDetailView];
    
}

-(void)creatDetailView
{
    UILabel* nameLable = [UILabel new];
    nameLable.text = @"俄罗斯大牌品质，MM特价促销";
    nameLable.textColor = [UIColor colorWithHexString:@"333333"];
    nameLable.font = [UIFont systemFontOfSize:16];
    [_boomSC addSubview:nameLable];
    [nameLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_topScrollView.mas_bottom).offset(20);
        make.left.equalTo(_boomSC).offset(16);
        
    }];
    
    
    UILabel* detailLable = [UILabel new];
    detailLable.text = @"俄罗斯SF级云杉 44*100";
    detailLable.textColor = [UIColor colorWithHexString:@"B8B8B8"];
    detailLable.font = [UIFont systemFontOfSize:13];
    [_boomSC addSubview:detailLable];
    [detailLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(nameLable.mas_bottom).offset(6);
        make.left.equalTo(_boomSC).offset(20);
        
    }];
    
    
    UILabel* priceLable = [UILabel new];
    priceLable.text = @"¥ 1650-1750";
    priceLable.textColor = [UIColor colorWithHexString:@"E71340"];
    priceLable.font = [UIFont systemFontOfSize:18];
    [_boomSC addSubview:priceLable];
    [priceLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(detailLable.mas_bottom).offset(12);
        make.left.equalTo(_boomSC).offset(20);
        
    }];
    
    
    UILabel* adressLable = [UILabel new];
    adressLable.text = @"江苏太仓";
    adressLable.textColor = [UIColor colorWithHexString:@"B8B8B8"];
    adressLable.font = [UIFont systemFontOfSize:13];
    [_boomSC addSubview:adressLable];
    [adressLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(_boomSC).offset(-20);
        make.centerY.equalTo(priceLable);
        
    }];
    
    UIView* oneView = [UIView new];
    oneView.backgroundColor = [UIColor colorWithHexString:@"F5F5F5"];
    [_boomSC addSubview:oneView];
    [oneView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.right.equalTo(_boomSC).offset(0);
        make.top.equalTo(priceLable.mas_bottom).offset(10);
        make.height.equalTo(@(10));
        make.centerX.equalTo(_boomSC);
        
    }];
    
    
    UILabel* parameLable = [UILabel new];
    parameLable.text = @"参数";
    parameLable.textColor = [UIColor colorWithHexString:@"B8B8B8"];
    parameLable.font = [UIFont systemFontOfSize:13];
    [_boomSC addSubview:parameLable];
    [parameLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_boomSC).offset(20);
        make.top.equalTo(oneView.mas_bottom).offset(10);
        
    }];
    
    
    UILabel* parameThreeLable = [UILabel new];
    parameThreeLable.text = @"名片   品牌    等级...";
    parameThreeLable.textColor = [UIColor colorWithHexString:@"B8B8B8"];
    parameThreeLable.font = [UIFont systemFontOfSize:11];
    [_boomSC addSubview:parameThreeLable];
    [parameThreeLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(parameLable.mas_right).offset(17);
        make.centerY.equalTo(parameLable);
        
    }];
    

    UIButton* parameBtn = [UIButton new];
    [_boomSC addSubview:parameBtn];
    [parameBtn addTarget:self action:@selector(parameAction) forControlEvents:UIControlEventTouchUpInside];
    [parameBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(oneView.mas_bottom).offset(0);
        make.left.right.equalTo(_boomSC).offset(0);
        make.height.equalTo(@(40));
    }];
    
    
    UIView* twoView = [UIView new];
    twoView.backgroundColor = [UIColor colorWithHexString:@"F5F5F5"];
    [_boomSC addSubview:twoView];
    [twoView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.right.equalTo(_boomSC).offset(0);
        make.top.equalTo(parameLable.mas_bottom).offset(10);
        make.height.equalTo(@(10));
        
    }];
    
    
    UILabel* specificatLable = [UILabel new];
    specificatLable.textColor = [UIColor colorWithHexString:@"B8B8B8"];
    specificatLable.text = @"规格";
    specificatLable.font = [UIFont systemFontOfSize:11];
    [_boomSC addSubview:specificatLable];
    [specificatLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_boomSC).offset(20);
        make.top.equalTo(twoView.mas_bottom).offset(10);
    }];
    
    UIButton* specifiBtn = [UIButton new];
    [_boomSC addSubview:specifiBtn];
    [specifiBtn addTarget:self action:@selector(specifiAction) forControlEvents:UIControlEventTouchUpInside];
    [specifiBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(_boomSC).offset(0);
        make.top.equalTo(twoView.mas_bottom).offset(0);
        make.height.equalTo(@(40));
    }];
    
    UIView* threeView = [UIView new];
    threeView.backgroundColor = [UIColor colorWithHexString:@"F5F5F5"];
    [_boomSC addSubview:threeView];
    [threeView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.right.equalTo(_boomSC).offset(0);
        make.top.equalTo(specificatLable.mas_bottom).offset(10);
        make.height.equalTo(@(10));
        
    }];
    
    UIView* dotView = [UIView new];
    dotView.backgroundColor = [UIColor colorWithHexString:@"E71340"];
    [_boomSC addSubview:dotView];
    dotView.layer.masksToBounds = YES;
    dotView.layer.cornerRadius = 2;
    [dotView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_boomSC).offset(20);
        make.width.height.equalTo(@(4));
        make.top.equalTo(threeView.mas_bottom).offset(15);

    }];
    
    
    UILabel* specificLable = [UILabel new];
    specificLable.text = @"正品保证";
    specificLable.textColor = [UIColor colorWithHexString:@"333333"];
    specificLable.font = [UIFont systemFontOfSize:13];
    [_boomSC addSubview:specificLable];
    [specificLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(dotView.mas_right).offset(7);
        make.top.equalTo(threeView.mas_bottom).offset(10);
    }];
    
    
    UIView* dotTwoView = [UIView new];
    dotTwoView.backgroundColor = [UIColor colorWithHexString:@"E71340"];
    [_boomSC addSubview:dotTwoView];
    dotTwoView.layer.masksToBounds = YES;
    dotTwoView.layer.cornerRadius = 2;
    [dotTwoView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(specificLable.mas_right).offset(36);
        make.width.height.equalTo(@(4));
        make.top.equalTo(threeView.mas_bottom).offset(15);
        
    }];
    
    
    UILabel* specificTwoLable = [UILabel new];
    specificTwoLable.text = @"加工服务";
    specificLable.textColor = [UIColor colorWithHexString:@"333333"];
    specificTwoLable.font = [UIFont systemFontOfSize:13];
    [_boomSC addSubview:specificTwoLable];
    [specificTwoLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(dotTwoView.mas_right).offset(7);
        make.top.equalTo(threeView.mas_bottom).offset(10);
    }];
    
    
    UIView* dotThreeView = [UIView new];
    dotThreeView.backgroundColor = [UIColor colorWithHexString:@"E71340"];
    [_boomSC addSubview:dotThreeView];
    dotThreeView.layer.masksToBounds = YES;
    dotThreeView.layer.cornerRadius = 2;
    [dotThreeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(specificTwoLable.mas_right).offset(36);
        make.width.height.equalTo(@(4));
        make.top.equalTo(threeView.mas_bottom).offset(15);
        
    }];
    
    
    UILabel* specificThreeLable = [UILabel new];
    specificThreeLable.text = @"物流服务";
    specificThreeLable.textColor = [UIColor colorWithHexString:@"333333"];
    specificThreeLable.font = [UIFont systemFontOfSize:13];
    [_boomSC addSubview:specificThreeLable];
    [specificThreeLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(dotThreeView.mas_right).offset(7);
        make.top.equalTo(threeView.mas_bottom).offset(10);
    }];
    
    UIButton* dotBtn = [UIButton new];
    [_boomSC addSubview:dotBtn];
    [dotBtn addTarget:self action:@selector(dotAction) forControlEvents:UIControlEventTouchUpInside];
    [dotBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(threeView.mas_bottom).offset(0);
        make.left.right.equalTo(_boomSC).offset(0);
        make.height.equalTo(@(40));
    }];
    
    
    UIView* fourView = [UIView new];
    fourView.backgroundColor = [UIColor colorWithHexString:@"F5F5F5"];
    [_boomSC addSubview:fourView];
    [fourView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.right.equalTo(_boomSC).offset(0);
        make.top.equalTo(specificThreeLable.mas_bottom).offset(10);
        make.height.equalTo(@(10));
        
    }];
    
    UIImageView* headImg = [UIImageView new];
    headImg.image = [UIImage imageNamed:@"bitmap_"];
    [_boomSC addSubview:headImg];
    [headImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(fourView.mas_bottom).offset(17);
        make.left.equalTo(_boomSC).offset(20);
        make.width.height.equalTo(@(51));
    }];
    
    
    UILabel* comNameLable = [UILabel new];
    comNameLable.text = @"上海XX木业企业店";
    comNameLable.textColor = [UIColor colorWithHexString:@"333333"];
    comNameLable.font = [UIFont systemFontOfSize:14];
    [_boomSC addSubview:comNameLable];
    [comNameLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(headImg.mas_right).offset(8);
        make.top.equalTo(fourView.mas_bottom).offset(20);
    }];
    
    UILabel* redLable = [UILabel new];
    redLable.textColor = [UIColor whiteColor];
    redLable.text = @"企业认证";
    redLable.textAlignment = NSTextAlignmentCenter;
    redLable.font = [UIFont systemFontOfSize:10];
    redLable.backgroundColor = [UIColor colorWithHexString:@"E82434"];
    [_boomSC addSubview:redLable];
    redLable.layer.masksToBounds = YES;
    redLable.layer.cornerRadius = 4;
    [redLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(comNameLable);
        make.top.equalTo(comNameLable.mas_bottom).offset(7);
        make.width.equalTo(@(49));
        make.height.equalTo(@(18));
    }];
    
    UIButton* enterBtn = [UIButton new];
    [enterBtn setTitle:@"进入店铺" forState:UIControlStateNormal];
    [enterBtn setTitleColor:[UIColor colorWithHexString:@"999999"] forState:UIControlStateNormal];
    enterBtn.titleLabel.font = [UIFont systemFontOfSize:12];
    enterBtn.layer.masksToBounds = YES;
    enterBtn.layer.cornerRadius = 12;
    enterBtn.layer.borderColor = [UIColor colorWithHexString:@"D5D5D5"].CGColor;

    enterBtn.layer.borderWidth =1;
    [_boomSC addSubview:enterBtn];
    [enterBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(_boomSC).offset(-20);
        make.centerY.equalTo(comNameLable);
        make.width.equalTo(@(62));
        make.height.equalTo(@(24));
    }];
    
    
    UIView* fiveView = [UIView new];
    fiveView.backgroundColor = [UIColor colorWithHexString:@"F5F5F5"];
    [_boomSC addSubview:fiveView];
    [fiveView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.right.equalTo(_boomSC).offset(0);
        make.top.equalTo(headImg.mas_bottom).offset(15);
        make.height.equalTo(@(3));
        
    }];
    
    UILabel* detailphtotoLable = [UILabel new];
    detailphtotoLable.text = @"商品详情";
    detailphtotoLable.textColor = [UIColor colorWithHexString:@"666666"];
    detailphtotoLable.font = [UIFont systemFontOfSize:14];
    [_boomSC addSubview:detailphtotoLable];
    [detailphtotoLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_boomSC).offset(20);
        make.top.equalTo(fiveView.mas_bottom).offset(12);
        
    }];
    
    UIImageView* oneImg = [UIImageView new];
    NSString* imgStr = @"http://a.hiphotos.baidu.com/image/pic/item/b7fd5266d01609240bcda2d1dd0735fae7cd340b.jpg";
    
    [oneImg sd_setImageWithURL:imgStr placeholderImage:[UIImage imageNamed:@""]];
    [_boomSC addSubview:oneImg];
    [oneImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(detailphtotoLable.mas_bottom).offset(5);
        make.left.right.equalTo(_boomSC).offset(0);
        make.height.equalTo(@(388));
    }];
    
    
    UIImageView* twoImg = [UIImageView new];
    [twoImg sd_setImageWithURL:imgStr placeholderImage:[UIImage imageNamed:@""]];
    [_boomSC addSubview:twoImg];
    [twoImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(oneImg.mas_bottom).offset(0);
        make.left.right.equalTo(_boomSC).offset(0);
        make.height.equalTo(@(388));
    }];
    
    
    UIImageView* threeImg = [UIImageView new];
    [threeImg sd_setImageWithURL:imgStr placeholderImage:[UIImage imageNamed:@""]];
    [_boomSC addSubview:threeImg];
    [threeImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(twoImg.mas_bottom).offset(0);
        make.left.right.equalTo(_boomSC).offset(0);
        make.height.equalTo(@(388));
    }];
    
    
    
    UILabel* lookLable = [UILabel new];
    lookLable.text = @"看了又看";
    lookLable.textColor = [UIColor colorWithHexString:@"666666"];
    lookLable.font = [UIFont systemFontOfSize:14];
    [_boomSC addSubview:lookLable];
    [lookLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_boomSC).offset(20);
        make.top.equalTo(threeImg.mas_bottom).offset(12);
//        make.bottom.equalTo(_boomSC).offset(-30);

    }];
    
    
    
    //相当于item
    UICollectionViewFlowLayout* flowLayout = [[UICollectionViewFlowLayout alloc]init];
    //设置行间距-最小行间距
    flowLayout.minimumLineSpacing = 4;
    //设置每单元格左右间距
    flowLayout.minimumInteritemSpacing = 4;
    
    flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    
    //上 左 下 右
    flowLayout.sectionInset = UIEdgeInsetsMake(4, 0, 4, 0);
    
    _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, lookLable.bottom+10, screenW, 534) collectionViewLayout:flowLayout];
    
    _collectionView.backgroundColor = [UIColor colorWithHexString:@"F5F5F5"];
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    _collectionView.bounces = NO;
    _collectionView.autoresizingMask = UIViewAutoresizingFlexibleHeight;
    _collectionView.showsVerticalScrollIndicator = NO;
    _collectionView.showsHorizontalScrollIndicator = NO;
//    [_collectionView setBackgroundColor:[UIColor whiteColor]];
    //注册cell
//    [_collectionView registerClass:[CompanyDetailCollcCell class] forCellWithReuseIdentifier:@"CompanyDetailCollcCell"];
    
    [_collectionView registerNib:[UINib nibWithNibName:@"CompanyDetailCollcCell" bundle:nil] forCellWithReuseIdentifier:@"CompanyDetailCollcCell"];
    
    [_boomSC addSubview:_collectionView];
    [_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(lookLable.mas_bottom).offset(10);
        make.left.right.equalTo(_boomSC).offset(0);
        make.bottom.equalTo(_boomSC).offset(-5);
        make.height.equalTo(@(534));
    }];
    
    [self scretCollctionView];

    
}

-(void)specifiAction
{
    
    SpecificationsView *photoView = [SpecificationsView addSpecificationsView];
//    photoView.delegate = self;
    [photoView show];
}


-(void)parameAction
{
    
    ProductParametersView *photoView = [ProductParametersView addParameterView];
    photoView.delegate = self;
    [photoView show];
}

-(void)dotAction
{
    ServiceGuaranteeView *photoView = [ServiceGuaranteeView addSureView];
    photoView.delegate = self;
    [photoView show];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 4;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CompanyDetailCollcCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CompanyDetailCollcCell" forIndexPath:indexPath];
    

    
    
    return cell;
}


-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    
}

- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout *)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{

    
    return CGSizeMake((screenW - 4) / 2,265);
}

-(void)scretCollctionView
{
   
}

-(void)creatTopScrollView
{
    _topScrollView = [UIScrollView new];
    _topScrollView.contentSize = CGSizeMake(screenW*4, 387);
    _topScrollView.frame = CGRectMake(0, 0, screenW, 400);
    _topScrollView.delegate= self;
    _topScrollView.pagingEnabled = YES;
    _topScrollView.clipsToBounds = NO;
    _topScrollView.showsVerticalScrollIndicator = NO;
    _topScrollView.showsHorizontalScrollIndicator = NO;
    _topScrollView.userInteractionEnabled = YES;

//@[@"h1",@"h2",@"h3",@"h4"];
    NSArray* imgarr = @[@"http://d.hiphotos.baidu.com/image/pic/item/b7fd5266d016092408d4a5d1dd0735fae7cd3402.jpg",@"http://h.hiphotos.baidu.com/image/h%3D300/sign=2b3e022b262eb938f36d7cf2e56085fe/d0c8a786c9177f3e18d0fdc779cf3bc79e3d5617.jpg",@"http://a.hiphotos.baidu.com/image/pic/item/b7fd5266d01609240bcda2d1dd0735fae7cd340b.jpg",@"http://h.hiphotos.baidu.com/image/pic/item/728da9773912b31b57a6e01f8c18367adab4e13a.jpg"];
    [_boomSC addSubview:_topScrollView];

    for (int i = 0; i<imgarr.count; i++) {
        UIImageView* imageview = [UIImageView new];
        
        [imageview sd_setImageWithURL:imgarr[i] placeholderImage:[UIImage imageNamed:@""]];
        

//        imageview.image = [UIImage imageNamed:imgarr[i]];
        imageview.frame = CGRectMake(screenW*i, 0, screenW, 400);
        [_topScrollView addSubview:imageview];
        imageview.userInteractionEnabled = YES;

        imageview.tag = i;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGesture:)];
        [imageview addGestureRecognizer:tap];

        imageview.contentMode = UIViewContentModeScaleToFill;
    }
    
 
    UILabel* numLable = [UILabel new];
    numLable.text = [NSString stringWithFormat:@"1/%lu",(unsigned long)imgarr.count];
    numLable.textColor = [UIColor whiteColor];
    _numLable = numLable;
  
    numLable.font = [UIFont systemFontOfSize:14];
    [_boomSC addSubview:numLable];
    numLable.textAlignment = NSTextAlignmentCenter;
    [numLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.view).offset(-20);
        make.top.equalTo(self.view).offset(360);
        make.height.equalTo(@(22));
        make.width.equalTo(@(48));
    }];
    numLable.layer.masksToBounds = YES;
    numLable.layer.cornerRadius = 11;
    numLable.backgroundColor = [[UIColor colorWithHexString:@"F5F5F5"]colorWithAlphaComponent:0.37f];
    
    NSLog(@"%lu",(unsigned long)_topScrollView.subviews.count);
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    // 停止类型1、停止类型2
    BOOL scrollToScrollStop = !scrollView.tracking && !scrollView.dragging && !scrollView.decelerating;
    if (scrollToScrollStop) {
        [self scrollViewDidEndScroll];
    }
}
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    if (!decelerate) {
        // 停止类型3
        BOOL dragToDragStop = scrollView.tracking && !scrollView.dragging && !scrollView.decelerating;
        if (dragToDragStop) {
            [self scrollViewDidEndScroll];
        }
    }
}
#pragma mark - scrollView 滚动停止
- (void)scrollViewDidEndScroll {
    NSLog(@"停止滚动了！！！");

    int num = _topScrollView.mj_offsetX/screenW;
    
    _numLable.text = [NSString stringWithFormat:@"%d/%@",num+1,@"4"];
}

-(void)tapGesture:(UITapGestureRecognizer *)tap{
    
    SDPhotoBrowser *photoBrowser = [SDPhotoBrowser new];
    photoBrowser.delegate = self;
    photoBrowser.currentImageIndex = tap.view.tag;
    NSArray* imgarr = @[@"http://d.hiphotos.baidu.com/image/pic/item/b7fd5266d016092408d4a5d1dd0735fae7cd3402.jpg",@"http://h.hiphotos.baidu.com/image/h%3D300/sign=2b3e022b262eb938f36d7cf2e56085fe/d0c8a786c9177f3e18d0fdc779cf3bc79e3d5617.jpg",@"http://a.hiphotos.baidu.com/image/pic/item/b7fd5266d01609240bcda2d1dd0735fae7cd340b.jpg",@"http://h.hiphotos.baidu.com/image/pic/item/728da9773912b31b57a6e01f8c18367adab4e13a.jpg"];
//    NSArray* imgarr = @[@"h1",@"h2",@"h3",@"h4"];
    photoBrowser.imageCount = imgarr.count;
    photoBrowser.sourceImagesContainerView = self.topScrollView;
    [photoBrowser show];
}


-(NSURL *)photoBrowser:(SDPhotoBrowser *)browser highQualityImageURLForIndex:(NSInteger)index{
    
    NSArray* imgarr = @[@"http://d.hiphotos.baidu.com/image/pic/item/b7fd5266d016092408d4a5d1dd0735fae7cd3402.jpg",@"http://h.hiphotos.baidu.com/image/h%3D300/sign=2b3e022b262eb938f36d7cf2e56085fe/d0c8a786c9177f3e18d0fdc779cf3bc79e3d5617.jpg",@"http://a.hiphotos.baidu.com/image/pic/item/b7fd5266d01609240bcda2d1dd0735fae7cd340b.jpg",@"http://h.hiphotos.baidu.com/image/pic/item/728da9773912b31b57a6e01f8c18367adab4e13a.jpg"];
    
//    NSArray* imgarr = @[@"h1",@"h2",@"h3",@"h4"];
    NSMutableArray* imgarray = [NSMutableArray arrayWithArray:imgarr];
    id obj = imgarray[index];
    if ([obj isKindOfClass:[UIImage class]]) {
        return nil;
    }else if ([obj isKindOfClass:[NSString class]]){
        obj = [NSString stringWithFormat:@"%@",obj];
        return [NSURL URLWithString:obj];
    }
    return nil;
}

- (IBAction)customerService:(UIButton *)sender {
    
    
}

- (IBAction)storeAction:(UIButton *)sender {
    
    
}
- (IBAction)likeAction:(UIButton *)sender {
    
    
}
- (IBAction)addShopCar:(UIButton *)sender {
    
    
}
- (IBAction)buyAction:(UIButton *)sender {
    
    
}


@end
