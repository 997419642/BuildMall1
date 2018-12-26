//
//  ChoosePersonVC.m
//  BuildMall
//
//  Created by 51wood on 2018/11/21.
//  Copyright © 2018 51wood. All rights reserved.
//

#import "ChoosePersonVC.h"

#import "ChoosePersonResultVC.h"
#import "Product.h"
#import "DataModel.h"
#import "ChoosePersonCell.h"
#import "BasicNavigationController.h"

@interface ChoosePersonVC ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) NSMutableArray *searchResults; // Filtered search results
@property (nonatomic, strong) NSMutableArray *products;

@property (nonatomic, strong) NSMutableArray * resultArray;

@property (nonatomic, strong)NSMutableArray* selectArray;
@property (nonatomic, strong)UITableView* tableView;
@property (weak, nonatomic) IBOutlet UISearchBar *scerchBar;

@end

@implementation ChoosePersonVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.title = @"选择客户";

    _products = [NSMutableArray array];
    
    _selectArray = [NSMutableArray array];
    
    _scerchBar.backgroundImage = [[UIImage alloc]init];
    _scerchBar.barTintColor  = [UIColor colorWithHexString:@"F5F5F5"];
    _scerchBar.backgroundColor  = [UIColor colorWithHexString:@"F5F5F5"];
    _scerchBar.placeholder = @"搜索";
    UITextField * searchField = [_scerchBar valueForKey:@"_searchField"];
    [searchField setValue:[UIColor colorWithHexString:@"BFBFBF"] forKeyPath:@"_placeholderLabel.textColor"];
    [searchField setValue:[UIFont boldSystemFontOfSize:13] forKeyPath:@"_placeholderLabel.font"];
    
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 44, screenW, screenH-44-64) style:UITableViewStylePlain];
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    [self.view addSubview:self.tableView];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    [self.tableView registerNib:[UINib nibWithNibName:@"ChoosePersonCell" bundle:nil] forCellReuseIdentifier:@"ChoosePersonCell"];
    self.tableView.rowHeight = 70;
    
    NSArray *testArr = @[@"张三",@"李四",@"王五",@"赵六",@"田七",@"王小二",@"阿三"];
    
    for (NSString * name in testArr)
    {
        DataModel * model = [DataModel new];
        model.aName = name;
        [self.products addObject:model];
    }
    

    for (DataModel* model0 in _imageArray) {
        
        for (DataModel* model in _products) {
            if (model0.aName == model.aName) {
                model.isselect = YES;
                [_selectArray addObject:model];
            }
        }
        
       
    }
    
    
    UIBarButtonItem *backItem =[[UIBarButtonItem alloc]init];
    self.navigationItem.backBarButtonItem = backItem;
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"完成" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(pressright) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:button];
    
    
    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftButton setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
    leftButton.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 0);
    [leftButton setTitle:@"返回" forState:UIControlStateNormal];
    //设置换行识别方式
    leftButton.titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
    leftButton.titleEdgeInsets = UIEdgeInsetsMake(0, 5, 0, -5);
    [leftButton sizeToFit];
    [leftButton addTarget:self action:@selector(pressleft) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:leftButton];
    
}

-(void)pressright
{
    self.slectComBlock(self.selectArray);
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)pressleft
{
    [self.navigationController popViewControllerAnimated:YES];
    
}

- (IBAction)searchAction:(UIButton *)sender {
    
    ChoosePersonResultVC *searchViewController = [[ChoosePersonResultVC alloc] init];
    
    UINavigationController *navigationController =
    [[BasicNavigationController alloc] initWithRootViewController:searchViewController];
    [self presentViewController:navigationController
                       animated:NO
                     completion:nil];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.products.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ChoosePersonCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ChoosePersonCell" forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    DataModel *product = [self.products objectAtIndex:indexPath.row];
    cell.nameLable.text = product.aName;

    
    if (product.isselect == YES) {
        
        cell.selcImg.image = [UIImage imageNamed:@"iconcheckSele"];
        
        
        
    }else
    {
        cell.selcImg.image = [UIImage imageNamed:@"iconcheck"];
        
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    DataModel * molde0 = _products[indexPath.row];
    
    if (molde0.isselect == NO) {
        molde0.isselect = YES;
        [_selectArray addObject:molde0];
        
    }else
    {
        molde0.isselect = NO;
        [_selectArray removeObject:molde0];
        
    }
    
    
    [tableView reloadData];
    
}


@end
