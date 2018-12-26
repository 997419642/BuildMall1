//
//  TheCollectionTableViewCell.m
//  PullPushDemo
//
//  Created by dongzhensong on 16/9/23.
//  Copyright © 2016年 jinfuma. All rights reserved.
//

#import "TheCollectionTableViewCell.h"
#import "TheItemCell.h"

@interface TheCollectionTableViewCell ()<UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@property (assign, nonatomic) NSInteger cellNumber;
@property (copy, nonatomic) NSArray *buttonTitleArr;

@end

@implementation TheCollectionTableViewCell

- (void)awakeFromNib {
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    
    
    // 布局对象
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    // 配置布局对象
    flowLayout.minimumInteritemSpacing = 5;
    flowLayout.itemSize = CGSizeMake((screenW - 130) / 3.5, 22);
    
    flowLayout.minimumLineSpacing = 1;
    // 分区中布局缩进量: 逆时针 上 左 下 右
    flowLayout.sectionInset =UIEdgeInsetsMake(5, 5, 5, 5);
    self.collectionView.collectionViewLayout = flowLayout;
    [self.collectionView registerNib:[UINib nibWithNibName:@"TheItemCell" bundle:nil] forCellWithReuseIdentifier:@"TheItemCell"];
    self.collectionView.scrollEnabled = NO;
    self.collectionView.backgroundColor = [UIColor whiteColor];
    
}

//这个是两行cell之间的间距（上下行cell的间距）
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section

{
    return 10;
}


- (void)setupCellWithNumber:(NSInteger)buttonCount andButtonNameArr:(NSArray *)buttonNameArr{

    _cellNumber = buttonCount;
    _buttonTitleArr = [NSArray arrayWithArray:buttonNameArr];
    [self.collectionView reloadData];
}

#pragma mark - UICollectionViewDataSource, UICollectionViewDelegateFlowLayout -
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{

    return _cellNumber;
    
}


- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{

    TheItemCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"TheItemCell" forIndexPath:indexPath];
    
//    cell.contentView.layer.cornerRadius = 15;
//    cell.contentView.layer.masksToBounds = YES;
    
    cell.contentView.backgroundColor = [UIColor colorWithHexString:@"C9EEFF"];
    cell.theTitleLabel.textColor = [UIColor colorWithHexString:@"76A1D2"];
    if (indexPath.row < _buttonTitleArr.count) {
        cell.theTitleLabel.text = _buttonTitleArr[indexPath.row];
    }else{
    
        cell.theTitleLabel.text = @"占位";
    }
    
    return cell;
}


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{

    self.buttonClicked(indexPath.row);
}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
