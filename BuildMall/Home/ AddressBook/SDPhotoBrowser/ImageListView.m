//
//  ImageListView.m
//  YouDaSuPei
//
//  Created by 米海波 on 16/7/8.
//  Copyright © 2016年 mihb. All rights reserved.
//

#import "ImageListView.h"
#import <TZImagePickerController.h>
#import "ImageItemCell.h"
#import <UIView+SDAutoLayout.h>
#import <UIView+SDExtension.h>
#import "SDPhotoBrowser.h"
#import <UIImageView+WebCache.h>
#import "SVProgressHUD.h"



@interface ImageListView()<UICollectionViewDataSource, UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,SDPhotoBrowserDelegate>


@property (strong, nonatomic, readonly) UIViewController *rootViewController;


@property (nonatomic, weak) UIView *tempMoveCell;
@property (nonatomic, strong) NSIndexPath *originalIndexPath;
@property (nonatomic, strong) NSIndexPath *moveIndexPath;
@end

@implementation ImageListView
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
        
        UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPressed:)];
        longPress.minimumPressDuration = 0.5;
        [_collectionView addGestureRecognizer:longPress];
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

-(BOOL)judgeStr:(NSString *)str1 with:(NSString *)str2

{
    
       
    int a=[str1 intValue];
    
       
    double s1=[str2 doubleValue];
    
      
    int s2=[str2 intValue];
    
        
     if (s1/a-s2/a>0) {
        
        
          return NO;
        
           
    }
    
       
    return YES;
    
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
//        cell.imageView.image = [self.imageArray objectAtIndex:indexPath.row];
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
        
        SDPhotoBrowser *photoBrowser = [SDPhotoBrowser new];
        photoBrowser.delegate = self;
        photoBrowser.currentImageIndex = indexPath.item;
        photoBrowser.imageCount = self.imageArray.count;
        photoBrowser.sourceImagesContainerView = self.collectionView;
        [photoBrowser show];
        
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

// 返回高质量图片的url
//- (NSURL *)photoBrowser:(SDPhotoBrowser *)browser highQualityImageURLForIndex:(NSInteger)index
//{
//    NSString *urlStr = [[self.modelsArray[index] thumbnail_pic] stringByReplacingOccurrencesOfString:@"thumbnail" withString:@"bmiddle"];
//    return [NSURL URLWithString:urlStr];
//}

#pragma mark - seter
-(void)setImageArray:(NSMutableArray *)imageArray{
    _imageArray = imageArray;
    [self.collectionView reloadData];
//    [self reloadLayout];
}

#pragma mark Click Event

- (void)deleteBtnClik:(UIButton *)sender {
    
    NSInteger index = sender.tag;
    NSInteger itemCount = self.imageArray.count;
    if (self.didDeleteBlock) {
        self.didDeleteBlock(index);
    }
    
    [self.imageArray removeObjectAtIndex:index];
//    [self.assetArray removeObjectAtIndex:index];
    
    if (itemCount == self.maxImgCount) {
        [_collectionView reloadData];
        return;
    }
    __weak typeof(self)weakSelf = self;
    [_collectionView performBatchUpdates:^{
        
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:index inSection:0];
        [_collectionView deleteItemsAtIndexPaths:@[indexPath]];
    } completion:^(BOOL finished) {
//        [weakSelf reloadLayout];
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
    TZImagePickerController *imagePickerVc = [[TZImagePickerController alloc] initWithMaxImagesCount:max delegate:nil];
    
    // 1.如果你需要将拍照按钮放在外面，不要传这个参数
//    imagePickerVc.selectedAssets = _assetArray; // optional, 可选的
    //    imagePickerVc.allowTakePicture = self.showTakePhotoBtnSwitch.isOn; // 在内部显示拍照按钮
    
    // 2. Set the appearance
    // 2. 在这里设置imagePickerVc的外观
    // imagePickerVc.navigationBar.barTintColor = [UIColor greenColor];
    // imagePickerVc.oKButtonTitleColorDisabled = [UIColor lightGrayColor];
    // imagePickerVc.oKButtonTitleColorNormal = [UIColor greenColor];
    
    // 3. Set allow picking video & photo & originalPhoto or not
    // 3. 设置是否可以选择视频/图片/原图
    imagePickerVc.allowPickingVideo = NO;
    imagePickerVc.allowPickingOriginalPhoto = NO;
    
    __weak typeof(self)weakSelf = self;
    [imagePickerVc setDidFinishPickingPhotosHandle:^(NSArray<UIImage *> *photos, NSArray *assets, BOOL isSelectOriginalPhoto) {
        [_imageArray addObjectsFromArray:photos];
//        _assetArray = [NSMutableArray arrayWithArray:assets];
        [_collectionView reloadData];
//        [weakSelf reloadLayout];
        if (self.didSelectBlcok) {
            self.didSelectBlcok(photos);
        }
    }];
    [self.rootViewController presentViewController:imagePickerVc animated:YES completion:nil];
}

- (void)longPressed:(UILongPressGestureRecognizer *)longPressGesture{
    if (self.banMove) {
        return;
    }
    if (longPressGesture.state == UIGestureRecognizerStateBegan) {
        [self gestureBegan:longPressGesture];
    }
    if (longPressGesture.state == UIGestureRecognizerStateChanged) {
        [self gestureChange:longPressGesture];
    }
    if (longPressGesture.state == UIGestureRecognizerStateCancelled ||
        longPressGesture.state == UIGestureRecognizerStateEnded){
        [self gestureEndOrCancle:longPressGesture];
    }
}

- (void)gestureBegan:(UILongPressGestureRecognizer *)longPressGesture{
    //获取手指所在的cell
    _originalIndexPath = [_collectionView indexPathForItemAtPoint:[longPressGesture locationOfTouch:0 inView:longPressGesture.view]];
    if (_originalIndexPath.item >= _imageArray.count) {
        return;
    }
    UICollectionViewCell *cell = [_collectionView cellForItemAtIndexPath:_originalIndexPath];
    UIView *tempMoveCell = [cell snapshotViewAfterScreenUpdates:NO];
    cell.hidden = YES;
    _tempMoveCell = tempMoveCell;
    _tempMoveCell.frame = cell.frame;
    _tempMoveCell.transform = CGAffineTransformMakeScale(1.05, 1.05);
    [_collectionView addSubview:_tempMoveCell];
    
}

- (void)gestureChange:(UILongPressGestureRecognizer *)longPressGesture{
    if (_originalIndexPath.item >= _imageArray.count) {
        return;
    }
    CGPoint point = [longPressGesture locationOfTouch:0 inView:longPressGesture.view];
    _tempMoveCell.center = CGPointMake(point.x, point.y);
    for (UICollectionViewCell *cell in [_collectionView visibleCells]) {
        
        NSIndexPath *currentIndexPath = [_collectionView indexPathForCell:cell];
        if (currentIndexPath == _originalIndexPath || _originalIndexPath.item >= _imageArray.count || currentIndexPath.item >= _imageArray.count) {
            continue;
        }
        //计算中心距
        CGFloat space = sqrtf(pow(_tempMoveCell.center.x - cell.center.x, 2) + powf(_tempMoveCell.center.y - cell.center.y, 2));
        if (space <= _tempMoveCell.bounds.size.width / 2) {
            _moveIndexPath = currentIndexPath;
            //移动
            [_collectionView moveItemAtIndexPath:_originalIndexPath toIndexPath:_moveIndexPath];
            
            [_imageArray exchangeObjectAtIndex:_originalIndexPath.item withObjectAtIndex:_moveIndexPath.item];
//            [_assetArray exchangeObjectAtIndex:_originalIndexPath.item withObjectAtIndex:_moveIndexPath.item];
            //设置移动后的起始indexPath
            _originalIndexPath = _moveIndexPath;
            break;
        }
    }
}

- (void)gestureEndOrCancle:(UILongPressGestureRecognizer *)longPressGesture{
    if (_originalIndexPath.item >= _imageArray.count) {
        return;
    }
    UICollectionViewCell *cell = [_collectionView cellForItemAtIndexPath:_originalIndexPath];
    _collectionView.userInteractionEnabled = NO;
    [UIView animateWithDuration:0.25 animations:^{
        _tempMoveCell.center = cell.center;
    } completion:^(BOOL finished) {
        [_tempMoveCell removeFromSuperview];
        cell.hidden = NO;
        _collectionView.userInteractionEnabled = YES;
        
    }];
}
@end
