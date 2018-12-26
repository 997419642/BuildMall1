#import "SWGProductTable.h"

@implementation SWGProductTable

- (instancetype)init {
  self = [super init];
  if (self) {
    // initialize property's default value, if any
    
  }
  return self;
}


/**
 * Maps json key to property name.
 * This method is used by `JSONModel`.
 */
+ (JSONKeyMapper *)keyMapper {
  return [[JSONKeyMapper alloc] initWithModelToJSONDictionary:@{ @"advantage": @"advantage", @"brandId": @"brandId", @"brandName": @"brandName", @"categoryId": @"categoryId", @"categoryName": @"categoryName", @"createTime": @"createTime", @"_description": @"description", @"goodsImg": @"goodsImg", @"goodsNumber": @"goodsNumber", @"_id": @"id", @"image": @"image", @"isStandard": @"isStandard", @"marketPrice": @"marketPrice", @"morePrice": @"morePrice", @"moreSpecification": @"moreSpecification", @"price": @"price", @"productAttributeList": @"productAttributeList", @"productCode": @"productCode", @"saleNum": @"saleNum", @"status": @"status", @"stock": @"stock", @"title": @"title", @"updateTime": @"updateTime", @"upperLowerFrames": @"upperLowerFrames", @"video": @"video" }];
}

/**
 * Indicates whether the property with the given name is optional.
 * If `propertyName` is optional, then return `YES`, otherwise return `NO`.
 * This method is used by `JSONModel`.
 */
+ (BOOL)propertyIsOptional:(NSString *)propertyName {

  NSArray *optionalProperties = @[@"advantage", @"brandId", @"brandName", @"categoryId", @"categoryName", @"createTime", @"_description", @"goodsImg", @"goodsNumber", @"_id", @"image", @"isStandard", @"marketPrice", @"morePrice", @"moreSpecification", @"price", @"productAttributeList", @"productCode", @"saleNum", @"status", @"stock", @"title", @"updateTime", @"upperLowerFrames", @"video"];
  return [optionalProperties containsObject:propertyName];
}

@end
