//
//  ChooseCategoryVC.m
//  BuildMall
//
//  Created by 51wood on 2018/12/10.
//  Copyright © 2018 51wood. All rights reserved.
//

#import "ChooseCategoryVC.h"

#import "InventoryQueryCell.h"


@interface ChooseCategoryVC ()<UICollectionViewDelegateFlowLayout,UICollectionViewDataSource>


@property (nonatomic, strong) UICollectionView *collectionView;

@property(nonatomic,strong)NSMutableArray* dataArray;

@property(nonatomic,strong)NSMutableArray* lengthList;

@property(nonatomic,strong)NSMutableArray* cangkuArray;
@property(nonatomic,strong)NSMutableArray* pinPaiArray;
@property(nonatomic,strong)NSMutableArray* genshuArray;


@property(nonatomic,strong)NSMutableArray* shuzhongArray;
@property(nonatomic,strong)NSMutableArray* dengjiArray;
@property(nonatomic,strong)NSMutableArray* chandiArray;
@property(nonatomic,strong)NSMutableArray* kuanduArray;
@property(nonatomic,strong)NSMutableArray* houduArray;
@property(nonatomic,strong)NSMutableArray* koujinArray;
@property(nonatomic,strong)NSMutableArray* keXiArray;


@property(nonatomic,strong)NSMutableArray* selectArray;
@end

@implementation ChooseCategoryVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    

    self.navigationItem.title = [NSString stringWithFormat:@"请选择%@",_titleStr];
    
    UIBarButtonItem *backItem =[[UIBarButtonItem alloc]init];
    self.navigationItem.backBarButtonItem = backItem;
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"确定" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(pressright) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:button];
    

    _dataArray = [NSMutableArray array];
    _lengthList = [NSMutableArray array];
    _selectArray = [NSMutableArray array];
    
    _cangkuArray = [NSMutableArray array];
    _pinPaiArray = [NSMutableArray array];
    _genshuArray = [NSMutableArray array];
    _shuzhongArray = [NSMutableArray array];
    _dengjiArray = [NSMutableArray array];
    _chandiArray = [NSMutableArray array];
    _kuanduArray = [NSMutableArray array];
    _houduArray = [NSMutableArray array];
    _koujinArray = [NSMutableArray array];
    _keXiArray = [NSMutableArray array];
    [self resetConlloctionView];
    [self refeshing];

}

