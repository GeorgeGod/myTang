//
//  VIPWaitPayViewController.m
//  Tang
//
//  Created by admin on 2017/11/29.
//  Copyright © 2017年 虞嘉伟. All rights reserved.
//

#import "VIPWaitPayViewController.h"
#import "VIPOrderWaitPayCell.h"
#import "VIPOrderTypeCell.h"
#import "VIPOrderTipsCell.h"
#import "DefaultCell.h"
#import "PayOrderBarView.h"

@interface VIPWaitPayViewController ()
@property (nonatomic, strong) PayOrderBarView *payOrderBar;
@end

@implementation VIPWaitPayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.leftBarButtonItem(@"关闭");
    self.title = @"订单详情";
    
    self.payOrderBar = [PayOrderBarView PayOrderBarView];
    self.payOrderBar.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.payOrderBar];
    
    __weak typeof(self)weakSelf = self;
    self.payOrderBar.buttonClickedBlock = ^(UIButton *btn) {
        NSString *btnTitle = btn.titleLabel.text;
        if ([btnTitle isEqualToString:@"取消订单"]) {
            
        } else {
            //支付成功
            //        VIPPayResultViewController *resultCtrl = (VIPPayResultViewController *)[weakSelf displayViewController:[VIPPayResultViewController class]];
            //        resultCtrl.delegate = weakSelf;
            
            //支付失败
            VIPWaitPayViewController *waitPayCtrl = (VIPWaitPayViewController *)[weakSelf displayViewController:[VIPWaitPayViewController class]];
            waitPayCtrl.delegate = weakSelf;
        }
    };
}

-(void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    
    UIEdgeInsets insets = UIEdgeInsetsZero;
    if (@available(iOS 11.0, *)) {
        insets = self.view.safeAreaInsets;
    }
    [self.tableView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view).insets(UIEdgeInsetsMake(0, 0, 49+insets.bottom, 0));
    }];
    
    [self.payOrderBar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self.view).insets(insets);
        make.height.mas_equalTo(49);
    }];
}


-(void)leftBarButtonItemAction:(UIBarButtonItem *)leftBarButtonItem {
    [self dismissViewController];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 4;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 1;
    } else if (section == 1) {
        return 1;
    } else if (section == 2) {
        return 1;
    } else {
        return 2;
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0.01f;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSInteger section = indexPath.section;
    if (section == 0) {
        return 120;
    } else if (section == 1) {
        return 124;
    } else if (section == 2) {
        return 80;
    } else {
        return 49;
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 8;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return nil;
}
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    return [UIView new];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0 && indexPath.row == 0) {
        VIPOrderWaitPayCell *cell = (VIPOrderWaitPayCell *)[tableView obtainXibCell:[VIPOrderWaitPayCell class]];
        return cell;
    } else if (indexPath.section == 1 && indexPath.row == 0) {
        VIPOrderTypeCell *cell = (VIPOrderTypeCell *)[tableView obtainXibCell:[VIPOrderTypeCell class]];
        return cell;
    } else if (indexPath.section == 2) {
        VIPOrderTipsCell *cell = (VIPOrderTipsCell *)[tableView obtainCell:[VIPOrderTipsCell class]];
        [cell assignmentCellWithData:nil];
        return cell;
    } else {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"UITableViewCell"];
            
            cell.textLabel.textColor = [UIColor colorWithHexString:@"#222222"];
            cell.textLabel.font = [UIFont font:15];
            
            cell.detailTextLabel.textColor = [UIColor colorWithHexString:@"#222222"];
            cell.detailTextLabel.font = [UIFont font:14];
        }
        if (indexPath.row == 0) {
            cell.textLabel.text = @"会员费";
            cell.detailTextLabel.text = @"¥199.00";
        } else {
            cell.textLabel.text = @" ";
            cell.detailTextLabel.attributedText = [self amountPayable:199.00];
        }
        return cell;
    }
}

-(NSMutableAttributedString *)amountPayable:(float)money {
    NSMutableAttributedString *attrStr = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"应付：¥%.2f", money]];
    [attrStr addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithHexString:@"#222222"] range:NSMakeRange(0, 3)];
    [attrStr addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithHexString:@"#FC5D4D"] range:NSMakeRange(3, attrStr.length-3)];
    
    return attrStr;
}

@end
