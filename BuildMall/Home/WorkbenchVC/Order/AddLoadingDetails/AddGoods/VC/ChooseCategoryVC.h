//
//  ChooseCategoryVC.h
//  BuildMall
//
//  Created by 51wood on 2018/12/10.
//  Copyright © 2018 51wood. All rights reserved.
//

#import "BasicVC.h"

NS_ASSUME_NONNULL_BEGIN

@interface ChooseCategoryVC : BasicVC

@property(nonatomic,copy)NSString* titleStr;

@property(nonatomic,copy)NSString *categoryId;

@property(nonatomic,copy)void(^slectChooseBlock)(NSMutableDictionary* dict);


@end

NS_ASSUME_NONNULL_END
