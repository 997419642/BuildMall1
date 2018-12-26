//
//  DOPOrderDeatilVC.h
//  MiaoMiaoKnight
//
//  Created by app on 2017/9/12.
//  Copyright © 2017年 com.miaomiao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DOPOrderDeatilVC : UIViewController

@property(nonatomic,strong)NSMutableDictionary* dataDic;

@property(nonatomic,strong)NSMutableArray* selectArr;
@property(nonatomic,strong)NSMutableArray* position_idArr;

//编辑职位
@property (nonatomic,copy)NSString *jobId;
@property (nonatomic, assign)BOOL isFromInfo;
@property (nonatomic,copy)NSString *jobTitle;
@property (nonatomic,assign)BOOL isModify;


@end
