
//
//  NewFollowTaskVC.m
//  BuildMall
//
//  Created by 曾祥明 on 2018/11/12.
//  Copyright © 2018 51wood. All rights reserved.
//

#import "NewFollowTaskVC.h"
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


@interface NewFollowTaskVC ()<UITextFieldDelegate,UITextViewDelegate,DatePickerViewDelegate,UICollectionViewDataSource, UICollectionViewDelegate>
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





@property (weak, nonatomic) IBOutlet UIButton *saveBtn;
@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (weak, nonatomic) IBOutlet UITextField *remarkTF;
@property(nonatomic,strong)DOPDatePickerView * pikerView;
@property (weak, nonatomic) IBOutlet UIButton *timeBtn;


//@property (nonatomic, strong)UITableView* tableView;
@property (weak, nonatomic) IBOutlet UILabel *remarkLable;
@property (weak, nonatomic) IBOutlet UILabel *guanlianLable;

@property(nonatomic,strong)ChoosePersonListView *imageList;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *top;

@property (weak, nonatomic) IBOutlet UIView *guanlianView;


@end

@implementation NewFollowTaskVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.navigationItem.title  = @"新建跟进任务";
    _textView.text = @"例如：电话回访客户";
    _textView.textColor = [UIColor colorWithHexString:@"#D5D5D5"];
    _textView.delegate = self;
    
    _saveBtn.layer.masksToBounds = YES;
    _saveBtn.layer.cornerRadius = 5;
    
//    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(80,0 , 80,screenW) style:UITableViewStylePlain];
//
//    [_tableView registerNib:[UINib nibWithNibName:@"HeadCell" bundle:nil] forCellReuseIdentifier:@"HeadCell"];
//
//    self.tableView.dataSource=self;
//    self.tableView.delegate=self;
//    //对TableView要做的设置
//    self.tableView.transform=CGAffineTransformMakeRotation(-M_PI / 2);
//    self.tableView.showsVerticalScrollIndicator=NO;
//    [self.view addSubview:self.tableView];
//    self.tableView.center = CGPointMake(_guanlianView.centerX, _guanlianView.centerY);
//    _tableView.rowHeight = 80;
//    _tableView.hidden = NO;
//    _guanlianView.hidden = NO;

    
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

-(UICollectionView *)collectionView{
    if (_collectionView==nil) {
       
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
                [self changeStatus];

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
//            [SVProgressHUD showInfoWithStatus:count];
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
        weakSelf.collectionView.fixedHeight = @(height);
    }];
}

- (void)pushImagePickerController {
    NSInteger max = self.maxImgCount - self.imageArray.count;
    if (self.isRadio) {
        max = max > 1?1:max;
    }
    
    ChoosePersonVC* VC = [ChoosePersonVC new];
    
    __weak typeof(self)weakSelf = self;
    
    VC.slectComBlock = ^(NSMutableArray *arr) {
        
        self.imageArray = arr;
        [self.collectionView reloadData];
    };
    
    if (_imageArray.count) {
        
        VC.imageArray = _imageArray;
    }
    
    [self.navigationController pushViewController:VC animated:YES];
    
    
    
}


-(void)changeStatus
{
    if (_num!=0) {
        //        _threeView.height = _imageList.num;
        _top.constant = _num;
    }
}

-(void)cancelBtn
{
    [_backWindowView removeFromSuperview];
    [self.pikerView removeFromSuperview];
}

//-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
//{
//    return 10;
//}
//
//-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    HeadCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HeadCell"];
//    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
//
//    cell.selectionStyle = UITableViewCellSelectionStyleNone;
//
//    if (!cell) {
//        cell = [[HeadCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"HeadCell"];
//    }
//    //对Cell要做的设置
//    cell.transform = CGAffineTransformMakeRotation(M_PI/2);
//    NSArray* arr = @[@"备注名", @"公司名称", @"职位", @"性别",
//                                    @"标签", @"备注手机", @"邮箱", @"详细",
//                                    @"生日", @"屏蔽"];
//    NSMutableArray* dataArr = [NSMutableArray arrayWithArray:arr];
//    cell.nameLable.text= dataArr[indexPath.row];
//    return cell;
//}

#pragma mark - UITextViewDelegate
- (void)textViewDidEndEditing:(UITextView *)textView
{
    if(textView.text.length < 1){
        textView.text = @"例如：电话回访客户";
        textView.textColor = [UIColor lightGrayColor];
    }
}
- (void)textViewDidBeginEditing:(UITextView *)textView
{
    if([textView.text isEqualToString:@"例如：电话回访客户"]){
        textView.text=@"";
        textView.textColor=[UIColor blackColor];
    }
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}
- (IBAction)timeAction:(UIButton *)sender {
    
    _backWindowView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    _backWindowView.backgroundColor = [UIColor blackColor];
    _backWindowView.alpha = 0.5;
    [[UIApplication sharedApplication].keyWindow addSubview:_backWindowView];
    _pikerView = [DOPDatePickerView datePickerView];
   
    [_pikerView.datePickerView setMaximumDate:[NSDate date]];
    
    _pikerView.delegate = self;
    _pikerView.type = 0;
    _pikerView.frame= CGRectMake(0, screenH, screenW, 257);
    [[UIApplication sharedApplication].keyWindow addSubview:_pikerView];
    
    [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        _pikerView.frame = CGRectMake(0, screenH-257, screenW, 257);
    } completion:^(BOOL finished) {
    }];
    
}

- (void)getSelectDate:(NSString *)date type:(DateType)type {
    NSLog(@"%d - %@", type, date);
    [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        [_backWindowView removeFromSuperview];
        _backWindowView = nil;
        _pikerView.frame = CGRectMake(0, screenH, screenW, 257);
    } completion:^(BOOL finished) {
        [self.pikerView removeFromSuperview];
        self.pikerView = nil;
        [_timeBtn setTitle:date forState:UIControlStateNormal];
    }];
    
}

- (IBAction)saveAction:(id)sender {
    
    
}
- (IBAction)addPerson:(UIButton *)sender {
    
    ChoosePersonVC* VC = [ChoosePersonVC new];
    
    [self.navigationController pushViewController:VC animated:YES];
}



@end
