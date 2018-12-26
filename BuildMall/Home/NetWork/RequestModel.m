//
//  RequestModel.m
//  BuildMall
//
//  Created by 51wood on 2018/11/8.
//  Copyright © 2018年 51wood. All rights reserved.
//

#import "RequestModel.h"

@implementation RequestModel

+(instancetype)shared {
    static RequestModel *_sharedObject = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedObject = [[super allocWithZone:NULL] init];
    });
    
    return _sharedObject;
}

+(instancetype)allocWithZone:(struct _NSZone *)zone{
    return [RequestModel shared];
}

-(id)copyWithZone:(struct _NSZone *)zone
{
    return [RequestModel shared];
}
@end
