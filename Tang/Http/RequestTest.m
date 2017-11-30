//
//  RequestTest.m
//  Tang
//
//  Created by admin on 2017/11/30.
//  Copyright © 2017年 虞嘉伟. All rights reserved.
//

#import "RequestTest.h"

@implementation RequestTest

+(void)requestTest {
    
    HttpParams *para = [HttpParams new];
    para.uri = @"/api/app/meeting/getarea";
    para.bodyParams = @{@"Type":@(0)};
    
    [Http postWithParams:para success:^(NSDictionary * _Nullable json) {
        
        NSLog(@"aaa=%@", (NSDictionary *)json);
    } failure:^(NSError * _Nullable error) {
        
        NSLog(@"bbb");
    }];
    
    
    //9.6
    para = [HttpParams new];
    para.uri = @"/api/app/buyvip/list";
    para.bodyParams = @{@"IdentityId":@(0)}; //会员ID
    
    [Http postWithParams:para success:^(NSDictionary * _Nullable json) {
        
        NSLog(@"aaa=%@", (NSDictionary *)json);
    } failure:^(NSError * _Nullable error) {
        NSLog(@"bbb");
    }];
    
    
    //9.7
    para = [HttpParams new];
    para.uri = @"/api/app/buyvip/getprice";
    para.bodyParams = @{@"typeId":@(0)}; //1：VIP会员，2：InnoMaker会员，3：InnoMaker储物箱
    
    [Http postWithParams:para success:^(NSDictionary * _Nullable json) {
        
        NSLog(@"aaa=%@", (NSDictionary *)json);
    } failure:^(NSError * _Nullable error) {
        NSLog(@"bbb");
    }];
    
    
    //9.8
    para = [HttpParams new];
    para.uri = @"/api/app/buyvip/add";
    para.bodyParams = @{@"typeId":@(0), //1：VIP会员，2：InnoMaker会员，3：InnoMaker储物箱
                        @"IdentityId":@(0), //会员ID
                        @"priceId":@(0), //价格id
                        @"payType":@(1),//1：支付宝，2：微信支付
                        };
    
    [Http postWithParams:para success:^(NSDictionary * _Nullable json) {
        
        NSLog(@"aaa=%@", (NSDictionary *)json);
    } failure:^(NSError * _Nullable error) {
        NSLog(@"bbb");
    }];
}

@end
