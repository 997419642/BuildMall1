//
//  SearchAddGoodVC.m
//  BuildMall
//
//  Created by 51wood on 2018/12/19.
//  Copyright © 2018 51wood. All rights reserved.
//

#import "SearchAddGoodVC.h"

@interface SearchAddGoodVC ()<UISearchBarDelegate>

@end

@implementation SearchAddGoodVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    
    // 创建搜索框
    UIView *titleView = [[UIView alloc] initWithFrame:CGRectMake(10, 7, screenW-64-20, 30)];
    UISearchBar *searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(-10, 0, titleView.frame.size.width, 30)];
    searchBar.placeholder = @"搜索";
    searchBar.delegate = self;
    searchBar.backgroundColor = [UIColor whiteColor];
    searchBar.layer.cornerRadius = 12;
    searchBar.layer.masksToBounds = YES;
    [searchBar.layer setBorderWidth:8];
    [searchBar.layer setBorderColor:[UIColor whiteColor].CGColor];
    [titleView addSubview:searchBar];
    self.searchBar = searchBar;
    UITextField * searchField = [_searchBar valueForKey:@"_searchField"];
    [searchField setValue:[UIColor colorWithHexString:@"BFBFBF"] forKeyPath:@"_placeholderLabel.textColor"];
    [searchField setValue:[UIFont boldSystemFontOfSize:12] forKeyPath:@"_placeholderLabel.font"];
    searchField.font = [UIFont systemFontOfSize:13];
    
    self.navigationItem.titleView = titleView;
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonItemStyleDone target:self action:@selector(cancelDidClick)];
}

/** 视图完全显示 */
- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    // 弹出键盘
    [self.searchBar becomeFirstResponder];
}

/** 视图即将消失 */
- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    // 回收键盘
    [self.searchBar resignFirstResponder];
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    NSLog(@"%@",searchBar.text);
    self.slectSearchBlock(searchBar.text);
    [self dismissViewControllerAnimated:NO completion:nil];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    // 滚动时，回收键盘
    [self.searchBar resignFirstResponder];
}

-(void)cancelDidClick
{
    [self dismissViewControllerAnimated:NO completion:nil];
    
}

@end
