//
//  BaseModel.m
//

#import "BaseModel.h"
#import <objc/runtime.h>

@implementation BaseModel

- (NSDictionary *)attributeMapDictionary
{
    //JsonObjectKey :PropertyKey
    return nil;
}

- (void)setAttributes:(NSDictionary *)dataDict
{
    NSDictionary *attrMapDict = self.attributeMapDictionary;
    for(NSString *mapDictKey in attrMapDict)
    {
        SEL sel = [self getSetterSelWithAttibuteName:attrMapDict[mapDictKey]];
        if([self respondsToSelector:sel])
        {
            NSString *dataDictKey = mapDictKey;
            id attributeValue = dataDict[dataDictKey];
            if(!attributeValue) continue;
            
            if([attributeValue isKindOfClass:NSString.class])
            {
                attributeValue = [attributeValue stringByRemovingPercentEncoding];
            }
            [self performSelectorOnMainThread:sel
                                   withObject:attributeValue
                                waitUntilDone:[NSThread isMainThread]];
        }
    }
}

- (NSDictionary *)attributeValueDictionary
{
    NSDictionary *mapDict = self.attributeMapDictionary;
    NSMutableDictionary *valueDict = [NSMutableDictionary dictionaryWithCapacity:mapDict.count];
    
    for(NSString *mapDictKey in mapDict)
    {
        NSString *propertyName = mapDict[mapDictKey];
        id value = [self valueForKey:propertyName];
        if(value
           && ([value isKindOfClass:NSString.class]
               || [value isKindOfClass:NSNumber.class]
               || [value isKindOfClass:NSValue.class]))
        {
            [valueDict setValue:value forKey:mapDictKey];
        }
    }
    if(valueDict.count == 0)
    {
        valueDict = nil;
    }
    return valueDict;
}

+ (NSDictionary *)getObjectData:(id)obj
{
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    unsigned int propsCount;
    objc_property_t *props = class_copyPropertyList([obj class], &propsCount);
    for(int i = 0; i < propsCount; i++)
    {
        objc_property_t prop = props[i];
        
        NSString *propName = [NSString stringWithUTF8String:property_getName(prop)];
        id value = [obj valueForKey:propName];
        if(value == nil)
        {
            value = [NSNull null];
        }
        else
        {
            value = [self getObjectInternal:value];
        }
        [dic setObject:value forKey:propName];
    }
    return dic;
}

+ (id)getObjectInternal:(id)obj
{
    if([obj isKindOfClass:[NSString class]]
       || [obj isKindOfClass:[NSNumber class]]
       || [obj isKindOfClass:[NSNull class]])
    {
        return obj;
    }
    
    if([obj isKindOfClass:[NSArray class]])
    {
        NSArray *objarr = obj;
        NSMutableArray *arr = [NSMutableArray arrayWithCapacity:objarr.count];
        for(int i = 0; i < objarr.count; i++)
        {
            [arr setObject:[self getObjectInternal:[objarr objectAtIndex:i]] atIndexedSubscript:i];
        }
        return arr;
    }
    
    if([obj isKindOfClass:[NSDictionary class]])
    {
        NSDictionary *objdic = obj;
        NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithCapacity:[objdic count]];
        for(NSString *key in objdic.allKeys)
        {
            [dic setObject:[self getObjectInternal:[objdic objectForKey:key]] forKey:key];
        }
        return dic;
    }
    return [self getObjectData:obj];
}

//根据属性名获取set方法
- (SEL)getSetterSelWithAttibuteName:(NSString *)attributeName
{
	NSString *capital = [[attributeName substringToIndex:1] uppercaseString];
	NSString *setterSelStr = [NSString stringWithFormat:@"set%@%@:", capital, [attributeName substringFromIndex:1]];
	return NSSelectorFromString(setterSelStr);
}

#pragma mark - SetAttributes

- (BOOL)setAttributesWithObject:(BaseModel *)object
{
    return (self != object
            && object != nil
            && [object isKindOfClass:self.class]);
}

#pragma mark - JSonValueAttributeFix

- (NSNumber *)integerNumberValueFix:(id)number
{
    NSNumber *numberValue = @0;
    if([number isKindOfClass:NSNumber.class])
    {
        numberValue = number;
    }
    else if([number isKindOfClass:NSString.class])
    {
        numberValue = @([number integerValue]);
    }
    return numberValue;
}

- (NSNumber *)floatNumberValueFix:(id)number
{
    NSNumber *numberValue = @0;
    if([number isKindOfClass:NSNumber.class])
    {
        numberValue = number;
    }
    else if([number isKindOfClass:NSString.class])
    {
        numberValue = @([number floatValue]);
    }
    return numberValue;
}

- (NSString *)stringValueFix:(id)string
{
    NSString *stringValue = @"";
    if([string isKindOfClass:NSString.class])
    {
        stringValue = string;
    }
    else
    {
        if(string && ![string isKindOfClass:NSNull.class])
        {
            stringValue = [NSString stringWithFormat:@"%@", string];
        }
    }
    return stringValue;
}

- (NSString *)urlStringValueFix:(id)string
{
    NSString *stringValue = @"";
    if([string isKindOfClass:NSString.class])
    {
        stringValue = string;
    }
    return stringValue;
}

- (NSString *)clearZeroValueString:(NSString *)string
{
    if([string isEqualToString:@"0"])
    {
        string = @"";
    }
    return string;
}

@end
