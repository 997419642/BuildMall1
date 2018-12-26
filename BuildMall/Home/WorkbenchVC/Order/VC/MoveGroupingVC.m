//
//  MoveGroupingVC.m
//  BuildMall
//
//  Created by 51wood on 2018/12/3.
//  Copyright © 2018 51wood. All rights reserved.
//

#import "MoveGroupingVC.h"

@interface MoveGroupingVC ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UIButton *cancelBtn;
@property (weak, nonatomic) IBOutlet UIButton *sureBtn;


@property(nonatomic,strong)UITableView* tableView;


@end

@implementation MoveGroupingVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.navigationItem.title = @"转移分组";
    _cancelBtn.layer.masksToBounds =YES;
    _cancelBtn.layer.cornerRadius = 5;
    _cancelBtn.layer.borderWidth = 1;
    _cancelBtn.layer.borderColor = [UIColor colorWithHexString:@"52C9C5"].CGColor;
    _sureBtn.layer.masksToBounds = YES;
    _sureBtn.layer.cornerRadius = 5;
    
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, screenW, screenH-64) style:UITableViewStyleGrouped];
    _tableView.backgroundColor = [UIColor colorWithHexString:@"F2F2F2"];
    [self.view addSubview:self.tableView];
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.rowHeight = 60;
    [_tableView registerNib:[UINib nibWithNibName:@"ReportDetailCell" bundle:nil] forCellReuseIdentifier:@"ReportDetailCell"];
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *identifier1 = @"ReportDetailCell";
    ReportDetailCell *cell1 = [_tableView dequeueReusableCellWithIdentifier:identifier1];
    tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    
    cell1.selectionStyle = UITableViewCellSelectionStyleNone;
    //    DOPJobsModel* model = _jobsArray[indexPath.row];
    //    cell1.userModel = model;
    //    cell1.delegate = self;
    
    return cell1;
}

- (IBAction)cancelAction:(id)sender {
    
}

- (IBAction)sureAction:(id)sender {
    
}

@end
