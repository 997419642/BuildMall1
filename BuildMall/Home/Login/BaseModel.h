//
//  BaseModel.h
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, AMUserGenderType)
{//性别 0：男 1：女
    AMUserGenderTypeMale    = 0,
    AMUserGenderTypeFemale  = 1,
    AMUserGenderTypeDefault = AMUserGenderTypeMale,
};

#define sUsernameDefaultValue       @"未登录"
#define sUserNicknameDefaultValue   @"NO NickName"

@interface BaseModel : NSObject

//属性字典，json解析后的字典key与本地属性名合成的属性字典
- (NSDictionary *)attributeMapDictionary;

//通过对象返回一个NSDictionary，键是属性名称，值是属性值
+ (NSDictionary *)getObjectData:(id)obj;

//通过字典设置属性
- (void)setAttributes:(NSDictionary *)dataDict;

//属性值字典
- (NSDictionary *)attributeValueDictionary;

//通过同类型的对象设置对象，需要在子类中重写
- (BOOL)setAttributesWithObject:(id)object;

//NSNumber类型属性校正
- (NSNumber *)integerNumberValueFix:(id)number;
- (NSNumber *)floatNumberValueFix:(id)number;
//NSString类型属性校正
- (NSString *)stringValueFix:(id)string;
- (NSString *)urlStringValueFix:(id)string;

//将值为@"0"的字串转为@""
- (NSString *)clearZeroValueString:(NSString *)string;

@end
