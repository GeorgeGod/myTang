//
//  ActionSheetView.m
//  Tang
//
//  Created by 虞嘉伟 on 2017/11/29.
//  Copyright © 2017年 虞嘉伟. All rights reserved.
//

#import "ActionSheetView.h"
#import "ActionSheetBoardVciew.h"

@interface ActionSheetView()
@property (nonatomic, strong) ActionSheetBoardVciew *boardView;
@property (nonatomic, strong) UIButton *alphaBg;
@end

@implementation ActionSheetView

-(instancetype)init {
    
    self = [super init];
    if (self) {
        
        [self initView];
    }
    return self;
}

-(void)initView {
    UIButton *alphaBg = [UIButton new];
    self.alphaBg = alphaBg;
    alphaBg.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.6];
    [alphaBg jk_addActionHandler:^(NSInteger tag) {
        [self dismissWithAnimation];
    }];
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    [window addSubview:alphaBg];
    
    [alphaBg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(window);
    }];
    
    self.boardView = [[ActionSheetBoardVciew alloc] init];
    __weak typeof(self)weakSelf = self;
    self.boardView.buttonClickedBlock = ^(UIButton *btn) {
        [weakSelf dismissWithAnimation];
    };
    [alphaBg addSubview:self.boardView];
    [self.boardView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(alphaBg);
        make.height.mas_equalTo(166);
    }];
}


/**
 移除
 */
-(void)dismissWithAnimation {
    [self.alphaBg removeFromSuperview];
}

/**
 显示
 */
-(void)displayWithAnimation {
    
}

@end
