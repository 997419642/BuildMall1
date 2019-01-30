//
//  ImageListView.h
//  YouDaSuPei
//
//  Created by 米海波 on 16/7/8.
//  Copyright © 2016年 mihb. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ImageListView : UIView

@property(nonatomic,assign)BOOL isRadio;//!<是否单选
@property(nonatomic,assign)BOOL banMove;//!<禁止移动
@property(nonatomic,assign)BOOL banDel;//!<禁止删除

//@property(nonatomic,assign)BOOL isSendDynamic;

@property(nonatomic,assign)NSInteger maxImgCount;
@property(nonatomic,strong)NSMutableArray *imageArray;
//@property(nonatomic,strong)NSMutableArray *assetArray;

@property(nonatomic,copy)void((^didSelectBlcok)(NSArray *imgArray));
@property(nonatomic,copy)void((^didDeleteBlock)(NSInteger index));

@property(nonatomic,strong)UICollectionView *collectionView;

@property(nonatomic,assign)NSInteger num;


@end
