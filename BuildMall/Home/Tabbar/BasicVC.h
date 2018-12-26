//
//  BasicVC.h
//  BuildMall
//
//  Created by 51wood on 2018/11/7.
//  Copyright © 2018年 51wood. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <MBProgressHUD.h>
#import <NSDate+DateTools.h>
#import <Masonry.h>
#import <MJRefresh.h>
#import <SDAutoLayout.h>

@interface BasicVC : UIViewController


/**显示提示消息**/
-(void) showMessage:(NSString*)message;

-(void) showAlert:(NSString*)message;

- (void)setNoDataAttentionView:(NSString *)attention;
- (void)removeNoDataAttentionView;


@end
