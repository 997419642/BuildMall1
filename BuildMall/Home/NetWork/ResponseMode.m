//
//  ResponseMode.m
//  BuildMall
//
//  Created by 51wood on 2018/11/8.
//  Copyright © 2018年 51wood. All rights reserved.
//

#import "ResponseMode.h"


@implementation ResponseMode

+ (NSDictionary *)replacedKeyFromPropertyName
{
    return @{@"data" : @"data",@"code":@"code",@"error":@"error",@"pageInfo":@"pageInfo",@"msg":@"msg"};
}

@end
