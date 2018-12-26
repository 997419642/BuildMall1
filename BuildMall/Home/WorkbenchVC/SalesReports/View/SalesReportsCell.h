//
//  SalesReportsCell.h
//  BuildMall
//
//  Created by 51wood on 2018/12/3.
//  Copyright © 2018 51wood. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SalesReportsCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIView *changView;
@property (weak, nonatomic) IBOutlet UILabel *timeView;
@property (weak, nonatomic) IBOutlet UILabel *priceLable;

@end

NS_ASSUME_NONNULL_END
