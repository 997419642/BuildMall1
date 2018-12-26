#import "SWGInvoiceTableBean.h"

@implementation SWGInvoiceTableBean

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
  return [[JSONKeyMapper alloc] initWithModelToJSONDictionary:@{ @"buyerMemo": @"buyerMemo", @"createTime": @"createTime", @"fromId": @"fromId", @"_id": @"id", @"invoiceAddress": @"invoiceAddress", @"invoiceContent": @"invoiceContent", @"invoiceMoney": @"invoiceMoney", @"invoiceNumber": @"invoiceNumber", @"invoicePrice": @"invoicePrice", @"invoiceSn": @"invoiceSn", @"invoiceTax": @"invoiceTax", @"invoiceTaxNo": @"invoiceTaxNo", @"invoiceTelephone": @"invoiceTelephone", @"invoiceTitle": @"invoiceTitle", @"invoiceType": @"invoiceType", @"mailingAddress": @"mailingAddress", @"postName": @"postName", @"postNo": @"postNo", @"postTime": @"postTime", @"reffer": @"reffer", @"sellerMemo": @"sellerMemo", @"status": @"status", @"toId": @"toId", @"updateTime": @"updateTime" }];
}

/**
 * Indicates whether the property with the given name is optional.
 * If `propertyName` is optional, then return `YES`, otherwise return `NO`.
 * This method is used by `JSONModel`.
 */
+ (BOOL)propertyIsOptional:(NSString *)propertyName {

  NSArray *optionalProperties = @[@"buyerMemo", @"createTime", @"fromId", @"_id", @"invoiceAddress", @"invoiceContent", @"invoiceMoney", @"invoiceNumber", @"invoicePrice", @"invoiceSn", @"invoiceTax", @"invoiceTaxNo", @"invoiceTelephone", @"invoiceTitle", @"invoiceType", @"mailingAddress", @"postName", @"postNo", @"postTime", @"reffer", @"sellerMemo", @"status", @"toId", @"updateTime"];
  return [optionalProperties containsObject:propertyName];
}

@end
