#import "SWGMallCategoryTable.h"

@implementation SWGMallCategoryTable

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
  return [[JSONKeyMapper alloc] initWithModelToJSONDictionary:@{ @"categoryName": @"categoryName", @"createTime": @"createTime", @"display": @"display", @"expression": @"expression", @"icon": @"icon", @"_id": @"id", @"level": @"level", @"mallCategoryAttribute": @"mallCategoryAttribute", @"parentId": @"parentId", @"recommend": @"recommend", @"seoDescription": @"seoDescription", @"seoKeywords": @"seoKeywords", @"sort": @"sort", @"status": @"status", @"updateTime": @"updateTime" }];
}

/**
 * Indicates whether the property with the given name is optional.
 * If `propertyName` is optional, then return `YES`, otherwise return `NO`.
 * This method is used by `JSONModel`.
 */
+ (BOOL)propertyIsOptional:(NSString *)propertyName {

  NSArray *optionalProperties = @[@"categoryName", @"createTime", @"display", @"expression", @"icon", @"_id", @"level", @"mallCategoryAttribute", @"parentId", @"recommend", @"seoDescription", @"seoKeywords", @"sort", @"status", @"updateTime"];
  return [optionalProperties containsObject:propertyName];
}

@end
