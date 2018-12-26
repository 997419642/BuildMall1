//
//  CloseOrderVC.m
//  BuildMall
//
//  Created by 51wood on 2018/11/26.
//  Copyright © 2018 51wood. All rights reserved.
//

#import "CloseOrderVC.h"
#import "CloseOrderCell.h"
#import "CloseOrdermodel.h"

@interface CloseOrderVC ()<UITextViewDelegate,UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UIButton *oneBtn;
@property (weak, nonatomic) IBOutlet UIButton *closeBtn;

@property(nonatomic,strong)UIButton* selectBtn;

@property(nonatomic,strong)UITextView *textView;

@property(nonatomic,strong)NSMutableArray* dataArray;

@property(nonatomic,strong)UITableView* tableView;

@property(nonatomic,strong)NSMutableArray* selectArray;

@end

@implementation CloseOrderVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    _dataArray = [NSMutableArray array];
    _selectArray = [NSMutableArray array];
    _selectBtn = _oneBtn;

    self.navigationItem.title = @"关闭订单";
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, screenW, screenH-64) style:UITableViewStyleGrouped];
    _tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    
    [self.view addSubview:self.tableView];
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.rowHeight = 60;
    [_tableView registerNib:[UINib nibWithNibName:@"CloseOrderCell" bundle:nil] forCellReuseIdentifier:@"CloseOrderCell"];

    [self refreshing];
}



-(void)refreshing
{
    __weak typeof(self)weakSelf = self;

    NSMutableDictionary* dict = [NSMutableDictionary dictionary];
    [[WebClient sharedClient] orderTableShowReturnedType:dict complete:^(ResponseMode *result, NSError *error) {
        if (!error) {
            if (result.code == 0) {
                weakSelf.dataArray = [CloseOrdermodel mj_objectArrayWithKeyValuesArray:result.data];
                for (CloseOrdermodel* model in weakSelf.dataArray) {
                    if (model.stateId == 1) {
                        model.isSelect = YES;
                    }
                }
                [weakSelf.tableView reloadData];
            }
        }
    }];
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{

    return 0.1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 350;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView* view = [UIView new];
    return view;
}

-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UIView* footView = [[UIView alloc]init];
    footView.frame = CGRectMake(0, 0, screenW, 350);
    UITextView* textView = [UITextView new];
    [footView addSubview:textView];
    _textView = textView;
    textView.text = @"填写备注信息(必填)";
    textView.textColor = [UIColor colorWithHexString:@"A0A0A0"];
    textView.delegate = self;
    [textView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(footView).offset(10);
        make.left.equalTo(footView).offset(20);
        make.right.equalTo(footView).offset(-20);
        make.height.equalTo(@(144));

    }];
    
    UIButton* sureBtn = [UIButton new];
    [sureBtn setTitle:@"关闭订单" forState:UIControlStateNormal];
    [sureBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [sureBtn setBackgroundColor:[UIColor colorWithHexString:@"FA7376"]];
    [footView addSubview:sureBtn];
    sureBtn.layer.masksToBounds = YES;
    sureBtn.layer.cornerRadius = 5;
    [sureBtn addTarget:self action:@selector(sureBtnAction) forControlEvents:UIControlEventTouchUpInside];
    [sureBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(textView.mas_bottom).offset(70);
        make.left.equalTo(footView).offset(20);
        make.right.equalTo(footView).offset(-20);
        make.height.equalTo(@(43));
    }];

    return footView;
}

-(void)sureBtnAction
{
    
    if ([_textView.text isEqualToString:@""] || [_textView.text isEqualToString:@"填写备注信息(必填)"]) {
        [self showAlert:@"请输入备注"];
        return;
    }
    NSMutableDictionary* dict = [NSMutableDictionary dictionary];
    CloseOrdermodel* model = _selectArray[0];
    [dict setObject:model.type forKey:@"reason"];
    [dict setObject:_orderId forKey:@"orderId"];
    [dict setObject:_textView.text forKey:@"remarks"];
    AMUserAccountInfo *userInfo = [AMUserAccountInfo shareInfo];
    [dict setObject:userInfo.userId forKey:@"userId"];
    __weak typeof(self)weakSelf = self;

    
    [[WebClient sharedClient]orderCloseOrder:dict complete:^(ResponseMode *result, NSError *error) {
        if (!error) {
            if (result.code == 0) {
                [weakSelf showAlert:@"操作成功"];
                [weakSelf.navigationController popViewControllerAnimated:YES];
            }
        }
    }];
}

-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [_textView endEditing:YES];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataArray.count;
}



-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *identifier1 = @"CloseOrderCell";
    CloseOrderCell *cell1 = [_tableView dequeueReusableCellWithIdentifier:identifier1];
    tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    
    cell1.selectionStyle = UITableViewCellSelectionStyleNone;
    CloseOrdermodel* dict = _dataArray[indexPath.row];
    cell1.dict = dict;
    if (dict.isSelect == YES) {
        cell1.stateImg.image = [UIImage imageNamed:@"duihao"];
        
    }else
    {
        cell1.stateImg.image = [UIImage imageNamed:@""];

    }
    
    return cell1;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    CloseOrdermodel* dict = _dataArray[indexPath.row];

    
    if (dict.isSelect == YES) {
        return;
    }else
    {
        for (CloseOrdermodel* model in _dataArray) {
            model.isSelect = NO;
            [self.selectArray removeAllObjects];

        }
        dict.isSelect = YES;
        [self.selectArray addObject:dict];

    }
    [self.tableView reloadData];
}

#pragma mark - UITextViewDelegate
- (void)textViewDidEndEditing:(UITextView *)textView
{
    if(textView.text.length < 1){
        textView.text = @"填写备注信息(必填)";
        textView.textColor = [UIColor colorWithHexString:@"A0A0A0"];
    }
}
- (void)textViewDidBeginEditing:(UITextView *)textView
{
    if([textView.text isEqualToString:@"填写备注信息(必填)"]){
        textView.text=@"";
        textView.textColor=[UIColor blackColor];
    }
}
- (IBAction)changeAction:(UIButton *)sender {
    [_textView resignFirstResponder];
    
    if (self.selectBtn == sender) {
        return;
    }
        
    self.selectBtn.selected = !self.selectBtn.selected;
    if (sender.selected == NO) {
        sender.selected = YES;
        
        
    }else
    {
        sender.selected = NO;
    }
    
    self.selectBtn = sender;
}

- (IBAction)closeAction:(id)sender {
    [_textView resignFirstResponder];

    
}


@end
