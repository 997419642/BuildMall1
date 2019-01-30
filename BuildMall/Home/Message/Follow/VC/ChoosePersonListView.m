//
//  ImageListView.m
//  YouDaSuPei
//
//  Created by 米海波 on 16/7/8.
//  Copyright © 2016年 mihb. All rights reserved.
//

#import "ChoosePersonListView.h"
#import <TZImagePickerController.h>
#import "ImageItemCell.h"
#import "UIView+SDAutoLayout.h"
#import <UIView+SDExtension.h>
#import "SDPhotoBrowser.h"
#import <UIImageView+WebCache.h>
#import "SVProgressHUD.h"
#import "ChoosePersonVC.h"
#import "BasicNavigationController.h"


@interface ChoosePersonListView()<UICollectionViewDataSource, UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,SDPhotoBrowserDelegate>


@property (strong, nonatomic, readonly) UIViewController *rootViewController;


@property (nonatomic, weak) UIView *tempMoveCell;
@property (nonatomic, strong) NSIndexPath *originalIndexPath;
@property (nonatomic, strong) NSIndexPath *moveIndexPath;
@end

@implementation ChoosePersonListView
{
    CGFloat _imgItemWH;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}
-(void)setup{
    
    self.maxImgCount = 3;
//    self.frame = CGRectMake(0, 0, screenW, 77);
    [self addSubview:self.collectionView];
    _collectionView.sd_layout.topSpaceToView(self,0).leftEqualToView(self).rightEqualToView(self).bottomEqualToView(self);

    
}

- (UIViewController *)rootViewController{
    return [[UIApplication sharedApplication] keyWindow].rootViewController;
}

-(UICollectionView *)collectionView{
    if (_collectionView==nil) {
        _imageArray = [[NSMutableArray alloc]init];
//        _assetArray = [[NSMutableArray alloc]init];
        
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
        
        CGFloat margin = 20;
    
        CGFloat itemWH = ((screenW - margin*6) / 5);
        _imgItemWH = itemWH;
        flowLayout.itemSize = CGSizeMake(itemWH, itemWH);
        flowLayout.minimumInteritemSpacing = margin;//行间距
        flowLayout.minimumLineSpacing = margin;//列间距
        flowLayout.sectionInset = UIEdgeInsetsMake(10, 20, 10, 20);
        _collectionView = [[UICollectionView alloc]initWithFrame:self.bounds collectionViewLayout:flowLayout];

        
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
        _collectionView.scrollEnabled = NO;
        _collectionView.backgroundColor = [UIColor whiteColor];
        [_collectionView registerClass:[ImageItemCell class] forCellWithReuseIdentifier:@"ImageItemCell"];

    }
    return _collectionView;
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    if (self.imageArray.count == self.maxImgCount) {
        
        return self.imageArray.count;
    
        
    }else
    {
        
        if (self.imageArray.count == self.maxImgCount) {
            NSInteger num = ((screenW - 20*6) / 5)*ceilf(self.imageArray.count/5)+ceilf(self.imageArray.count/5)* 20;
            self.num = num;
        }else
        {
            if (self.imageArray.count+1>5) {
                
                NSInteger numzhengshu;
                
                BOOL isMultipleOfTen = !((self.imageArray.count+1) % 5);
                if (isMultipleOfTen == YES)
                {
                    NSLog(@"%lu",(self.imageArray.count+1)/5);
                    numzhengshu = (self.imageArray.count+1)/5;
                }else
                {
                    numzhengshu = (ceilf((self.imageArray.count+1)/5)+1);
                }
                
                NSInteger num = ((screenW - 20*6) / 5)*numzhengshu+(numzhengshu+1)*20;
                NSLog(@"%f",ceilf((self.imageArray.count+1)/5));
                
                self.num = num;
                [[NSNotificationCenter defaultCenter] postNotificationName:@"paySucceedReturen" object:nil userInfo:nil];
        }
        
        }

        return self.imageArray.count+1;
    }
}


