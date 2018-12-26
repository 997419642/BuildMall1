#import "SWGGoodsWarehouseBean.h"

@implementation SWGGoodsWarehouseBean

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
  return [[JSONKeyMapper alloc] initWithModelToJSONDictionary:@{ @"goodsId": @"goodsId", @"_id": @"id", @"lockNum": @"lockNum", @"packages": @"packages", @"salePrice": @"salePrice", @"stockNum": @"stockNum", @"storeId": @"storeId", @"warehouseId": @"warehouseId" }];
}

/**
 * Indicates whether the property with the given name is optional.
 * If `propertyName` is optional, then return `YES`, otherwise return `NO`.
 * This method is used by `JSONModel`.
 */
+ (BOOL)propertyIsOptional:(NSString *)propertyName {

  NSArray *optionalProperties = @[@"goodsId", @"_id", @"lockNum", @"packages", @"salePrice", @"stockNum", @"storeId", @"warehouseId"];
  return [optionalProperties containsObject:propertyName];
}

@end
