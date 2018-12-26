//
//  OrderLogModel.h
//  BuildMall
//
//  Created by 51wood on 2018/12/5.
//  Copyright © 2018 51wood. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface OrderLogModel : NSObject

@property(nonatomic,copy)NSString* logType;

@property(nonatomic,copy)NSString* createTime;


@property(nonatomic,copy)NSString* name;

@property(nonatomic,copy)NSString* isOne;




@end

NS_ASSUME_NONNULL_END
