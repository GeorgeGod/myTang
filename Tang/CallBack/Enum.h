//
//  Enum.h
//  Tang
//
//  Created by 虞嘉伟 on 2017/11/29.
//  Copyright © 2017年 虞嘉伟. All rights reserved.
//

#ifndef Enum_h
#define Enum_h

typedef NS_ENUM(NSInteger, TSPayType) {
    TSPayTypeAliPay         = 0, //支付宝支付
    TSPayTypeWePay          = 1, //微信支付
    TSPayTypeUnionPay       = 2, //银联支付
    TSPayTypeTransferPay    = 3, //转账支付
};


#endif /* Enum_h */
