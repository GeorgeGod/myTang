//
//  HPEditPersonalModel.h
//  Tang
//
//  Created by 虞嘉伟 on 2017/12/1.
//  Copyright © 2017年 虞嘉伟. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HPEditPersonalModel : NSObject
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *detail;
@property (nonatomic, copy) NSString *placeholder;
@property (nonatomic, assign) BOOL showArrow;
+(instancetype)EditModel:(NSString *)title detail:(NSString *)detail place:(NSString *)placeholder show:(BOOL)show;

-(NSString *)calculateAge:(NSString *)birth;
@end
