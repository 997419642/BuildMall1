//
//  ProductParametersView.h
//  BuildMall
//
//  Created by 51wood on 2018/12/1.
//  Copyright © 2018 51wood. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol ProductParametersViewDelegate <NSObject>


-(void)sureAction;

@end

@interface ProductParametersView : UIView

@property(nonatomic,strong)UIView *backgroupView;
+ (instancetype)addParameterView;

- (void)show;

@property(nonatomic,weak)id <ProductParametersViewDelegate>delegate;


@end

NS_ASSUME_NONNULL_END
