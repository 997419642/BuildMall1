//
//  AMUserAccountInfo.h
//

#import "BaseModel.h"

@interface AMUserAccountInfo : BaseModel

@property (strong, nonatomic) NSString *storeId;

@property (strong, nonatomic) NSString *userId;//操作人ID

@property (strong, nonatomic) NSString *userName;
@property (strong, nonatomic) NSString *userNikeName;//昵称
@property (strong, nonatomic) NSString *userSign;//签名
@property (strong, nonatomic) NSString *userAvatar;
@property (strong, nonatomic) NSString *userPhone;
@property (strong, nonatomic) NSString *userToken;


+ (instancetype)shareInfo;
- (BOOL)isUserAccountInfoValid;//是否有效，即是已登录
- (void)saveUserAccountInfo;//信息更改，重新保存本地

- (void)logout;

@end
