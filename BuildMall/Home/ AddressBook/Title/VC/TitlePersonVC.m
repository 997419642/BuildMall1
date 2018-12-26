//
//  TitleViewController.m
//  BuildMall
//
//  Created by 51wood on 2018/11/14.
//  Copyright © 2018年 51wood. All rights reserved.
//

#import "TitlePersonVC.h"
#import "TitlePersonCellColleCell.h"
#import "AdressCollectionViewHeaderView.h"
#import "NewTitleVC.h"

static float kLeftTableViewWidth = 0;

static float kCollectionViewMargin = 0;

@interface TitlePersonVC ()<UICollectionViewDelegateFlowLayout,UICollectionViewDataSource>

@property (nonatomic, strong)UICollectionView *collectionView;

@end

@implementation TitlePersonVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.title = @"标签";
    
    [self resetConlloctionView];
    
}

-(void)resetConlloctionView
{
    //相当于item
    UICollectionViewFlowLayout* flowLayout = [[UICollectionViewFlowLayout alloc]init];
    //设置行间距-最小行间距
    flowLayout.minimumLineSpacing = 10;
    //设置每单元格左右间距
    flowLayout.minimumInteritemSpacing = 10;
    
    flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    
    //上 左 下 右
    flowLayout.sectionInset = UIEdgeInsetsMake(10, 20, 10, 20);
    
    _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(kCollectionViewMargin + kLeftTableViewWidth, 50, screenW - kLeftTableViewWidth - 2 * kCollectionViewMargin, screenH-64-50) collectionViewLayout:flowLayout];
    
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    _collectionView.autoresizingMask = UIViewAutoresizingFlexibleHeight;
    _collectionView.showsVerticalScrollIndicator = NO;
    _collectionView.showsHorizontalScrollIndicator = NO;
    [_collectionView setBackgroundColor:[UIColor whiteColor]];
    //注册cell
    [_collectionView registerClass:[TitlePersonCellColleCell class] forCellWithReuseIdentifier:@"TitlePersonCellColleCell"];
    [self.view addSubview:_collectionView];
    //注册分区头标题
    [_collectionView registerClass:[AdressCollectionViewHeaderView class]
        forSupplementaryViewOfKind:UICollectionElementKindSectionHeader
               withReuseIdentifier:@"AdressCollectionViewHeaderView"];
    
}
- (IBAction)newTitleAction:(UIButton *)sender {
    NewTitleVC* VC = [NewTitleVC new];
    
    [self.navigationController pushViewController:VC animated:YES];
    
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 8;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    //    DOPPositionModel *model = _dataArray[section];
    //    NSLog(@"%lu",(unsigned long)model.position.count);
    return 14;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    TitlePersonCellColleCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"TitlePersonCellColleCell" forIndexPath:indexPath];
    
    cell.name.text = @"优秀";
    
    
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
    
    return CGSizeMake((screenW-40-10*2)/3,30);
}
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView
           viewForSupplementaryElementOfKind:(NSString *)kind
                                 atIndexPath:(NSIndexPath *)indexPath
{
    NSString *reuseIdentifier;
    if ([kind isEqualToString:UICollectionElementKindSectionHeader])
    { // header
        reuseIdentifier = @"AdressCollectionViewHeaderView";
    }
    AdressCollectionViewHeaderView *view = [collectionView dequeueReusableSupplementaryViewOfKind:kind
                                                                        withReuseIdentifier:reuseIdentifier
                                                                               forIndexPath:indexPath];
    if ([kind isEqualToString:UICollectionElementKindSectionHeader])
    {
        //        DOPPositionModel *model = self.dataArray[indexPath.section];
        view.title.text = @"性格";
    }
    return view;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    return CGSizeMake(screenW, 40);
}


@end
