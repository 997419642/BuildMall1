#import "SWGProductGoodsStoreBean.h"

@implementation SWGProductGoodsStoreBean

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
  return [[JSONKeyMapper alloc] initWithModelToJSONDictionary:@{ @"addMerchandiseBean": @"addMerchandiseBean", @"attributeBeans": @"attributeBeans", @"brandId": @"brandId", @"brandName": @"brandName", @"categoryId": @"categoryId", @"commodityWarehouseBeans": @"commodityWarehouseBeans", @"describe": @"describe", @"goodsImg": @"goodsImg", @"productId": @"productId", @"storeId": @"storeId", @"title": @"title", @"type": @"type", @"video": @"video" }];
}

/**
 * Indicates whether the property with the given name is optional.
 * If `propertyName` is optional, then return `YES`, otherwise return `NO`.
 * This method is used by `JSONModel`.
 */
+ (BOOL)propertyIsOptional:(NSString *)propertyName {

  NSArray *optionalProperties = @[@"addMerchandiseBean", @"attributeBeans", @"brandId", @"brandName", @"categoryId", @"commodityWarehouseBeans", @"describe", @"goodsImg", @"productId", @"storeId", @"title", @"type", @"video"];
  return [optionalProperties containsObject:propertyName];
}

@end
