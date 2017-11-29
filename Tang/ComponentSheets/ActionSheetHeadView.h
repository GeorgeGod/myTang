//
//  ActionSheetHeadView.h
//  Tang
//
//  Created by 虞嘉伟 on 2017/11/29.
//  Copyright © 2017年 虞嘉伟. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ActionSheetHeadView : UIView

@property (nonatomic, copy) ButtonClickedCallBack buttonClickedBlock;

-(instancetype)initWithTitle:(NSString *)title leftBtn:(NSString *)left rightBtn:(NSString *)right;

@end
