//
//  AddGoodCell.h
//  BuildMall
//
//  Created by 51wood on 2018/11/26.
//  Copyright © 2018 51wood. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OrderManageModel.h"
#import "OrderDetailModel.h"

@protocol AddGoodCellDelegate <NSObject>

- (void)addgoods:(NSString *)categoryId;
- (void)addCustomgoods:(NSString *)categoryId;


@end

NS_ASSUME_NONNULL_BEGIN

@interface AddGoodCell : UITableViewCell

@property(nonatomic,weak)id <AddGoodCellDelegate>delegate;


@property (weak, nonatomic) IBOutlet UIButton *right;
@property (weak, nonatomic) IBOutlet UIButton *left;

@property(nonatomic,copy)NSString *categoryId;

@property(nonatomic,strong)OrderManageModel* model;

@property (weak, nonatomic) IBOutlet UILabel *numLable;
@property (weak, nonatomic) IBOutlet UILabel *allPriceLable;
@property (weak, nonatomic) IBOutlet UIButton *addBtn;
@property (weak, nonatomic) IBOutlet UIButton *customBtn;
@property (weak, nonatomic) IBOutlet UIView *meddleView;

@end

NS_ASSUME_NONNULL_END
