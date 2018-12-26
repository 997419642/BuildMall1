//
//  MLSearchResultsTableViewController.m
//  Medicine
//
//  Created by Visoport on 3/1/17.
//  Copyright © 2017年 Visoport. All rights reserved.
//

#import "ChooseSearchResultsVC.h"
#import "AdressCustomerCell.h"

@interface ChooseSearchResultsVC ()

@end

@implementation ChooseSearchResultsVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    [self.tableView registerNib:[UINib nibWithNibName:@"AdressCustomerCell" bundle:nil] forCellReuseIdentifier:@"AdressCustomerCell"];
    
    self.tableView.rowHeight = 70;


    //获取通知中心单例对象
    NSNotificationCenter * center = [NSNotificationCenter defaultCenter];
    //添加当前类对象为一个观察者，name和object设置为nil，表示接收一切通知
    [center addObserver:self selector:@selector(handleColorChange:) name:@"searchBarDidChange" object:nil];
}

-(void)handleColorChange:(NSNotification* )sender
{
    NSString *text = sender.userInfo[@"searchText"];
    
    NSLog(@"%@", text);
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 10;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    AdressCustomerCell *cell = [tableView dequeueReusableCellWithIdentifier:@"AdressCustomerCell" forIndexPath:indexPath];
    
//    cell.textLabel.text = @"我是搜索结果";
//    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 取消选中
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    self.didSelectText([tableView cellForRowAtIndexPath:indexPath].textLabel.text);
    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    self.didSelectText(@"");
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
