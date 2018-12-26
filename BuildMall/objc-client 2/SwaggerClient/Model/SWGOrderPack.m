#import "SWGOrderPack.h"

@implementation SWGOrderPack

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
  return [[JSONKeyMapper alloc] initWithModelToJSONDictionary:@{ @"buyNumber": @"buyNumber", @"buyPrice": @"buyPrice", @"categoryId": @"categoryId", @"cubicNumber": @"cubicNumber", @"goodsId": @"goodsId", @"lockNum": @"lockNum", @"number": @"number", @"orderId": @"orderId", @"packages": @"packages", @"stockNum": @"stockNum" }];
}

/**
 * Indicates whether the property with the given name is optional.
 * If `propertyName` is optional, then return `YES`, otherwise return `NO`.
 * This method is used by `JSONModel`.
 */
+ (BOOL)propertyIsOptional:(NSString *)propertyName {

  NSArray *optionalProperties = @[@"buyNumber", @"buyPrice", @"categoryId", @"cubicNumber", @"goodsId", @"lockNum", @"number", @"orderId", @"packages", @"stockNum"];
  return [optionalProperties containsObject:propertyName];
}

@end
