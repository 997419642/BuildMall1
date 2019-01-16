//
//  AdressResultVC.m
//  BuildMall
//
//  Created by 51wood on 2018/11/16.
//  Copyright © 2018年 51wood. All rights reserved.
//

#import "AdressResultVC.h"
#import "MLSearchResultsTableViewController.h"
#import "TitlePersonVC.h"

@interface AdressResultVC ()<UISearchBarDelegate>
@property (weak, nonatomic) IBOutlet UIButton *oneBtn;
@property (weak, nonatomic) IBOutlet UIButton *twoBtn;
@property (weak, nonatomic) IBOutlet UIButton *threeBtn;
@property (weak, nonatomic) IBOutlet UIButton *fourBtn;
@property (weak, nonatomic) IBOutlet UIButton *fiveBtn;
@property (weak, nonatomic) IBOutlet UIButton *sixBtn;
@property (weak, nonatomic) IBOutlet UIButton *sevenBtn;
@property (weak, nonatomic) IBOutlet UIButton *eightBtn;
@property (weak, nonatomic) IBOutlet UIButton *nineBtn;
@property (weak, nonatomic) IBOutlet UIButton *allBtn;

@property (nonatomic, weak) MLSearchResultsTableViewController *searchSuggestionVC;


@end

@implementation AdressResultVC

- (MLSearchResultsTableViewController *)searchSuggestionVC
{
    if (!_searchSuggestionVC) {
        MLSearchResultsTableViewController *searchSuggestionVC = [[MLSearchResultsTableViewController alloc] initWithStyle:UITableViewStylePlain];
        __weak typeof(self) _weakSelf = self;
        searchSuggestionVC.didSelectText = ^(NSString *didSelectText) {
            
            if ([didSelectText isEqualToString:@""]) {
                [self.searchBar resignFirstResponder];
            }
            else
            {
                // 设置搜索信息
                _weakSelf.searchBar.text = didSelectText;
            }
        };
        searchSuggestionVC.view.frame = CGRectMake(0, 0, self.view.mj_w, self.view.mj_h);
        searchSuggestionVC.view.backgroundColor = [UIColor whiteColor];
        [self.view addSubview:searchSuggestionVC.view];
        [self addChildViewController:searchSuggestionVC];
        _searchSuggestionVC = searchSuggestionVC;
    }
    return _searchSuggestionVC;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    _allBtn.layer.cornerRadius = 15;
    _allBtn.layer.borderColor = [UIColor colorWithHexString:@"5F7CCC"].CGColor;//设置边框颜色
    _allBtn.layer.borderWidth = 1.0f;
    _oneBtn.layer.cornerRadius = 15;
    _twoBtn.layer.cornerRadius = 15;
    _threeBtn.layer.cornerRadius = 15;
    _fourBtn.layer.cornerRadius = 15;
    _fiveBtn.layer.cornerRadius = 15;
    _sixBtn.layer.cornerRadius = 15;
    _sevenBtn.layer.cornerRadius = 15;
    _eightBtn.layer.cornerRadius = 15;
    _nineBtn.layer.cornerRadius = 15;

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
    self.navigationItem.hidesBackButton=NO;

}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationItem.hidesBackButton=YES;
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    if ([searchText isEqualToString:@""]) {
        self.searchSuggestionVC.view.hidden = YES;
        self.tableView.hidden = NO;
    }
    else
    {
        self.searchSuggestionVC.view.hidden = NO;
        self.tableView.hidden = YES;
        [self.view bringSubviewToFront:self.searchSuggestionVC.view];
        
        //创建一个消息对象
        NSNotification * notice = [NSNotification notificationWithName:@"searchBarDidChange" object:nil userInfo:@{@"searchText":searchText}];
        //发送消息
        [[NSNotificationCenter defaultCenter]postNotification:notice];
    }
    
    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    // 滚动时，回收键盘
    [self.searchBar resignFirstResponder];
}

- (IBAction)oneAction:(UIButton *)sender {
}
- (IBAction)twoAction:(id)sender {
}
- (IBAction)threeAction:(id)sender {
}
- (IBAction)fourAction:(id)sender {
}
- (IBAction)fiveAction:(id)sender {
}
- (IBAction)sixAction:(id)sender {
}
- (IBAction)sevenAction:(id)sender {
}
- (IBAction)eightAction:(id)sender {
}
- (IBAction)nineAction:(id)sender {
}
- (IBAction)allBtn:(UIButton *)sender {
    
    TitlePersonVC* VC = [TitlePersonVC new];
    
    [self.navigationController pushViewController:VC animated:YES];
}

-(void)cancelDidClick
{
    [self dismissViewControllerAnimated:NO completion:nil];

}

@end
