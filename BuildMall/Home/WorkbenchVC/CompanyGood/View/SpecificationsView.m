//
//  SpecificationsView.m
//  BuildMall
//
//  Created by 51wood on 2018/12/1.
//  Copyright © 2018 51wood. All rights reserved.
//

#import "SpecificationsView.h"
#import "SpecificationsViewCell.h"
#import "SpecificationsReusableView.h"
#import "UICollectionViewLeftAlignedLayout.h"

@interface SpecificationsView ()<UICollectionViewDelegateFlowLayout,UICollectionViewDataSource>

@property (nonatomic, strong) UICollectionView *collectionView;

@end

@implementation SpecificationsView



-(void)awakeFromNib
{
    [super awakeFromNib];
    
    [self setUp];

}

- (UIView *)backgroupView
{
    if (_backgroupView == nil) {
        _backgroupView = [UIView new];
        _backgroupView.frame = CGRectMake(0, 0, screenW, screenH);
        _backgroupView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.2];
        self.layer.masksToBounds = YES;
        self.layer.cornerRadius = 5;
        
    }
    return _backgroupView;
}

+ (instancetype)addSpecificationsView
{
    return [[[NSBundle mainBundle] loadNibNamed:@"SpecificationsView" owner:nil options:0] firstObject];
}


///显示
- (void)show
{
    [[UIApplication sharedApplication].keyWindow addSubview:self.backgroupView];
    [self.backgroupView addSubview:self];
    self.frame = CGRectMake(0, screenH, screenW, 505);
    [self showAnimation];
    
}

- (void)showAnimation{
    [UIView animateWithDuration:0.5 animations:^{
        CGRect frame = self.frame;
        frame.origin.y = screenH-505;
        self.frame = frame;
    }];
}


- (void)hideAnimation{
    [UIView animateWithDuration:0.5 animations:^{
        CGRect frame = self.frame;
        frame.origin.y = screenH;
        self.frame = frame;
    } completion:^(BOOL finished) {
        
        [self.backgroupView removeFromSuperview];
        [self removeFromSuperview];
    }];
}


-(void)setUp
{
    UICollectionViewLeftAlignedLayout* flowLayout = [[UICollectionViewLeftAlignedLayout alloc]init];
    //设置行间距-最小行间距
//    flowLayout.minimumLineSpacing = 10;
    //设置每单元格左右间距
    flowLayout.minimumInteritemSpacing = 10;
    
    flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    
    //上 左 下 右
    flowLayout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 20);
    
    _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, _topView.bottom+10, screenW, 534) collectionViewLayout:flowLayout];
    
//    _collectionView.backgroundColor = [UIColor colorWithHexString:@"F5F5F5"];
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
//    _collectionView.bounces = NO;
    _collectionView.autoresizingMask = UIViewAutoresizingFlexibleHeight;
    _collectionView.showsVerticalScrollIndicator = NO;
    _collectionView.showsHorizontalScrollIndicator = NO;
    [_collectionView setBackgroundColor:[UIColor whiteColor]];
    //注册cell
    //    [_collectionView registerClass:[CompanyDetailCollcCell class] forCellWithReuseIdentifier:@"CompanyDetailCollcCell"];
    
    [_collectionView registerNib:[UINib nibWithNibName:@"SpecificationsViewCell" bundle:nil] forCellWithReuseIdentifier:@"SpecificationsViewCell"];
    
    
    //注册分区头标题
    [_collectionView registerNib:[UINib nibWithNibName:@"SpecificationsReusableView" bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"SpecificationsReusableView"];
//    [_collectionView registerNib:[CollectionViewHeaderView class]
//        forSupplementaryViewOfKind:UICollectionElementKindSectionHeader
//               withReuseIdentifier:@"CollectionViewHeaderView"];
    
    [self addSubview:_collectionView];
    [_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_topView.mas_bottom).offset(10);
        make.left.right.equalTo(self).offset(0);
        make.bottom.equalTo(_boomLable.mas_top).offset(-10);

    }];
    
    
}

- (IBAction)cancelAction:(id)sender {
//    [_backgroupView removeFromSuperview];
    
    [self hideAnimation];
}



- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 4;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 6;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    SpecificationsViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"SpecificationsViewCell" forIndexPath:indexPath];
    
        cell.titleLable.text = @"太仓龙";
    
    //    DOPPositionModel *model = self.dataArray[indexPath.section];
    
    
    //    NSMutableArray* arr = _PosiDetailArr[indexPath.section];
    //    cell.model = arr[indexPath.row];
    //    DOPPosiDetailModel* molde0 = arr[indexPath.row];
    
    //    if (molde0.isselect == YES) {
    //        cell.name.backgroundColor = [UIColor colorWithHexString:@"ff4200" ];
    //        cell.name.textColor = [UIColor whiteColor];
    //
    //    }else
    //    {
    //        cell.name.backgroundColor = [UIColor whiteColor];
    //        cell.name.textColor = [UIColor blackColor];
    //
    //    }
    
    return cell;
}


-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    
}

- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout *)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    //    return CGSizeMake((screenW - kLeftTableViewWidth - 4 * kCollectionViewMargin) / 4,
    //                      (screenW - kLeftTableViewWidth - 4 * kCollectionViewMargin) / 4 + 10);
    
//    return CGSizeMake((screenW - 30*3-10*2) / 4,25);
    
    //宽度适应文字
    NSArray* array = @[@"稳重",@"靠谱谱",@"非常热情",@"大方很大方非常大方的",@"货源充足充足"];

    NSString* obj = array[arc4random_uniform([array count])];
    NSString * string = obj;
    CGFloat width = (string.length + 2) * 12;
    return CGSizeMake(width, 25);

}


- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView
           viewForSupplementaryElementOfKind:(NSString *)kind
                                 atIndexPath:(NSIndexPath *)indexPath
{
    NSString *reuseIdentifier;
    if ([kind isEqualToString:UICollectionElementKindSectionHeader])
    { // header
        reuseIdentifier = @"SpecificationsReusableView";
    }
    SpecificationsReusableView *view = [collectionView dequeueReusableSupplementaryViewOfKind:kind
                                                                        withReuseIdentifier:reuseIdentifier
                                                                               forIndexPath:indexPath];
    if ([kind isEqualToString:UICollectionElementKindSectionHeader])
    {
        //        DOPPositionModel *model = self.dataArray[indexPath.section];
            view.titleLable.text = @"其他";
    }
    return view;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    return CGSizeMake(screenW, 50);
}

- (IBAction)reductionAction:(id)sender {
}
- (IBAction)addAction:(id)sender {
}

@end
