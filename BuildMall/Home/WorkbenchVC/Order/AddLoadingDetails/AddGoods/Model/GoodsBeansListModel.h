//
//  ProductTableListModel.h
//  BuildMall
//
//  Created by 51wood on 2018/12/10.
//  Copyright © 2018 51wood. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GoodsTableModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface GoodsBeansListModel : NSObject

@property(nonatomic) NSArray<GoodsTableModel *>* productTableList;

@property(nonatomic,copy)NSString* goodsNuit;
@property(nonatomic,assign)NSInteger unitNum;

@property(nonatomic,copy)NSString* unitPrice;

@property(nonatomic,assign)NSInteger stockNum;

@property(nonatomic,assign)NSInteger lockNum;

@property(nonatomic,assign)NSInteger orderId;

@property(nonatomic) NSArray *detailsBeanList;

@property(nonatomic,assign)NSInteger categoryId;





@end

NS_ASSUME_NONNULL_END
