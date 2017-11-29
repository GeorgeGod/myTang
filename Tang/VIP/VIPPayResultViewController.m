//
//  VIPPayResultViewController.m
//  Tang
//
//  Created by admin on 2017/11/29.
//  Copyright © 2017年 虞嘉伟. All rights reserved.
//

#import "VIPPayResultViewController.h"

@interface VIPPayResultViewController ()

@end

@implementation VIPPayResultViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.leftBarButtonItem(@"关闭");
    self.title = @"支付结果";
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}

-(void)leftBarButtonItemAction:(UIBarButtonItem *)leftBarButtonItem {
    [self dismissViewController];
}


-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0.01;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 183+22;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 180;
}

-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    
    //创建一个容器视图
    UIView *footView = [UIView new];
    
    //创建提示标题
    UILabel *tips = [UILabel new];
    tips.textColor = [UIColor colorWithHexString:@"#666666"];
    tips.textAlignment = NSTextAlignmentCenter;
    tips.numberOfLines = 0;
    tips.text = @"您购买的VIP特权已生效，会员专属大礼包\n请联系客服领取";
    tips.font = [UIFont font:14];
    [footView addSubview:tips];
    
    //创建“查看权益“的按钮
    UIButton *checkInterestsBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [checkInterestsBtn setTitle:@"查看我的权益" forState:UIControlStateNormal];
    [checkInterestsBtn jk_setBackgroundColor:[UIColor colorWithHexString:@"#222222"] forState:UIControlStateNormal];
    checkInterestsBtn.showsTouchWhenHighlighted = YES;
    [footView addSubview:checkInterestsBtn];
    
    //创建“联系客服领礼包”的按钮
    UIButton *contactCustomerBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [contactCustomerBtn setTitle:@"联系客服领取大礼包" forState:UIControlStateNormal];
    [contactCustomerBtn setTitleColor:[UIColor colorWithHexString:@"#4B9FED"] forState:UIControlStateNormal];
    contactCustomerBtn.titleLabel.font = [UIFont font:14];
    contactCustomerBtn.showsTouchWhenHighlighted = YES;
    [footView addSubview:contactCustomerBtn];
    
    
    [tips mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(footView).insets(UIEdgeInsetsMake(0, 20, 0, 20));
        make.top.mas_equalTo(22);
    }];
    [checkInterestsBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(footView).insets(UIEdgeInsetsMake(0, 20, 0, 20));
        make.top.equalTo(tips.mas_bottom).offset(35);
        make.height.mas_equalTo(44);
    }];
    [contactCustomerBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(footView).insets(UIEdgeInsetsMake(0, 20, 0, 20));
        make.top.equalTo(checkInterestsBtn.mas_bottom).offset(10);
        make.height.mas_equalTo(44);
    }];
    return footView;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UITableViewCell"];
        cell.clipsToBounds = YES;
        
        UIImageView *bannerBG = [[UIImageView alloc] initWithImage:[UIImage load:@"banner_result"]];
        bannerBG.contentMode = UIViewContentModeScaleAspectFill;
        [cell.contentView addSubview:bannerBG];
        [bannerBG mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(cell.contentView);
        }];
        
        UIImageView *status = [UIImageView new];
        status.contentMode = UIViewContentModeScaleAspectFit;
        status.tag = 2;
        [cell.contentView addSubview:status];
        [status mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(cell.contentView);
            make.top.mas_equalTo(53);
            make.size.mas_equalTo(CGSizeMake(52, 52));
        }];
        
        UILabel *statusLabel = [UILabel new];
        statusLabel.textColor = [UIColor whiteColor];
        statusLabel.textAlignment = NSTextAlignmentCenter;
        statusLabel.font = [UIFont font:20];
        statusLabel.tag = 3;
        [cell.contentView addSubview:statusLabel];
        [statusLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(cell.contentView);
            make.top.equalTo(status.mas_bottom).offset(14);
        }];
    }
    UIImageView *status = [cell.contentView viewWithTag:2];
    UILabel *statusLabel = [cell.contentView viewWithTag:3];
    
    status.image = [UIImage load:@"icon_success"];
    statusLabel.text = @"支付成功";
    return cell;
}

@end
