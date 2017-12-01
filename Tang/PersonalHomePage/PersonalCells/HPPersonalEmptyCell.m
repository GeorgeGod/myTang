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
    //创建icon
    UIImageView *icon = [UIImageView new];
    self.icon = icon;
    [self.contentView addSubview:icon];
    //创建标题
    UILabel *title = [UILabel new];
    self.title = title;
    title.textColor = [UIColor colorWithHexString:@"#666666"];
    title.font = [UIFont lightFont:15];
    [self.contentView addSubview:title];
    //布局
    [icon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(20);
        make.right.equalTo(title.mas_left).offset(-4);
        make.centerY.equalTo(self.contentView);
    }];
    [title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(icon.mas_right);
        make.centerY.equalTo(self.contentView);
    }];
}

-(void)assignmentCellWithSection:(NSInteger)section {
    if (section == 1) {
        self.icon.image = [UIImage load:@""];
        self.title.textColor = [UIColor colorWithHexString:@"#666666"];
        self.title.text = @"暂无项目信息";
    } else if (section == 2) {
        self.icon.image = [UIImage load:@"icon_mine_add"];
        self.title.textColor = [UIColor colorWithHexString:@"#4B9FED"];
        self.title.text = @"点击添加教育信息";
    } else {
        self.icon.image = [UIImage load:@"icon_mine_add"];
        self.title.textColor = [UIColor colorWithHexString:@"#4B9FED"];
        self.title.text = @"点击添加标签";
    }
}

@end
