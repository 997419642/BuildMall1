//
//  AddLoadingFiveCell.h
//  BuildMall
//
//  Created by 51wood on 2018/11/27.
//  Copyright © 2018 51wood. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol AddLoadingFiveCellDelegate <NSObject>

- (void)addCustomAction:(UITableViewCell *)cell;

- (void)addGoodsAction:(UITableViewCell *)cell;
- (void)subMitAction:(UITableViewCell *)cell;

@end


@interface AddLoadingFiveCell : UITableViewCell


@property (nonatomic, weak) id<AddLoadingFiveCellDelegate> delegate;

@property (weak, nonatomic) IBOutlet UIButton *addCustomBtn;
@property (weak, nonatomic) IBOutlet UIButton *addGoodsBtn;
@property (weak, nonatomic) IBOutlet UIButton *submitBtn;
@property (weak, nonatomic) IBOutlet UILabel *numLable;
@property (weak, nonatomic) IBOutlet UILabel *priceLable;
@property (weak, nonatomic) IBOutlet UILabel *volumeLable;
@property (weak, nonatomic) IBOutlet UIView *infoLable;

@property(nonatomic,strong)NSMutableDictionary* dict;

@end

NS_ASSUME_NONNULL_END
