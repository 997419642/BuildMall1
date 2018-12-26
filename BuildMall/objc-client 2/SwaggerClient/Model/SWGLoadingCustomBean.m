#import "SWGLoadingCustomBean.h"

@implementation SWGLoadingCustomBean

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
    return [[JSONKeyMapper alloc] initWithModelToJSONDictionary:@{ @"brandName": @"brandName", @"cubicNum": @"cubicNum", @"department": @"department", @"grade": @"grade", @"length": @"length", @"orderId": @"orderId", @"packetNum": @"packetNum", @"piecesNum": @"piecesNum", @"price": @"price", @"species": @"species", @"thickness": @"thickness", @"warehouse": @"warehouse", @"width": @"width" ,@"packages":@"packages",@"categoryId":@"categoryId"}];
}

/**
 * Indicates whether the property with the given name is optional.
 * If `propertyName` is optional, then return `YES`, otherwise return `NO`.
 * This method is used by `JSONModel`.
 */
+ (BOOL)propertyIsOptional:(NSString *)propertyName {

  NSArray *optionalProperties = @[@"brandName", @"cubicNum", @"department", @"grade", @"length", @"orderId", @"packetNum", @"piecesNum", @"price", @"species", @"thickness", @"warehouse", @"width",@"packages",@"categoryId"];
  return [optionalProperties containsObject:propertyName];
}

@end
