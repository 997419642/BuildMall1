//
//  DataVC.m
//  BuildMall
//
//  Created by 51wood on 2018/11/8.
//  Copyright © 2018年 51wood. All rights reserved.
//

#import "DataVC.h"
#import "DataCell.h"
#import "TheCollectionTableViewCell.h"

@interface DataVC ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UIButton *openBtn;
@property (weak, nonatomic) IBOutlet UILabel *titleLable;

@property(nonatomic,strong)UITableView* tableView;

@property(nonatomic,strong)NSMutableArray* dataArray;

@property (assign, nonatomic) BOOL isOpen;
@property (assign, nonatomic) NSInteger showButtonNumber;
@property (copy, nonatomic) NSArray *titleArr;
@property (copy, nonatomic) NSArray *topArr;

@property (copy, nonatomic) NSArray *boomArr;

@property (strong, nonatomic) UIButton *theButton;



@end

@implementation DataVC

- (UIButton *)theButton{
    
    if (!_theButton) {
        _theButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
        
        _theButton.frame = CGRectMake(screenW-120, 0, 100, 30);
        [_theButton setTitle:@"共6个标签" forState:UIControlStateNormal];
        [_theButton setImage:[UIImage imageNamed:@"Shape"] forState:UIControlStateNormal];
        [_theButton addTarget:self action:@selector(handleAction:) forControlEvents:(UIControlEventTouchUpInside)];
        [_theButton setTitleColor:[UIColor colorWithHexString:@"999999"] forState:(UIControlStateNormal)];
        _theButton.titleLabel.font = [UIFont systemFontOfSize:12];
        
        
        CGFloat img_W = _theButton.imageView.frame.size.width;
        CGFloat tit_W = _theButton.titleLabel.frame.size.width;
        
        _theButton.titleEdgeInsets = (UIEdgeInsets){
            .top    = 0,
            .left   = - (img_W + 10 / 2),
            .bottom = 0,
            .right  =   (img_W + 10 / 2),
        };
        
        _theButton.imageEdgeInsets = (UIEdgeInsets){
            .top    = 0,
            .left   =   (tit_W + 10 / 2),
            .bottom = 0,
            .right  = - (tit_W + 10 / 2),
        };
        
        [_theButton sizeToFit];

    }
    return _theButton;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    _dataArray = [NSMutableArray array];
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, screenW, screenH-64-50-40-210) style:UITableViewStyleGrouped];
    _tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    
    [self.view addSubview:self.tableView];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [_tableView registerNib:[UINib nibWithNibName:@"DataCell" bundle:nil] forCellReuseIdentifier:@"DataCell"];
    [self.tableView registerNib:[UINib nibWithNibName:@"TheCollectionTableViewCell" bundle:nil] forCellReuseIdentifier:@"TheCollectionTableViewCell"];

    _showButtonNumber = 6;

    _titleArr = @[@"在意价格", @"潜在客户", @"已发资料", @"80后",
                  @"老顾客推荐", @"已成交", @"标题7", @"标题8",
                  @"标题9", @"标题10", @"标题11", @"标题12",
                  @"标题13", @"标题14", @"标题15"];
    
    _topArr = @[@"备注名", @"公司", @"职位", @"授权手机",
                  @"备注手机"];
    _boomArr = @[@"来源", @"微信昵称", @"性别", @"邮箱",
                  @"地址", @"生日", @"备注"];
    
    
}

// 记录按钮点击事件, 设定_isOpen
- (void)handleAction:(UIButton *)sender{
    
    _isOpen = !_isOpen;
    if (_isOpen) {
        _showButtonNumber = _titleArr.count;
        [sender setTitle:@"收起" forState:(UIControlStateNormal)];
    }else{
        _showButtonNumber = 6;
        [sender setTitle:@"共6个标签" forState:(UIControlStateNormal)];
    }
    
    
    [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:1] withRowAnimation:(UITableViewRowAnimationAutomatic)];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        
        return 50;
    }else if (indexPath.section == 1)
    {
        // 根据是否打开的标识 _isOpen返回不同row高度.
        if (_isOpen) {
            // 按照整数/整数丢失精度仍为整数的思想(例如 9/5=1), 显示按钮的行数 = 显示按钮的个数/(每行显示的按钮个数+1) 行数为_titleArr.count / (4+1)
            CGFloat height = (_titleArr.count / (4+1) + 1) * 30;
            
            return height+10;
        }else{
            return 70;
        }
    }else
    {
        return 50;
    }
}

