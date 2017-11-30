//
//  GVUserDefaults+Extension.h
//  Tang
//
//  Created by admin on 2017/11/30.
//  Copyright © 2017年 虞嘉伟. All rights reserved.
//

#import <GVUserDefaults/GVUserDefaults.h>
#define USERINFO [GVUserDefaults standardUserDefaults]

@interface GVUserDefaults (Extension)

@property (nonatomic, copy  ) NSString *accessToken;

@end
