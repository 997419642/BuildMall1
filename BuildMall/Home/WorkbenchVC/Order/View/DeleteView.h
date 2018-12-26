//
//  DeleteView.h
//  BuildMall
//
//  Created by 51wood on 2018/11/26.
//  Copyright © 2018 51wood. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol DeleteViewDelegate <NSObject>

-(void)sureDelete:(NSString *)orderID;

@optional

-(void)deleteAction;

@end

@interface DeleteView : UIView

@property(nonatomic,strong)UIView *backgroupView;

@property(nonatomic,strong)NSString *orderID;

+ (instancetype)addDeleteVView;

- (void)show;

@property(nonatomic,weak)id <DeleteViewDelegate>delegate;


@end

NS_ASSUME_NONNULL_END
