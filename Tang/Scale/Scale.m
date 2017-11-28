//
//  Scale.m
//  Tang
//
//  Created by 虞嘉伟 on 2017/11/29.
//  Copyright © 2017年 虞嘉伟. All rights reserved.
//

#import "Scale.h"

@implementation Scale

float scale(float x) {
    
    float width = [UIScreen mainScreen].bounds.size.width;
    float s = width/375.0;
    return x*s;
}
@end
