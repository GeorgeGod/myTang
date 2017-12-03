//
//  HPPersonalHeadView.h
//  Tang
//
//  Created by 虞嘉伟 on 2017/12/1.
//  Copyright © 2017年 虞嘉伟. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HPPersonalHeadView : UIView
@property (nonatomic, strong) UILabel *title;
@property (nonatomic, strong) UIButton *button;
+(instancetype)HeadView;
+(instancetype)HeadViewTag:(NSInteger)tag withButtonTitle:(NSString *)title;
@end
