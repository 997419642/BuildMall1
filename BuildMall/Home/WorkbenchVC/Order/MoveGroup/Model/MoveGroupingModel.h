//
//  MoveGroupingModel.h
//  BuildMall
//
//  Created by 51wood on 2018/12/7.
//  Copyright © 2018 51wood. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MoveGroupingModel : NSObject

@property(nonatomic,copy)NSString* configure;
@property(nonatomic,copy)NSString* accountId;

@property(nonatomic,copy)NSString* code;

@property(nonatomic,copy)NSString* status;

@property(nonatomic,copy)NSString* type;

@property(nonatomic,copy)NSString* name;

@property(nonatomic,assign)BOOL isSelct;

@end

NS_ASSUME_NONNULL_END
