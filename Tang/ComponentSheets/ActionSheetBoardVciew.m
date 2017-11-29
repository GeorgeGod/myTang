//
//  ActionSheetBoardVciew.m
//  Tang
//
//  Created by 虞嘉伟 on 2017/11/29.
//  Copyright © 2017年 虞嘉伟. All rights reserved.
//

#import "ActionSheetBoardVciew.h"
#import "ActionSheetHeadView.h"

@interface ActionSheetBoardVciew()<UIPickerViewDelegate, UIPickerViewDataSource>
@property (nonatomic, strong) ActionSheetHeadView *headView;
@end
@implementation ActionSheetBoardVciew

-(instancetype)init {
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        
        ActionSheetHeadView *headView = [[ActionSheetHeadView alloc] initWithTitle:@"选择开通时限" leftBtn:@"取消" rightBtn:nil];
        self.headView = headView;
        [self addSubview:headView];
        [headView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.top.equalTo(self);
            make.height.mas_equalTo(44);
        }];
        
        UIPickerView *pickerView = [UIPickerView new];
        pickerView.delegate = self;
        pickerView.dataSource = self;
        [self addSubview:pickerView];
        
        [pickerView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.equalTo(self);
            make.top.equalTo(headView.mas_bottom);
        }];
    }
    return self;
}

-(void)setButtonClickedBlock:(ButtonClickedCallBack)buttonClickedBlock {
    self.headView.buttonClickedBlock = buttonClickedBlock;
}

- (NSInteger)numberOfComponentsInPickerView:(nonnull UIPickerView *)pickerView {
    return 1;
}

- (NSInteger)pickerView:(nonnull UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return 3;
}

-(CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component {
    return 40;
}

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(nullable UIView *)view {
    
    UILabel *title = [UILabel new];
    title.textAlignment = NSTextAlignmentCenter;
    
    title.text = @"包月InnoMaker会员  ¥100";
    return title;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {

    
}



@end
