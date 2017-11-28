//
//  NSString+Path.m
//  Tang
//
//  Created by 虞嘉伟 on 2017/11/28.
//  Copyright © 2017年 虞嘉伟. All rights reserved.
//

#import "NSString+Path.h"

@implementation NSString (Path)

+(UIImage *)load:(NSString *)name {
    NSString *bundlePath = [[NSBundle mainBundle] pathForResource:@"MineResources" ofType:@"bundle"];
    
    bundlePath = [bundlePath stringByAppendingPathComponent:@"images"];
    
    NSString *imgPath= [bundlePath stringByAppendingPathComponent:name];
    
    UIImage *image = [UIImage imageWithContentsOfFile:imgPath];
    
    return image;
}

@end