-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    ImageItemCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ImageItemCell" forIndexPath:indexPath];
    
    NSLog(@"%ld",indexPath.row);
    if (indexPath.row == self.imageArray.count) {
        
        cell.imageView.image = [UIImage imageNamed:@"iconadd"];
        cell.delBtn.hidden = YES;
        
    }else{
        
        id obj = self.imageArray[indexPath.row];
        if ([obj isKindOfClass:[UIImage class]]) {
            cell.imageView.image = obj;
        }else if ([obj isKindOfClass:[NSString class]]){
            obj = [NSString stringWithFormat:@"%@%@",webUrlOld,obj];
            [cell.imageView sd_setImageWithURL:[NSURL URLWithString:obj] placeholderImage:[UIImage imageNamed:@"placeholder"]];
        }
        cell.delBtn.tag = indexPath.row;
        cell.delBtn.hidden = self.banDel;
        
        if (!self.banDel) {
            
           [cell.delBtn addTarget:self action:@selector(deleteBtnClik:) forControlEvents:UIControlEventTouchUpInside];
        }
    }
    
    return cell;
}


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == self.imageArray.count) {
        if (self.imageArray.count == self.maxImgCount) {
            NSString *count = [NSString stringWithFormat:@"最多上传%ld张照片",self.maxImgCount];
            [SVProgressHUD showInfoWithStatus:count];
            return;
        }
        [self pushImagePickerController];
        
    } else {
        
    }
}

#pragma mark  SDPhotoBrowserDelegate

// 返回临时占位图片（即原来的小图）
- (UIImage *)photoBrowser:(SDPhotoBrowser *)browser placeholderImageForIndex:(NSInteger)index
{
    // 不建议用此种方式获取小图，这里只是为了简单实现展示而已
    ImageItemCell *cell = (ImageItemCell *)[self collectionView:self.collectionView cellForItemAtIndexPath:[NSIndexPath indexPathForItem:index inSection:0]];
    
    return cell.imageView.image;
    
}
-(NSURL *)photoBrowser:(SDPhotoBrowser *)browser highQualityImageURLForIndex:(NSInteger)index{
    id obj = self.imageArray[index];
    if ([obj isKindOfClass:[UIImage class]]) {
        return nil;
    }else if ([obj isKindOfClass:[NSString class]]){
        obj = [NSString stringWithFormat:@"%@%@",webUrlOld,obj];
        return [NSURL URLWithString:obj];
    }
    return nil;
}


#pragma mark - seter
-(void)setImageArray:(NSMutableArray *)imageArray{
    _imageArray = imageArray;
    [self.collectionView reloadData];
}

#pragma mark Click Event

- (void)deleteBtnClik:(UIButton *)sender {
    
    NSInteger index = sender.tag;
    NSInteger itemCount = self.imageArray.count;
    if (self.didDeleteBlock) {
        self.didDeleteBlock(index);
    }
    
    [self.imageArray removeObjectAtIndex:index];
    
    if (itemCount == self.maxImgCount) {
        [_collectionView reloadData];
        return;
    }
    __weak typeof(self)weakSelf = self;
    [_collectionView performBatchUpdates:^{
        
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:index inSection:0];
        [_collectionView deleteItemsAtIndexPaths:@[indexPath]];
    } completion:^(BOOL finished) {
        [_collectionView reloadData];

    }];
}

-(void)reloadLayout{
    NSInteger item = _imageArray.count==self.maxImgCount?self.maxImgCount:_imageArray.count+1;
    NSInteger rowCount = ceilf(item/3.0f);
    CGFloat height = _imgItemWH*rowCount + 10 + 2 * (rowCount-1);
    __weak typeof(self)weakSelf = self;
    [UIView animateWithDuration:0.1 animations:^{
//        _collectionView.fixedHeight = @(height);
        weakSelf.fixedHeight = @(height);
    }];
}

- (void)pushImagePickerController {
    NSInteger max = self.maxImgCount - self.imageArray.count;
    if (self.isRadio) {
        max = max > 1?1:max;
    }
    
    ChoosePersonVC* VC = [ChoosePersonVC new];
    
    UINavigationController *navigationController =
    [[BasicNavigationController alloc] initWithRootViewController:VC];
    __weak typeof(self)weakSelf = self;

    VC.slectComBlock = ^(NSMutableArray *arr) {
        
        self.imageArray = arr;
        [self.collectionView reloadData];
    };
    
    
    [self.rootViewController presentViewController:navigationController animated:NO completion:nil];
    
    

}



@end
