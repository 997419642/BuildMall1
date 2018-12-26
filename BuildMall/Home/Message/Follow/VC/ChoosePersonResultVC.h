//
//  AdressResultVC.h
//  BuildMall
//
//  Created by 51wood on 2018/11/16.
//  Copyright © 2018年 51wood. All rights reserved.
//

#import "BasicVC.h"

@interface ChoosePersonResultVC : BasicVC

@property(nonatomic,strong)UITableView* tableView;

@property (nonatomic, strong) NSArray *tagsArray;


@property (nonatomic, weak) UISearchBar *searchBar;


@end
