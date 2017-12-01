//
//  PersonalHeadCell.m
//  Tang
//
//  Created by admin on 2017/12/1.
//  Copyright © 2017年 虞嘉伟. All rights reserved.
//

#import "PersonalHeadCell.h"

@implementation PersonalHeadCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    [self initView];
}

-(void)initView {
    self.phone.image = [UIImage load:@"icon_phone"];
    self.portrait.image = [UIImage load:@"portrait"];
    self.gender.image = [UIImage load:@"icon_male"];
    self.message.image = [UIImage load:@"icon_message"];
    
    self.nickname.textColor = [UIColor colorWithHexString:@"#222222"];
    self.job.textColor = [UIColor colorWithHexString:@"#666666"];
    [self.editInformationBtn setTitleColor:[UIColor colorWithHexString:@"#4B9FED"] forState:UIControlStateNormal];
}

- (IBAction)editInformationAction:(UIButton *)sender {
    
}
@end
