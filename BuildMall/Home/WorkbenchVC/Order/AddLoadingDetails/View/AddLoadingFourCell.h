//
//  AddLoadingFourCell.h
//  BuildMall
//
//  Created by 51wood on 2018/11/27.
//  Copyright © 2018 51wood. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol AddLoadingFourCellDelegate <NSObject>

- (void)deleteAction:(NSString *)ID;



@end

@interface AddLoadingFourCell : UITableViewCell

@property (nonatomic, weak) id<AddLoadingFourCellDelegate> delegate;

@property (weak, nonatomic) IBOutlet UILabel *priceLable;

@property (weak, nonatomic) IBOutlet UILabel *nameLable;
@property (weak, nonatomic) IBOutlet UILabel *detailLable;
@property (weak, nonatomic) IBOutlet UILabel *numLable;
@property (weak, nonatomic) IBOutlet UILabel *volumeLable;
@property (weak, nonatomic) IBOutlet UITextField *priceTF;
@property (weak, nonatomic) IBOutlet UIButton *priceBtn;
@property (weak, nonatomic) IBOutlet UIButton *deleteBtn;


@property(nonatomic,strong)NSMutableDictionary* dict;

@end

NS_ASSUME_NONNULL_END
