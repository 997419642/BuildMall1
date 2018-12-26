#import "SWGCommodityWarehouseBean.h"

@implementation SWGCommodityWarehouseBean

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
  return [[JSONKeyMapper alloc] initWithModelToJSONDictionary:@{ @"cubicNum": @"cubicNum", @"delivery": @"delivery", @"goodsId": @"goodsId", @"goodsUnit": @"goodsUnit", @"length": @"length", @"lengthAttrId": @"lengthAttrId", @"number": @"number", @"piecesNum": @"piecesNum", @"piecesNumAttrId": @"piecesNumAttrId", @"price": @"price", @"warehouseId": @"warehouseId", @"warehouseName": @"warehouseName" }];
}

/**
 * Indicates whether the property with the given name is optional.
 * If `propertyName` is optional, then return `YES`, otherwise return `NO`.
 * This method is used by `JSONModel`.
 */
+ (BOOL)propertyIsOptional:(NSString *)propertyName {

  NSArray *optionalProperties = @[@"cubicNum", @"delivery", @"goodsId", @"goodsUnit", @"length", @"lengthAttrId", @"number", @"piecesNum", @"piecesNumAttrId", @"price", @"warehouseId", @"warehouseName"];
  return [optionalProperties containsObject:propertyName];
}

@end
