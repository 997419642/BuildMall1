//
//  OperationManagementVC.m
//  BuildMall
//
//  Created by 51wood on 2019/1/21.
//  Copyright © 2019 51wood. All rights reserved.
//

#import "OperationManagementVC.h"
#import "OperationManagementCell.h"
#import "AddOperationVC.h"

@interface OperationManagementVC ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *centerY;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation OperationManagementVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.navigationItem.title = @"话术管理";
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [_tableView registerNib:[UINib nibWithNibName:@"OperationManagementCell" bundle:nil] forCellReuseIdentifier:@"OperationManagementCell"];
    _tableView.tableFooterView = [UIView new];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *identifier1 = @"OperationManagementCell";
    OperationManagementCell *cell2 = [_tableView dequeueReusableCellWithIdentifier:identifier1];
    tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    if (cell2 == nil)
    {
        cell2 = [[OperationManagementCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier1];
    }
    cell2.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell2;
}

- (IBAction)btnAction:(UIButton *)sender {
    _centerY.constant = sender.y;
}

- (IBAction)newAddAction:(UIButton *)sender {
    AddOperationVC* VC = [AddOperationVC new];
    
    [self.navigationController pushViewController:VC animated:YES];
    
}

@end
