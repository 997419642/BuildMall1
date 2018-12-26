//
//  ResponseMode.h
//  BuildMall
//
//  Created by 51wood on 2018/11/8.
//  Copyright © 2018年 51wood. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MJExtension.h>

@interface ResponseMode : NSObject

@property (nonatomic,assign)NSInteger code;//!<返回状态代码
@property (nonatomic,copy)NSString *msg;//!<返回信息（可以是描述或实际json数据结构）

@property(nonatomic,copy)id data;

@property (nonatomic,copy)id error;


@property(nonatomic,copy)id pageInfo;




+ (instancetype)shared;

@end
