//
//  CompanyDetailCollcCell.h
//  BuildMall
//
//  Created by 51wood on 2018/12/1.
//  Copyright © 2018 51wood. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CompanyDetailCollcCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@property (weak, nonatomic) IBOutlet UILabel *nameLable;
@property (weak, nonatomic) IBOutlet UILabel *detailLable;
@property (weak, nonatomic) IBOutlet UILabel *priceLable;

@end

NS_ASSUME_NONNULL_END
