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





@protocol SWGStoreGoodsAttributeBean
@end

@interface SWGStoreGoodsAttributeBean : SWGObject

/* 创建时间 [optional]
 */
@property(nonatomic) NSDate* createTime;
/* 商品ID [optional]
 */
@property(nonatomic) NSNumber* goodsId;
/* ID [optional]
 */
@property(nonatomic) NSNumber* _id;
/* 单价 [optional]
 */
@property(nonatomic) NSNumber* price;
/* productId [optional]
 */
@property(nonatomic) NSNumber* productId;
/* 规格ID [optional]
 */
@property(nonatomic) NSNumber* specId;
/* 规格值 [optional]
 */
@property(nonatomic) NSString* specValue;
/* 状态(1,正常;0,删除;) [optional]
 */
@property(nonatomic) NSNumber* status;
/* storeId [optional]
 */
@property(nonatomic) NSNumber* storeId;

@end
