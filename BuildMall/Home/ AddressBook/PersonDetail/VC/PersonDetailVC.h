//
//  PersonDetailVC.h
//  BuildMall
//
//  Created by 51wood on 2018/11/16.
//  Copyright © 2018年 51wood. All rights reserved.
//

#import "BasicVC.h"

@class ContactDataMember;

@interface PersonDetailVC : BasicVC

- (instancetype)initWithUserId:(NSString *)userId;

@property (nonatomic, strong) UITableView *tableView;


@end
