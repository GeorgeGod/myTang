//
//  PayOrderBarView.h
//  Tang
//
//  Created by admin on 2017/11/30.
//  Copyright © 2017年 虞嘉伟. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BlockCallBack.h"

/**
 订单详情页的付款条
 */
@interface PayOrderBarView : UIView

@property (nonatomic, copy) ButtonClickedCallBack buttonClickedBlock;

+(instancetype)PayOrderBarView;

@end
