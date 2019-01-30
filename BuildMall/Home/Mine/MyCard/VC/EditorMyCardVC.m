//
//  EditorMyCardVC.m
//  BuildMall
//
//  Created by 51wood on 2019/1/23.
//  Copyright © 2019 51wood. All rights reserved.
//

#import "EditorMyCardVC.h"
#import "EditorCardDetailVC.h"
#import "BasicInformationVC.h"
#import "UploadVideoVC.h"
#import "CardShareSetVC.h"

@interface EditorMyCardVC ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UITableView* tableView;

@property(nonatomic,strong)NSMutableArray* dataArray;

@end

@implementation EditorMyCardVC


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.navigationItem.title = @"我的主页";
    
    _dataArray = [NSMutableArray array];
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, screenW, screenH)];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    _tableView.tableFooterView = [UIView new];
    
    NSArray* array = @[@"选择名片样式",@"名片基本信息",@"推荐商品",@"个人简介/语音/标签/图片",@"视频",@"名片分享设置"];
    
    _dataArray = [NSMutableArray arrayWithArray:array];

}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataArray.count;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CELL"];
    if (cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CELL"];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.textLabel.text = _dataArray[indexPath.row];
    cell.textLabel.textColor = [UIColor colorWithHexString:@"333333"];
    cell.textLabel.font = [UIFont systemFontOfSize:14];
    cell.imageView.image = [UIImage imageNamed:@"star"];
    UIImageView* rightImg = [UIImageView new];
    rightImg.image = [UIImage imageNamed:@"bt"];

    [cell.contentView addSubview:rightImg];
    [rightImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(cell.contentView).offset(-20);
        make.centerY.equalTo(cell.contentView);
        make.width.equalTo(@(8));
        make.height.equalTo(@(12));
    }];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        
    }else if (indexPath.row == 1)
    {
        BasicInformationVC* VC = [BasicInformationVC new];
        [self.navigationController pushViewController:VC animated:YES];
    }else if (indexPath.row == 2)
    {
        
    }else if (indexPath.row == 3)
    {
        EditorCardDetailVC* VC = [EditorCardDetailVC new];
        [self.navigationController pushViewController:VC animated:YES];
        
    }else if (indexPath.row == 4)
    {
        UploadVideoVC* VC = [UploadVideoVC new];
        
        [self.navigationController pushViewController:VC animated:YES];
    }else
    {
        CardShareSetVC* VC = [CardShareSetVC new];
        
        [self.navigationController pushViewController:VC animated:YES];
    }
}

@end
