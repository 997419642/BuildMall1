#import "SWGBrandTable.h"

@implementation SWGBrandTable

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
  return [[JSONKeyMapper alloc] initWithModelToJSONDictionary:@{ @"categoryId": @"categoryId", @"createTime": @"createTime", @"_description": @"description", @"enName": @"enName", @"_id": @"id", @"keywords": @"keywords", @"logo": @"logo", @"name": @"name", @"status": @"status", @"updateTime": @"updateTime", @"webUrlOld": @"webUrlOld" }];
}

/**
 * Indicates whether the property with the given name is optional.
 * If `propertyName` is optional, then return `YES`, otherwise return `NO`.
 * This method is used by `JSONModel`.
 */
+ (BOOL)propertyIsOptional:(NSString *)propertyName {

  NSArray *optionalProperties = @[@"categoryId", @"createTime", @"_description", @"enName", @"_id", @"keywords", @"logo", @"name", @"status", @"updateTime", @"webUrlOld"];
  return [optionalProperties containsObject:propertyName];
}

@end
