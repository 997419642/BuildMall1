//
//  CustomerTwoCell.h
//  BuildMall
//
//  Created by 51wood on 2018/11/8.
//  Copyright © 2018年 51wood. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomerTwoCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *behaviorLable;
@property (weak, nonatomic) IBOutlet UILabel *numLabel;
@property (weak, nonatomic) IBOutlet UIView *imgView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *imgWidth;

@end
