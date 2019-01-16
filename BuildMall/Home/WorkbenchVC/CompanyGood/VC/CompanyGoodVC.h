//
//  CompanyGoodVC.h
//  BuildMall
//
//  Created by 51wood on 2018/11/21.
//  Copyright © 2018 51wood. All rights reserved.
//

#import "BasicVC.h"

NS_ASSUME_NONNULL_BEGIN

@interface CompanyGoodVC : BasicVC

@property(nonatomic,assign)BOOL isSend;

@property(nonatomic,copy)void(^slectGoodsBlock)(NSString* str);




@end

NS_ASSUME_NONNULL_END
