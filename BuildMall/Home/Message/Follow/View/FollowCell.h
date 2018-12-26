//
//  FollowCell.h
//  BuildMall
//
//  Created by 曾祥明 on 2018/11/10.
//  Copyright © 2018 51wood. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface FollowCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *contentLable;
@property (weak, nonatomic) IBOutlet UILabel *timeLable;
@property (weak, nonatomic) IBOutlet UIImageView *leftImg;
@property (weak, nonatomic) IBOutlet UIImageView *rightImg;

@end

NS_ASSUME_NONNULL_END
