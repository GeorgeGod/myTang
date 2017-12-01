//
//  UIFont+Extension.m
//  Tang
//
//  Created by 虞嘉伟 on 2017/11/28.
//  Copyright © 2017年 虞嘉伟. All rights reserved.
//

#import "UIFont+Extension.h"

@implementation UIFont (Extension)

+(instancetype)font:(float)size {
    return [UIFont fontWithName:@"Arial" size:size];
}

+(instancetype)lightFont:(float)size {
    if (@available(iOS 8.2, *)) {
        return [UIFont systemFontOfSize:size weight:UIFontWeightLight];
    } else {
        return [self font:size];
    }
}
@end
