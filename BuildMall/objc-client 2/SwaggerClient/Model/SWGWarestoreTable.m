#import "SWGWarestoreTable.h"

@implementation SWGWarestoreTable

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
  return [[JSONKeyMapper alloc] initWithModelToJSONDictionary:@{ @"address": @"address", @"areaId": @"areaId", @"areaName": @"areaName", @"createTime": @"createTime", @"creatorId": @"creatorId", @"deptId": @"deptId", @"_id": @"id", @"location": @"location", @"memo": @"memo", @"name": @"name", @"phone": @"phone", @"savePrice": @"savePrice", @"status": @"status", @"tenantId": @"tenantId", @"updateTime": @"updateTime" }];
}

/**
 * Indicates whether the property with the given name is optional.
 * If `propertyName` is optional, then return `YES`, otherwise return `NO`.
 * This method is used by `JSONModel`.
 */
+ (BOOL)propertyIsOptional:(NSString *)propertyName {

  NSArray *optionalProperties = @[@"address", @"areaId", @"areaName", @"createTime", @"creatorId", @"deptId", @"_id", @"location", @"memo", @"name", @"phone", @"savePrice", @"status", @"tenantId", @"updateTime"];
  return [optionalProperties containsObject:propertyName];
}

@end
