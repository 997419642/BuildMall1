//
//  SearchAddGoodVC.h
//  BuildMall
//
//  Created by 51wood on 2018/12/19.
//  Copyright © 2018 51wood. All rights reserved.
//

#import "BasicVC.h"

NS_ASSUME_NONNULL_BEGIN

@interface SearchAddGoodVC : BasicVC

@property (nonatomic, weak) UISearchBar *searchBar;

@property(nonatomic,copy)void(^slectSearchBlock)(NSString* searStr);

@end

NS_ASSUME_NONNULL_END
