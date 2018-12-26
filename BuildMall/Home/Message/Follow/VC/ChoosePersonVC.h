//
//  ChoosePersonVC.h
//  BuildMall
//
//  Created by 51wood on 2018/11/21.
//  Copyright © 2018 51wood. All rights reserved.
//

#import "BasicVC.h"

NS_ASSUME_NONNULL_BEGIN

@interface ChoosePersonVC : BasicVC

@property(nonatomic,copy)void(^slectComBlock)(NSMutableArray* arr);
@property(nonatomic,strong)NSMutableArray *imageArray;


@end

NS_ASSUME_NONNULL_END
