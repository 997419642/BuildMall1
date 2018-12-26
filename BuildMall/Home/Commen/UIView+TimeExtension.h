//
//  UIView+TimeExtension.h
//  HelpWanted
//
//  Created by huangqian on 2018/2/9.
//  Copyright © 2018年 xiaomei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (TimeExtension)

@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGSize size;
@property (nonatomic, assign) CGPoint origin;
@property (nonatomic, assign) CGFloat   bottom;
@property (nonatomic, assign) CGFloat   right;
@property (nonatomic, strong, readonly) UIView *lastSubviewOnX;
@property (nonatomic, strong, readonly) UIView *lastSubviewOnY;

/**
 * @brief 移除此view上的所有子视图
 */
- (void)removeAllSubviews;

@end

