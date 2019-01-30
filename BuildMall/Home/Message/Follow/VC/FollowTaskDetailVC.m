//
//  FollowTaskDetailVC.m
//  BuildMall
//
//  Created by 51wood on 2018/11/23.
//  Copyright © 2018 51wood. All rights reserved.
//

#import "FollowTaskDetailVC.h"

#import "DOPDatePickerView.h"
#import "ChoosePersonVC.h"
#import "NewFollowTaskCell.h"
#import "HeadCell.h"
#import "ChoosePersonListView.h"
#import "ImageItemCell.h"
#import <UIImageView+WebCache.h>
#import "SDPhotoBrowser.h"
#import "UIView+SDAutoLayout.h"
#import <UIView+SDExtension.h>

@interface FollowTaskDetailVC ()<UICollectionViewDataSource, UICollectionViewDelegate>

{
    UIView * _backWindowView;
    
    CGFloat _imgItemWH;
    
    
}


@property(nonatomic,strong)UICollectionView *collectionView;

@property(nonatomic,assign)NSInteger num;

@property(nonatomic,strong)NSMutableArray *imageArray;
@property(nonatomic,assign)NSInteger maxImgCount;
@property(nonatomic,assign)BOOL banDel;//!<禁止删除
@property(nonatomic,copy)void((^didDeleteBlock)(NSInteger index));
@property(nonatomic,assign)BOOL isRadio;//!<是否单选


@property (weak, nonatomic) IBOutlet UIButton *deleteBtn;
@property (weak, nonatomic) IBOutlet UIButton *edirctBtn;
@property (weak, nonatomic) IBOutlet UILabel *guanlianLable;
@property (weak, nonatomic) IBOutlet UIView *remarkView;
@property (weak, nonatomic) IBOutlet UILabel *remarkLable;
@property (weak, nonatomic) IBOutlet UIView *guanlianView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *top;

@end

@implementation FollowTaskDetailVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.navigationItem.title = @"跟进任务";
    
    _imageArray = [[NSMutableArray alloc]init];
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    
    CGFloat margin = 20;
    
    CGFloat itemWH = ((screenW - margin*6) / 5);
    _imgItemWH = itemWH;
    flowLayout.itemSize = CGSizeMake(itemWH, itemWH);
    flowLayout.minimumInteritemSpacing = margin;//行间距
    flowLayout.minimumLineSpacing = margin;//列间距
    flowLayout.sectionInset = UIEdgeInsetsMake(10, 20, 10, 20);
    _collectionView = [[UICollectionView alloc]initWithFrame:self.guanlianView.bounds collectionViewLayout:flowLayout];
    
    
    _collectionView.dataSource = self;
    _collectionView.delegate = self;
    _collectionView.scrollEnabled = NO;
    _collectionView.backgroundColor = [UIColor whiteColor];
    [_collectionView registerClass:[ImageItemCell class] forCellWithReuseIdentifier:@"ImageItemCell"];
    
    
    self.maxImgCount = 100;
    [_guanlianView addSubview:_collectionView];
    [_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.bottom.equalTo(_guanlianView).offset(0);
        
    }];
    
}

- (IBAction)deleteAction:(UIButton *)sender {
    
    
}

- (IBAction)edirctAction:(UIButton *)sender {
    
    
}



@end
