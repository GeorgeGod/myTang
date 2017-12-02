//
//  HPPersonalEmptyCell.m
//  Tang
//
//  Created by 虞嘉伟 on 2017/12/1.
//  Copyright © 2017年 虞嘉伟. All rights reserved.
//

#import "HPPersonalEmptyCell.h"

@implementation HPPersonalEmptyCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        [self initView];
    }
    return self;
}

-(void)initView {
    self.addButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.addButton.titleLabel.font = [UIFont lightFont:15];
    self.addButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [self.addButton jk_setImagePosition:LXMImagePositionLeft spacing:4];
    [self.contentView addSubview:self.addButton];
    [self.addButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(20);
        make.top.bottom.equalTo(self.contentView);
        make.width.mas_equalTo(200);
    }];
}

-(void)assignmentCellWithSection:(NSInteger)section {
    if (section == 1) {
        [self.addButton setTitle:@"暂无项目信息" forState:UIControlStateNormal];
        [self.addButton setTitleColor:[UIColor colorWithHexString:@"#666666"] forState:UIControlStateNormal];
        [self.addButton setImage:nil forState:UIControlStateNormal];
        [self.addButton jk_setImagePosition:LXMImagePositionLeft spacing:0];
    } else if (section == 2) {
        [self.addButton setTitle:@"点击添加教育信息" forState:UIControlStateNormal];
        [self.addButton setTitleColor:[UIColor colorWithHexString:@"#4B9FED"] forState:UIControlStateNormal];
        [self.addButton setImage:[UIImage load:@"icon_mine_add"] forState:UIControlStateNormal];
        [self.addButton jk_setImagePosition:LXMImagePositionLeft spacing:4];
    } else {
        [self.addButton setTitle:@"点击添加标签" forState:UIControlStateNormal];
        [self.addButton setTitleColor:[UIColor colorWithHexString:@"#4B9FED"] forState:UIControlStateNormal];
        [self.addButton setImage:[UIImage load:@"icon_mine_add"] forState:UIControlStateNormal];
        [self.addButton jk_setImagePosition:LXMImagePositionLeft spacing:4];
    }
}

@end
