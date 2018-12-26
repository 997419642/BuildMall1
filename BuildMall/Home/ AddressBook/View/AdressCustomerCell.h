//
//  CustomerCell.h
//  BuildMall
//
//  Created by 51wood on 2018/11/15.
//  Copyright © 2018年 51wood. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AdressCustomerCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *headImg;
@property (weak, nonatomic) IBOutlet UILabel *nameLable;
@property (weak, nonatomic) IBOutlet UILabel *stateLable;
@property (weak, nonatomic) IBOutlet UILabel *lastActivity;
@property (weak, nonatomic) IBOutlet UILabel *timeLable;

@end
