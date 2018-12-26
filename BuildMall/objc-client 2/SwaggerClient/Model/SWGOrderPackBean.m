#import "SWGOrderPackBean.h"

@implementation SWGOrderPackBean

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
    return [[JSONKeyMapper alloc] initWithModelToJSONDictionary:@{ @"number": @"number", @"buyPrice": @"buyPrice", @"categoryId": @"categoryId", @"createTime": @"createTime", @"goodsId": @"goodsId", @"goodsName": @"goodsName", @"_id": @"id", @"lengthList": @"lengthList", @"numberList": @"numberList", @"orderId": @"orderId", @"packages": @"packages", @"productId": @"productId", @"productTableList": @"productTableList", @"status": @"status", @"updateTime": @"updateTime", @"warehouseId": @"warehouseId", @"warestoreTableList": @"warestoreTableList" ,@"cubicNumber":@"cubicNumber",@"stockNum":@"stockNum",@"lockNum":@"lockNum",@"buyNumber":@"buyNumber"}];
}

/**
 * Indicates whether the property with the given name is optional.
 * If `propertyName` is optional, then return `YES`, otherwise return `NO`.
 * This method is used by `JSONModel`.
 */
+ (BOOL)propertyIsOptional:(NSString *)propertyName {

  NSArray *optionalProperties = @[@"number", @"buyPrice", @"categoryId", @"createTime", @"goodsId", @"goodsName", @"_id", @"lengthList", @"numberList", @"orderId", @"packages", @"productId", @"productTableList", @"status", @"updateTime", @"warehouseId", @"warestoreTableList",@"stockNum",@"lockNum",@"buyNumber"];
  return [optionalProperties containsObject:propertyName];
}

@end
