//
//  AMUserAccountInfo.m
//

#import "AMUserAccountInfo.h"

//管理本地缓存的用户基本信息
#define kUserAccountInfoDict                    @"userAccountInfoDictKey"

@implementation AMUserAccountInfo

- (NSDictionary *)attributeMapDictionary
{
    NSDictionary *mapDic =
    @{
        @"storeId"             :@"storeId",
        @"username"           :@"userName",
        @"nickname"           :@"userNikeName",
        @"userSign"           :@"userSign",
        @"headerPic"          :@"userAvatar",
        @"telephone"          :@"userPhone",
        @"token"              :@"userToken",
        @"userId"         :@"userId",
        
    };
    return mapDic;
}

- (void)setAttributes:(NSDictionary *)dataDict
{
    [super setAttributes:dataDict];
    [self attributeFix];
}

- (void)attributeFix
{
    self.storeId = [self stringValueFix:self.storeId];
    self.userId = [self stringValueFix:self.userId];
    self.userName = [self stringValueFix:self.userName];
    self.userNikeName = [self stringValueFix:self.userNikeName];
    self.userSign = [self stringValueFix:self.userSign];
    self.userAvatar = [self stringValueFix:self.userAvatar];
    self.userPhone = [self stringValueFix:self.self.userPhone];
    self.userToken = [self stringValueFix:self.userToken];
}

#pragma mark - SingleTon

- (instancetype)init
{
    if(self = [super init])
    {
        [self readUserInfo];
    }
    return self;
}

+ (instancetype)shareInfo
{
    static AMUserAccountInfo *sharedInstance = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
    sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

- (void)saveUserAccountInfo
{
    NSDictionary *userInfoDict = self.attributeValueDictionary;

    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:userInfoDict forKey:kUserAccountInfoDict];
    [userDefaults synchronize];
}

- (void)readUserInfo
{
    NSDictionary *userInfoDict = [[NSUserDefaults standardUserDefaults] objectForKey:kUserAccountInfoDict];
    [self setAttributes:userInfoDict];
    if(!self.isUserAccountInfoValid)
    {
        [self userAttributeSetDefaultValue];
        [self saveUserAccountInfo];
    }
}

- (void)userAttributeSetDefaultValue
{
    self.storeId = @"";
    self.userName = @"";
    self.userNikeName = @"";
    self.userSign = @"";
    self.userAvatar = @"";
    self.userPhone  = @"";
    self.userToken = @"";
    self.userId = @"";
}

- (BOOL)isUserAccountInfoValid
{
    return self.storeId.length >0;
}

- (void)logout
{
    [self userAttributeSetDefaultValue];
    [self saveUserAccountInfo];
}

/*
 data =     {
 headerPic = "http://116.62.108.143:80/headerPic/20180625/1529893704416.jpg";
 isBindingSocial = 0;
 isFirstLogin = 0;
 levelInfo =         {
 level = 1;
 levelIcon = "https://img.qiuyoule.com/userLevel/20180508/1525761728720.png";
 levelName = "\U5f00\U542f\U4e2a\U4eba\U4e2d\U5fc3\U6a21\U5757,\U62e5\U6709\U7b7e\U5230\U3001\U5206\U4eab\U3001\U6536\U85cf\U7b49\U57fa\U7840\U6743\U9650";
 };
 nickname = "\U5feb\U4e50\U7684\U9e4f\U7ffc";
 restScore = 100;
 telephone = 13120898320;
 token = "7UxDU1t7JSFAquvWtBDOtw==";
 totalScore = 100;
 userFans = 0;
 userId = 129;
 userSign = "\U8fd9\U4e2a\U4eba\U5f88\U61d2\Uff0c\U4ec0\U4e48\U90fd\U6ca1\U7559\U4e0b~";
 username = 13120898320;
 };
*/

@end
