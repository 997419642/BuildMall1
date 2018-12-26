//
//  SearchAddCustomVC.h
//  BuildMall
//
//  Created by 51wood on 2018/12/20.
//  Copyright © 2018 51wood. All rights reserved.
//

#import "BasicVC.h"

NS_ASSUME_NONNULL_BEGIN

@interface SearchAddCustomVC : BasicVC
@property(nonatomic,copy)void(^searchCustomBlock)(NSString* searStr);


@end

NS_ASSUME_NONNULL_END
