//
//  BasicNavigationController.h
//  BuildMall
//
//  Created by 51wood on 2018/11/8.
//  Copyright © 2018年 51wood. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BasicNavigationController : UINavigationController

@property(nonatomic,copy)BOOL(^willBackBlock)();//!<将要返回时调用

@end
