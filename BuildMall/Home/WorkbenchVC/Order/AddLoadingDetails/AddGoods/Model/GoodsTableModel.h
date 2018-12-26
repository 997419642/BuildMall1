//
//  GoodsTableModel.h
//  BuildMall
//
//  Created by 51wood on 2018/12/10.
//  Copyright © 2018 51wood. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface GoodsTableModel : NSObject
@property(nonatomic,copy)NSString* categoryName;
@property(nonatomic,copy)NSString* brandName;

//@property(nonatomic,assign)NSInteger* categoryId;

@property(nonatomic,assign)NSInteger orderId;

@property(nonatomic,assign)NSInteger brandId;

@property(nonatomic,strong)NSMutableArray* productAttributeList;

@property(nonatomic,strong)NSString* title;


@end

NS_ASSUME_NONNULL_END
