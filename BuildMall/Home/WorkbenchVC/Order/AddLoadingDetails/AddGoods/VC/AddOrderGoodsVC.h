//
//  AddOrderGoodsVC.h
//  BuildMall
//
//  Created by 51wood on 2018/11/26.
//  Copyright © 2018 51wood. All rights reserved.
//

#import "BasicVC.h"

NS_ASSUME_NONNULL_BEGIN

@interface AddOrderGoodsVC : BasicVC

@property(nonatomic,copy)NSString *categoryId;
@property(nonatomic,copy)NSString* orderId;
@property(nonatomic,assign)BOOL isZhuanghuo;

@end

NS_ASSUME_NONNULL_END
