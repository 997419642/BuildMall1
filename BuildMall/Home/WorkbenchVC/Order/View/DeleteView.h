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

-(void)sureDelete:(NSString *)orderID noticeId:(NSString *)noticeId;

@optional

-(void)deleteAction;

@end

@interface DeleteView : UIView

@property(nonatomic,strong)UIView *backgroupView;

@property(nonatomic,strong)NSString *orderID;

@property(nonatomic,strong)NSString *noticeId;


+ (instancetype)addDeleteVView;

- (void)show;

@property(nonatomic,weak)id <DeleteViewDelegate>delegate;

@property (weak, nonatomic) IBOutlet UILabel *topLable;

@end

NS_ASSUME_NONNULL_END
