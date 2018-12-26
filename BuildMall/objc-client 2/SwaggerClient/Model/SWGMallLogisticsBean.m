#import "SWGMallLogisticsBean.h"

@implementation SWGMallLogisticsBean

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
  return [[JSONKeyMapper alloc] initWithModelToJSONDictionary:@{ @"createTime": @"createTime", @"frequency": @"frequency", @"_id": @"id", @"length": @"length", @"loading": @"loading", @"loadingAddress": @"loadingAddress", @"logisticsPriceList": @"logisticsPriceList", @"memo": @"memo", @"phone": @"phone", @"status": @"status", @"time": @"time", @"type": @"type", @"unload": @"unload", @"unloadAddress": @"unloadAddress", @"updateTime": @"updateTime", @"userId": @"userId", @"userName": @"userName", @"weight": @"weight" }];
}

/**
 * Indicates whether the property with the given name is optional.
 * If `propertyName` is optional, then return `YES`, otherwise return `NO`.
 * This method is used by `JSONModel`.
 */
+ (BOOL)propertyIsOptional:(NSString *)propertyName {

  NSArray *optionalProperties = @[@"createTime", @"frequency", @"_id", @"length", @"loading", @"loadingAddress", @"logisticsPriceList", @"memo", @"phone", @"status", @"time", @"type", @"unload", @"unloadAddress", @"updateTime", @"userId", @"userName", @"weight"];
  return [optionalProperties containsObject:propertyName];
}

@end