#pragma mark - UITableViewDataSource, UITableViewDelegate -
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    if (section == 0) {
        return _topArr.count;
    }else if(section == 1)
    {
        return 1;
    }else
    {
        return _boomArr.count;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    if (section == 0) {
        return 0.05;
    }else if (section == 1)
    {
        return 0.05;
    }else
    {
        return 30;
    }
    
}


- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    if (section == 0) {
        return 0.05;
    }else if (section == 1)
    {
        return 30;
    }else
    {
        return 0.05;
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        NSString *identifier1 = @"DataCell";
        DataCell *cell1 = [_tableView dequeueReusableCellWithIdentifier:identifier1];
        tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        if (cell1 == nil)
        {
            cell1 = [[DataCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier1];
        }
        cell1.selectionStyle = UITableViewCellSelectionStyleNone;
        NSMutableArray* array = [NSMutableArray arrayWithArray:_topArr];
        cell1.nameLable.text = array[indexPath.row];

        //        cell1.delegate = self;
        return cell1;
    }else if (indexPath.section == 1)
    {
        TheCollectionTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TheCollectionTableViewCell" forIndexPath:indexPath];
        
        [cell setupCellWithNumber:_showButtonNumber andButtonNameArr:_titleArr];
        cell.buttonClicked = ^(NSInteger index){
            
            NSLog(@"点击的按钮下标为: %ld", index);
            
        };
        
        return cell;
    }else
    {
        NSString *identifier1 = @"DataCell";
        DataCell *cell1 = [_tableView dequeueReusableCellWithIdentifier:identifier1];
        tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        if (cell1 == nil)
        {
            cell1 = [[DataCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier1];
        }
        cell1.selectionStyle = UITableViewCellSelectionStyleNone;
        NSMutableArray* array = [NSMutableArray arrayWithArray:_boomArr];
        cell1.nameLable.text = array[indexPath.row];
        //        cell1.delegate = self;
        return cell1;
    }
    
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView* view = [UIView new];
    view.backgroundColor = [UIColor whiteColor];
    if (section == 2) {
        UILabel * lable = [UILabel new];
        lable.text = @"已经成为您的客户21天";
        lable.textColor = [UIColor colorWithHexString:@"666666"];
        [view addSubview:lable];
        lable.font = [UIFont systemFontOfSize:14];
        [lable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(view).offset(37);
            make.centerY.equalTo(view);
        }];
        
    }else
    {
    
    }
  
    return view;
}


- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    
    UIView *firstFooter = [[UIView alloc] initWithFrame:self.theButton.frame];
    firstFooter.backgroundColor = [UIColor whiteColor];
    if (section == 1) {
        [firstFooter addSubview:self.theButton];
        
    }
    return firstFooter;

}


//-(void)scrollViewDidScroll:(UIScrollView *)scrollView {
//    if (scrollView == self.tableView)
//    {
//        UITableView *tableview = (UITableView *)scrollView;
//        CGFloat sectionHeaderHeight = 64;
//        CGFloat sectionFooterHeight = 44;
//        CGFloat offsetY = tableview.contentOffset.y;
//        if (offsetY >= 0 && offsetY <= sectionHeaderHeight)
//        {
//            tableview.contentInset = UIEdgeInsetsMake(-offsetY, 0, -sectionFooterHeight, 0);
//
//        }else if (offsetY >= sectionHeaderHeight && offsetY <= tableview.contentSize.height - tableview.frame.size.height - sectionFooterHeight)
//        {
//            tableview.contentInset = UIEdgeInsetsMake(-sectionHeaderHeight, 0, -sectionFooterHeight, 0);
//        }else if (offsetY >= tableview.contentSize.height - tableview.frame.size.height - sectionFooterHeight && offsetY <= tableview.contentSize.height - tableview.frame.size.height)
//        {
//            tableview.contentInset = UIEdgeInsetsMake(-offsetY, 0, -(tableview.contentSize.height - tableview.frame.size.height - sectionFooterHeight), 0);
//        }
//    }
//}

- (IBAction)openBtn:(UIButton *)sender {
    
    
}




@end
