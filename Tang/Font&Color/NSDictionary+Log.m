//
//  NSDictionary+Log.m
//  Tang
//
//  Created by admin on 2017/11/30.
//  Copyright © 2017年 虞嘉伟. All rights reserved.
//

#import "NSDictionary+Log.h"

@implementation NSDictionary (Log)

- (NSString *)descriptionWithLocale:(id)locale {
    
    NSMutableString *string = [NSMutableString string];
    
    // 开头有个{
    [string appendString:@"{\n"];
    
    // 遍历所有的键值对
    [self enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        [string appendFormat:@"\t%@", key];
        [string appendString:@" : "];
        [string appendFormat:@"%@,\n", obj];
    }];
    
    // 结尾有个}
    [string appendString:@"}"];
    
    // 查找最后一个逗号
    NSRange range = [string rangeOfString:@"," options:NSBackwardsSearch];
    if (range.location != NSNotFound)
        [string deleteCharactersInRange:range];
    
    return string;
}

@end