-(void)pressright
{
    if (_selectArray.count == 0) {
        return;
    }
    NSMutableDictionary* dict = _selectArray[0];
    self.slectChooseBlock(dict);
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)refeshing
{
    NSMutableDictionary* dict = [NSMutableDictionary dictionary];
    AMUserAccountInfo *userInfo = [AMUserAccountInfo shareInfo];
    [dict setObject:userInfo.storeId forKey:@"storeId"];
    [dict setObject:_categoryId forKey:@"categoryId"];
    
    __weak typeof(self)weakSelf = self;
    
    [[WebClient sharedClient] upperFrameConditionAttributeList:dict complete:^(ResponseMode *result, NSError *error) {
        if (!error) {
            if (result.code == 0) {
                
                NSMutableArray* dataArr = result.data[@"productAttributeList"];
                NSMutableArray* shuzhongArray = [NSMutableArray array];
                _shuzhongArray = shuzhongArray;
                NSMutableArray* dengjiArray = [NSMutableArray array];
                _dengjiArray = dengjiArray;
                NSMutableArray* chandiArray = [NSMutableArray array];
                _chandiArray = chandiArray;
                NSMutableArray* kuanduArray = [NSMutableArray array];
                _kuanduArray = kuanduArray;
                NSMutableArray* houduArray = [NSMutableArray array];
                _houduArray = houduArray;
                NSMutableArray* koujinArray = [NSMutableArray array];
                _koujinArray = koujinArray;
            
                //整理数据
                for (NSMutableDictionary* dict in dataArr) {
                    
                    if ([dict[@"attrName"] isEqualToString:@"树种"])
                    {
                        NSMutableDictionary* dictData = [NSMutableDictionary dictionary];
                        [dictData setObject:dict[@"attrId"] forKey:@"attrId"];
                        [dictData setObject:dict[@"attrValue"] forKey:@"attrValue"];
                        [dictData setObject:@"NO" forKey:@"isSelect"];
                        
                        [shuzhongArray addObject:dictData];
                        
                    }else if ([dict[@"attrName"] isEqualToString:@"等级"])
                    {
                        NSMutableDictionary* dictData = [NSMutableDictionary dictionary];
                        [dictData setObject:dict[@"attrId"] forKey:@"attrId"];
                        [dictData setObject:dict[@"attrValue"] forKey:@"attrValue"];
                        [dictData setObject:@"NO" forKey:@"isSelect"];
                        
                        [dengjiArray addObject:dictData];
                        
                    }else if ([dict[@"attrName"] isEqualToString:@"产地"])
                    {
                        NSMutableDictionary* dictData = [NSMutableDictionary dictionary];
                        [dictData setObject:dict[@"attrId"] forKey:@"attrId"];
                        [dictData setObject:dict[@"attrValue"] forKey:@"attrValue"];
                        
                        [dictData setObject:@"NO" forKey:@"isSelect"];
                        [chandiArray addObject:dictData];
                        
                    }else if ([dict[@"attrName"] isEqualToString:@"宽度"])
                    {
                        NSMutableDictionary* dictData = [NSMutableDictionary dictionary];
                        [dictData setObject:dict[@"attrId"] forKey:@"attrId"];
                        [dictData setObject:dict[@"attrValue"] forKey:@"attrValue"];
                        [dictData setObject:@"NO" forKey:@"isSelect"];
                        [kuanduArray addObject:dictData];
                        
                    }else if ([dict[@"attrName"] isEqualToString:@"厚度"])
                    {
                        NSMutableDictionary* dictData = [NSMutableDictionary dictionary];
                        [dictData setObject:dict[@"attrId"] forKey:@"attrId"];
                        [dictData setObject:dict[@"attrValue"] forKey:@"attrValue"];
                        [dictData setObject:@"NO" forKey:@"isSelect"];
                        [houduArray addObject:dictData];
                        
                    }else if ([dict[@"attrName"] isEqualToString:@"口径"])
                    {
                        NSMutableDictionary* dictData = [NSMutableDictionary dictionary];
                        [dictData setObject:dict[@"attrId"] forKey:@"attrId"];
                        [dictData setObject:dict[@"attrValue"] forKey:@"attrValue"];
                        [dictData setObject:@"NO" forKey:@"isSelect"];
                        [koujinArray addObject:dictData];
                        
                    }else if ([dict[@"attrName"] isEqualToString:@"科系"])
                    {
                        NSMutableDictionary* dictData = [NSMutableDictionary dictionary];
                        [dictData setObject:dict[@"attrId"] forKey:@"attrId"];
                        [dictData setObject:dict[@"attrValue"] forKey:@"attrValue"];
                        [dictData setObject:@"NO" forKey:@"isSelect"];
                        [_keXiArray addObject:dictData];
                    }
                }
                
                NSMutableArray* lengthArray = result.data[@"lengthList"];
                for (NSMutableDictionary* dict in lengthArray) {
                    NSMutableDictionary* dictData = [NSMutableDictionary dictionary];
                    [dictData setObject:dict[@"specValue"] forKey:@"attrValue"];
                    [dictData setObject:dict[@"id"] forKey:@"attrId"];
                    [dictData setObject:@"NO" forKey:@"isSelect"];
                    [dictData setObject:@"YES" forKey:@"isChangDu"];
                    [_lengthList addObject:dictData];
                }
                
                NSMutableArray* cangkuArray = result.data[@"warehouseList"];
                
                for (NSMutableDictionary* dict in cangkuArray) {
                    NSMutableDictionary* dictData = [NSMutableDictionary dictionary];
                    [dictData setObject:dict[@"name"] forKey:@"attrValue"];
                    [dictData setObject:dict[@"id"] forKey:@"attrId"];
                    [dictData setObject:@"NO" forKey:@"isSelect"];
                    [dictData setObject:@"YES" forKey:@"isCangku"];
                    
                    [_cangkuArray addObject:dictData];
                }
                
                
                NSMutableArray* pinPaiArray = result.data[@"brandList"];
                
                for (NSMutableDictionary* dict in pinPaiArray) {
                    NSMutableDictionary* dictData = [NSMutableDictionary dictionary];
                    [dictData setObject:dict[@"brandName"] forKey:@"attrValue"];
                    [dictData setObject:dict[@"brandId"] forKey:@"attrId"];
                    [dictData setObject:@"NO" forKey:@"isSelect"];
                    [dictData setObject:@"YES" forKey:@"isPinPai"];
                    
                    [_pinPaiArray addObject:dictData];
                }
                
                NSMutableArray* genshuArray = result.data[@"piecesNumList"];
                
                for (NSMutableDictionary* dict in genshuArray) {
                    NSMutableDictionary* dictData = [NSMutableDictionary dictionary];
                    [dictData setObject:dict[@"specValue"] forKey:@"attrValue"];
                    [dictData setObject:dict[@"id"] forKey:@"attrId"];
                    [dictData setObject:@"NO" forKey:@"isSelect"];
                    [dictData setObject:@"YES" forKey:@"isGenShu"];
                    [_genshuArray addObject:dictData];
                }
                
                
                NSMutableArray* dataTrueArr = [NSMutableArray array];
                
                NSMutableDictionary* dictCangku = [NSMutableDictionary dictionary];
                [dictCangku setObject:@"仓库" forKey:@"name"];
                [dictCangku setObject:_cangkuArray forKey:@"nameArray"];
                [dataTrueArr addObject:dictCangku];
                
                
                NSMutableDictionary* dictShuzhong = [NSMutableDictionary dictionary];
                [dictShuzhong setObject:@"树种" forKey:@"name"];
                [dictShuzhong setObject:shuzhongArray forKey:@"nameArray"];
                [dataTrueArr addObject:dictShuzhong];
                
                NSMutableDictionary* dictpinPai = [NSMutableDictionary dictionary];
                [dictpinPai setObject:@"品牌" forKey:@"name"];
                [dictpinPai setObject:_pinPaiArray forKey:@"nameArray"];
                [dataTrueArr addObject:dictpinPai];
                
                
                NSMutableDictionary* dictDengji = [NSMutableDictionary dictionary];
                [dictDengji setObject:@"等级" forKey:@"name"];
                [dictDengji setObject:dengjiArray forKey:@"nameArray"];
                [dataTrueArr addObject:dictDengji];
                
                NSMutableDictionary* dictChandi = [NSMutableDictionary dictionary];
                [dictChandi setObject:@"产地" forKey:@"name"];
                [dictChandi setObject:chandiArray forKey:@"nameArray"];
                [dataTrueArr addObject:dictChandi];
                
                NSMutableDictionary* dictChangdu = [NSMutableDictionary dictionary];
                [dictChangdu setObject:@"长度" forKey:@"name"];
                [dictChangdu setObject:_lengthList forKey:@"nameArray"];
                [dataTrueArr addObject:dictChangdu];
                
                
                NSMutableDictionary* dictKoujinu = [NSMutableDictionary dictionary];
                [dictKoujinu setObject:@"口径" forKey:@"name"];
                [dictKoujinu setObject:koujinArray forKey:@"nameArray"];
                [dataTrueArr addObject:dictKoujinu];
                
                NSMutableDictionary* dictGenshu = [NSMutableDictionary dictionary];
                [dictGenshu setObject:@"根数" forKey:@"name"];
                [dictGenshu setObject:_genshuArray forKey:@"nameArray"];
                [dataTrueArr addObject:dictGenshu];
                
                [weakSelf.dataArray addObjectsFromArray:dataTrueArr];
                
                [weakSelf.collectionView reloadData];
                
            }
            
        }
        
        
        
    }];
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
    flowLayout.sectionInset = UIEdgeInsetsMake(20, 20, 20, 20);
    
    _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, screenW, screenH-64-60) collectionViewLayout:flowLayout];
    
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    _collectionView.autoresizingMask = UIViewAutoresizingFlexibleHeight;
    _collectionView.showsVerticalScrollIndicator = NO;
    _collectionView.showsHorizontalScrollIndicator = NO;
    [_collectionView setBackgroundColor:[UIColor whiteColor]];
    
    //注册cell
    [_collectionView registerClass:[InventoryQueryCell class] forCellWithReuseIdentifier:@"InventoryQueryCell"];
    [self.view addSubview:_collectionView];
    
    
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if ([_titleStr isEqualToString:@"仓库"]) {
        return _cangkuArray.count;
    }else if ([_titleStr isEqualToString:@"品名"])
    {
        return _shuzhongArray.count;

    }else if ([_titleStr isEqualToString:@"品牌"])
    {
        return _pinPaiArray.count;

    }else if([_titleStr isEqualToString:@"等级"])
    {
        return _dengjiArray.count;
    }else
    {
        return _keXiArray.count;
    }
    
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if ([_titleStr isEqualToString:@"仓库"]) {
        
        NSMutableDictionary* dict =  _cangkuArray[indexPath.row];
        if ([dict[@"isSelect"] isEqualToString:@"YES"]) {
            return;
        }else
        {
            for (NSMutableDictionary* dictData in _cangkuArray) {

                if ([dictData[@"isSelect"] isEqualToString:@"YES"]) {
                    
                    [dictData setObject:@"NO" forKey:@"isSelect"];
                    [_selectArray removeObject:dictData];

                }
            }
            
            [dict setObject:@"YES" forKey:@"isSelect"];
            [_selectArray addObject:dict];

        }
        [self.collectionView reloadData];
        
    }else if ([_titleStr isEqualToString:@"品名"])
    {
        NSMutableDictionary* dict =  _shuzhongArray[indexPath.row];
        if ([dict[@"isSelect"] isEqualToString:@"YES"]) {
            return;
        }else
        {
            for (NSMutableDictionary* dictData in _shuzhongArray) {
                
                if ([dictData[@"isSelect"] isEqualToString:@"YES"]) {
                    
                    [dictData setObject:@"NO" forKey:@"isSelect"];
                    [_selectArray removeObject:dictData];
                    
                }
            }
            
            [dict setObject:@"YES" forKey:@"isSelect"];
            [_selectArray addObject:dict];
        }
        [self.collectionView reloadData];

    }else if ([_titleStr isEqualToString:@"品牌"])
    {
        NSMutableDictionary* dict =  _pinPaiArray[indexPath.row];
        if ([dict[@"isSelect"] isEqualToString:@"YES"]) {
            return;
        }else
        {
            for (NSMutableDictionary* dictData in _pinPaiArray) {
                
                if ([dictData[@"isSelect"] isEqualToString:@"YES"]) {
                    
                    [dictData setObject:@"NO" forKey:@"isSelect"];
                    [_selectArray removeObject:dictData];
                    
                }
            }
            
            [dict setObject:@"YES" forKey:@"isSelect"];
            [_selectArray addObject:dict];
        }
        [self.collectionView reloadData];

        
    }else if([_titleStr isEqualToString:@"等级"])
    {
        NSMutableDictionary* dict =  _dengjiArray[indexPath.row];
        if ([dict[@"isSelect"] isEqualToString:@"YES"]) {
            return;
        }else
        {
            for (NSMutableDictionary* dictData in _dengjiArray) {
                
                if ([dictData[@"isSelect"] isEqualToString:@"YES"]) {
                    
                    [dictData setObject:@"NO" forKey:@"isSelect"];
                    [_selectArray removeObject:dictData];
                    
                }
            }
            
            [dict setObject:@"YES" forKey:@"isSelect"];
            [_selectArray addObject:dict];
        }
        [self.collectionView reloadData];

    }else
    {
        NSMutableDictionary* dict =  _keXiArray[indexPath.row];
        if ([dict[@"isSelect"] isEqualToString:@"YES"]) {
            return;
        }else
        {
            for (NSMutableDictionary* dictData in _keXiArray) {
                
                if ([dictData[@"isSelect"] isEqualToString:@"YES"]) {
                    
                    [dictData setObject:@"NO" forKey:@"isSelect"];
                    [_selectArray removeObject:dictData];
                    
                }
            }
            
            [dict setObject:@"YES" forKey:@"isSelect"];
            [_selectArray addObject:dict];
        }
        [self.collectionView reloadData];
    }
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    InventoryQueryCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"InventoryQueryCell" forIndexPath:indexPath];
    
    if ([_titleStr isEqualToString:@"仓库"]) {
        
       NSMutableDictionary* dict =  _cangkuArray[indexPath.row];
        cell.name.text = dict[@"attrValue"];
        
        if ([dict[@"isSelect"] isEqualToString:@"YES"]) {
            cell.name.textColor = [UIColor whiteColor];
            cell.name.backgroundColor = MINE_Color;

        }else
        {
            cell.name.textColor = [UIColor colorWithHexString:@"999999"];
            cell.name.backgroundColor = [UIColor colorWithHexString:@"F2F2F2"];
        }

    }else if ([_titleStr isEqualToString:@"品名"])
    {
        NSMutableDictionary* dict =  _shuzhongArray[indexPath.row];
        cell.name.text = dict[@"attrValue"];
        if ([dict[@"isSelect"] isEqualToString:@"YES"]) {
            cell.name.textColor = [UIColor whiteColor];
            cell.name.backgroundColor = MINE_Color;
            
        }else
        {
            cell.name.textColor = [UIColor colorWithHexString:@"999999"];
            cell.name.backgroundColor = [UIColor colorWithHexString:@"F2F2F2"];
        }
    }else if ([_titleStr isEqualToString:@"品牌"])
    {
        NSMutableDictionary* dict =  _pinPaiArray[indexPath.row];
        cell.name.text = dict[@"attrValue"];
        if ([dict[@"isSelect"] isEqualToString:@"YES"]) {
            cell.name.textColor = [UIColor whiteColor];
            cell.name.backgroundColor = MINE_Color;
            
        }else
        {
            cell.name.textColor = [UIColor colorWithHexString:@"999999"];
            cell.name.backgroundColor = [UIColor colorWithHexString:@"F2F2F2"];
        }
    }else if([_titleStr isEqualToString:@"等级"])
    {
        NSMutableDictionary* dict =  _dengjiArray[indexPath.row];
        cell.name.text = dict[@"attrValue"];
        if ([dict[@"isSelect"] isEqualToString:@"YES"]) {
            cell.name.textColor = [UIColor whiteColor];
            cell.name.backgroundColor = MINE_Color;
            
        }else
        {
            cell.name.textColor = [UIColor colorWithHexString:@"999999"];
            cell.name.backgroundColor = [UIColor colorWithHexString:@"F2F2F2"];
        }
        
    }else
    {
        NSMutableDictionary* dict =  _keXiArray[indexPath.row];
        cell.name.text = dict[@"attrValue"];
        if ([dict[@"isSelect"] isEqualToString:@"YES"]) {
            cell.name.textColor = [UIColor whiteColor];
            cell.name.backgroundColor = MINE_Color;
            
        }else
        {
            cell.name.textColor = [UIColor colorWithHexString:@"999999"];
            cell.name.backgroundColor = [UIColor colorWithHexString:@"F2F2F2"];
        }
    }
 
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout *)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake((screenW - 80) / 3,25);
}


@end
