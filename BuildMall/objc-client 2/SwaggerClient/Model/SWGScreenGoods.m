#import "SWGScreenGoods.h"

@implementation SWGScreenGoods

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
  return [[JSONKeyMapper alloc] initWithModelToJSONDictionary:@{ @"attributeList": @"attributeList", @"brandId": @"brandId", @"categoryId": @"categoryId", @"cubicNumId": @"cubicNumId", @"length": @"length", @"pageNum": @"pageNum", @"pageSize": @"pageSize", @"piecesNum": @"piecesNum", @"productName": @"productName", @"storeId": @"storeId", @"warehouseId": @"warehouseId" }];
}

/**
 * Indicates whether the property with the given name is optional.
 * If `propertyName` is optional, then return `YES`, otherwise return `NO`.
 * This method is used by `JSONModel`.
 */
+ (BOOL)propertyIsOptional:(NSString *)propertyName {

  NSArray *optionalProperties = @[@"attributeList", @"brandId", @"categoryId", @"cubicNumId", @"length", @"pageNum", @"pageSize", @"piecesNum", @"productName", @"storeId", @"warehouseId"];
  return [optionalProperties containsObject:propertyName];
}

@end
