//
//  AddCustomModel.h
//  BuildMall
//
//  Created by 51wood on 2018/12/12.
//  Copyright © 2018 51wood. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface AddCustomModel : NSObject

@property(nonatomic,copy)NSString* packetNumber;

@property(nonatomic,copy)NSString* packetId;


@property(nonatomic,assign)BOOL isSelect;

@property(nonatomic,assign)BOOL isHasAdd;

@end

NS_ASSUME_NONNULL_END
