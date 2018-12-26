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


#import "SWGProductAttribute.h"
@protocol SWGProductAttribute;
@class SWGProductAttribute;



@protocol SWGProductTable
@end

@interface SWGProductTable : SWGObject


@property(nonatomic) NSString* advantage;

@property(nonatomic) NSNumber* brandId;

@property(nonatomic) NSString* brandName;

@property(nonatomic) NSNumber* categoryId;

@property(nonatomic) NSString* categoryName;

@property(nonatomic) NSDate* createTime;

@property(nonatomic) NSString* _description;

@property(nonatomic) NSString* goodsImg;

@property(nonatomic) NSNumber* goodsNumber;

@property(nonatomic) NSNumber* _id;

@property(nonatomic) NSString* image;

@property(nonatomic) NSNumber* isStandard;

@property(nonatomic) NSNumber* marketPrice;

@property(nonatomic) NSNumber* morePrice;

@property(nonatomic) NSNumber* moreSpecification;

@property(nonatomic) NSArray<NSNumber*>* price;

@property(nonatomic) NSArray<SWGProductAttribute>* productAttributeList;

@property(nonatomic) NSString* productCode;

@property(nonatomic) NSNumber* saleNum;

@property(nonatomic) NSNumber* status;

@property(nonatomic) NSString* stock;

@property(nonatomic) NSString* title;

@property(nonatomic) NSDate* updateTime;

@property(nonatomic) NSNumber* upperLowerFrames;

@property(nonatomic) NSString* video;

@end