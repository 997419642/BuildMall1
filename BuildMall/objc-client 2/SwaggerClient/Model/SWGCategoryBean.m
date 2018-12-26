#import "SWGCategoryBean.h"

@implementation SWGCategoryBean

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
  return [[JSONKeyMapper alloc] initWithModelToJSONDictionary:@{ @"address": @"address", @"brand": @"brand", @"categoryId": @"categoryId", @"company": @"company", @"cubicNum": @"cubicNum", @"department": @"department", @"grade": @"grade", @"_id": @"id", @"length": @"length", @"moisture": @"moisture", @"number": @"number", @"origin": @"origin", @"packetNum": @"packetNum", @"price": @"price", @"remarks": @"remarks", @"species": @"species", @"thickness": @"thickness", @"warehouse": @"warehouse", @"width": @"width" }];
}

/**
 * Indicates whether the property with the given name is optional.
 * If `propertyName` is optional, then return `YES`, otherwise return `NO`.
 * This method is used by `JSONModel`.
 */
+ (BOOL)propertyIsOptional:(NSString *)propertyName {

  NSArray *optionalProperties = @[@"address", @"brand", @"categoryId", @"company", @"cubicNum", @"department", @"grade", @"_id", @"length", @"moisture", @"number", @"origin", @"packetNum", @"price", @"remarks", @"species", @"thickness", @"warehouse", @"width"];
  return [optionalProperties containsObject:propertyName];
}

@end
