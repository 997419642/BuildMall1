//
//  TestResultTableViewController.m
//  SUNSearchController
//
//  Created by Michael on 16/6/14.
//  Copyright © 2016年 com.51fanxing.searchController. All rights reserved.
//

#import "AddPersonResultVC.h"
#import "Product.h"
#import "DataModel.h"
#import "ChoosePersonCell.h"

@implementation AddPersonResultVC

- (void)viewDidLoad
{
    [super viewDidLoad];
   
    _selectArray = [NSMutableArray array];
    
  
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.searchResults.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.01;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.01;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ChoosePersonCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ChoosePersonCell" forIndexPath:indexPath];
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
  
    DataModel *product = [self.searchResults objectAtIndex:indexPath.row];
    
    cell.nameLable.text = product.aName;
    
    if (product.isselect == YES) {
        
        cell.selcImg.image = [UIImage imageNamed:@"iconcheckSele"];
        
        
    }else
    {
        cell.selcImg.image = [UIImage imageNamed:@"iconcheck"];
        
    }
    return cell;
    
}




- (void)setSearchResults:(NSMutableArray *)searchResults
{
    _searchResults = searchResults;
    [self.tableView reloadData];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    DataModel * molde0 = _searchResults[indexPath.row];
    
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
