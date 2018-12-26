//
//  CloseOrderCell.h
//  BuildMall
//
//  Created by 51wood on 2018/12/21.
//  Copyright © 2018 51wood. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CloseOrdermodel.h"


NS_ASSUME_NONNULL_BEGIN

@interface CloseOrderCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *nameLable;
@property (weak, nonatomic) IBOutlet UIImageView *stateImg;

@property(nonatomic,strong)CloseOrdermodel* dict;

@end

NS_ASSUME_NONNULL_END
