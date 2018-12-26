//
//  CloseOrdermodel.h
//  BuildMall
//
//  Created by 51wood on 2018/12/21.
//  Copyright © 2018 51wood. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CloseOrdermodel : NSObject
@property(nonatomic,copy)NSString* type;
@property(nonatomic,assign)BOOL isSelect;
@property(nonatomic,assign)int stateId;



@end

NS_ASSUME_NONNULL_END
