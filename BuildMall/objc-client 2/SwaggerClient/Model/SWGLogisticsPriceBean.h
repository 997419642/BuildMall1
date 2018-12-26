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





@protocol SWGLogisticsPriceBean
@end

@interface SWGLogisticsPriceBean : SWGObject


@property(nonatomic) NSDate* createTime;
/* 定金 [optional]
 */
@property(nonatomic) NSNumber* eranest;

@property(nonatomic) NSNumber* _id;
/* 物流单id [optional]
 */
@property(nonatomic) NSNumber* logisticsId;
/* 运费 [optional]
 */
@property(nonatomic) NSNumber* price;
/* 付款方式 [optional]
 */
@property(nonatomic) NSNumber* priceType;

@property(nonatomic) NSNumber* status;
/* 是否含税 [optional]
 */
@property(nonatomic) NSNumber* taxed;

@property(nonatomic) NSDate* updateTime;

@end
