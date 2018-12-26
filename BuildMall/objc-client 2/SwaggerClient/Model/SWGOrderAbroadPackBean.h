#import <Foundation/Foundation.h>
#import "SWGObject.h"

/**
* Youmu Cloud Framework Swagger API 
* https://www.51wood.com
*
* OpenAPI spec version: 1.0
* Contact: archerchu@163.com
*
* NOTE: This class is auto generated by the swagger code generator program.
* https://github.com/swagger-api/swagger-codegen.git
* Do not edit the class manually.
*/





@protocol SWGOrderAbroadPackBean
@end

@interface SWGOrderAbroadPackBean : SWGObject


@property(nonatomic) NSNumber* buyNumber;

@property(nonatomic) NSString* buyPrice;

@property(nonatomic) NSNumber* categoryId;

@property(nonatomic) NSNumber* cubicNumber;

@property(nonatomic) NSNumber* goodsId;

@property(nonatomic) NSNumber* lockNum;

@property(nonatomic) NSNumber* orderId;

@property(nonatomic) NSString* packages;

@property(nonatomic) NSNumber* orderPackId;

@property(nonatomic) NSNumber* stockNum;

@end
