#import "SWGCategoryLogBean.h"

@implementation SWGCategoryLogBean

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
  return [[JSONKeyMapper alloc] initWithModelToJSONDictionary:@{ @"address": @"address", @"brand": @"brand", @"caliber": @"caliber", @"categoryId": @"categoryId", @"company": @"company", @"cubicNum": @"cubicNum", @"department": @"department", @"grade": @"grade", @"_id": @"id", @"length": @"length", @"moisture": @"moisture", @"origin": @"origin", @"price": @"price", @"remarks": @"remarks", @"rootNum": @"rootNum", @"species": @"species", @"warehouse": @"warehouse" }];
}

/**
 * Indicates whether the property with the given name is optional.
 * If `propertyName` is optional, then return `YES`, otherwise return `NO`.
 * This method is used by `JSONModel`.
 */
+ (BOOL)propertyIsOptional:(NSString *)propertyName {

  NSArray *optionalProperties = @[@"address", @"brand", @"caliber", @"categoryId", @"company", @"cubicNum", @"department", @"grade", @"_id", @"length", @"moisture", @"origin", @"price", @"remarks", @"rootNum", @"species", @"warehouse"];
  return [optionalProperties containsObject:propertyName];
}

@end
