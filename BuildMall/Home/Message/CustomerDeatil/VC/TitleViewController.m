//
//  TitleViewController.m
//  BuildMall
//
//  Created by 51wood on 2018/11/14.
//  Copyright © 2018年 51wood. All rights reserved.
//

#import "TitleViewController.h"
#import "TitleCell.h"
#import "CollectionViewHeaderView.h"

#import "AddGroupView.h"


static float kLeftTableViewWidth = 0;

static float kCollectionViewMargin = 0;

@interface TitleViewController ()<UICollectionViewDelegateFlowLayout,UICollectionViewDataSource,AddGroupViewDelegate>

@property (nonatomic, strong) UICollectionView *collectionView;

@end

@implementation TitleViewController

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
    flowLayout.minimumInteritemSpacing = 20;
    
    flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    
    //上 左 下 右
    flowLayout.sectionInset = UIEdgeInsetsMake(10, 20, 20, 20);
    
    _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(kCollectionViewMargin + kLeftTableViewWidth, kCollectionViewMargin, screenW - kLeftTableViewWidth - 2 * kCollectionViewMargin, screenH-64) collectionViewLayout:flowLayout];
    
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    _collectionView.autoresizingMask = UIViewAutoresizingFlexibleHeight;
    _collectionView.showsVerticalScrollIndicator = NO;
    _collectionView.showsHorizontalScrollIndicator = NO;
    [_collectionView setBackgroundColor:[UIColor whiteColor]];
    //注册cell
    [_collectionView registerClass:[TitleCell class] forCellWithReuseIdentifier:@"TitleCell"];
    [self.view addSubview:_collectionView];
    //注册分区头标题
    [_collectionView registerClass:[CollectionViewHeaderView class]
        forSupplementaryViewOfKind:UICollectionElementKindSectionHeader
               withReuseIdentifier:@"CollectionViewHeaderView"];
    
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 8;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
//    DOPPositionModel *model = _dataArray[section];
//    NSLog(@"%lu",(unsigned long)model.position.count);
    
    if (section == 7) {
        return 1;
    }else
    {
    return 14;
    }
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    TitleCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"TitleCell" forIndexPath:indexPath];
    
    if (indexPath.section == 7) {
        cell.name.text = @"添加";
        
    }else{
    cell.name.text = @"优秀";
    }
    
    
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
    
    if (indexPath.section == 7) {
        
        AddGroupView *photoView = [AddGroupView addGroupView];
        photoView.delegate = self;
        photoView.addTF.placeholder = @"请输入你要的自定义的标签";
        photoView.toptitle.text = @"添加自定义标签";
        [photoView show];
    }

//    NSMutableArray* arr = _PosiDetailArr[indexPath.section];
//    DOPPositionModel *model = self.dataArray[indexPath.section];
//    for (NSMutableArray* array0 in _PosiDetailArr) {
//
//        for (DOPPosiDetailModel* model in array0) {
//            model.isselect = NO;
//        }
//    }
//
//    DOPPosiDetailModel* molde0 = arr[indexPath.item];
//    molde0.isselect = YES;
//
//    [self.selectArray removeAllObjects];
//    [self.position_idArr removeAllObjects];
//    [_selectArray addObject:molde0];
//    [_position_idArr addObject:model];
//
//    if (_isfabu == YES) {
//        DOPOrderDeatilVC* VC = [DOPOrderDeatilVC new];
//        VC.selectArr = self.selectArray;
//        VC.position_idArr = self.position_idArr;
//        [self.navigationController pushViewController:VC animated:YES];
//    }else
//    {
//        self.slectBlock(self.selectArray);
//        [self.navigationController popViewControllerAnimated:YES];
//    }
//
//    [self.collectionView reloadData];
    
}

- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout *)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    //    return CGSizeMake((screenW - kLeftTableViewWidth - 4 * kCollectionViewMargin) / 4,
    //                      (screenW - kLeftTableViewWidth - 4 * kCollectionViewMargin) / 4 + 10);
    
    return CGSizeMake((screenW - 80) / 3,25);
}
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView
           viewForSupplementaryElementOfKind:(NSString *)kind
                                 atIndexPath:(NSIndexPath *)indexPath
{
    NSString *reuseIdentifier;
    if ([kind isEqualToString:UICollectionElementKindSectionHeader])
    { // header
        reuseIdentifier = @"CollectionViewHeaderView";
    }
    CollectionViewHeaderView *view = [collectionView dequeueReusableSupplementaryViewOfKind:kind
                                                                           withReuseIdentifier:reuseIdentifier
                                                                                  forIndexPath:indexPath];
    if ([kind isEqualToString:UICollectionElementKindSectionHeader])
    {
//        DOPPositionModel *model = self.dataArray[indexPath.section];
        if (indexPath.section == 7) {
            view.title.text = @"其他";

        }else
        {
        view.title.text = @"性格";
        }
    }
    return view;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    return CGSizeMake(screenW, 35);
}


@end
