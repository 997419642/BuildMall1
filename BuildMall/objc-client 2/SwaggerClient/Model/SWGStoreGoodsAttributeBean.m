#import "SWGStoreGoodsAttributeBean.h"

@implementation SWGStoreGoodsAttributeBean

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
  return [[JSONKeyMapper alloc] initWithModelToJSONDictionary:@{ @"createTime": @"createTime", @"goodsId": @"goodsId", @"_id": @"id", @"price": @"price", @"productId": @"productId", @"specId": @"specId", @"specValue": @"specValue", @"status": @"status", @"storeId": @"storeId" }];
}

/**
 * Indicates whether the property with the given name is optional.
 * If `propertyName` is optional, then return `YES`, otherwise return `NO`.
 * This method is used by `JSONModel`.
 */
+ (BOOL)propertyIsOptional:(NSString *)propertyName {

  NSArray *optionalProperties = @[@"createTime", @"goodsId", @"_id", @"price", @"productId", @"specId", @"specValue", @"status", @"storeId"];
  return [optionalProperties containsObject:propertyName];
}

@end
