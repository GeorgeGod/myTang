//
//  VIPConfirmOrderViewController.m
//  Tang
//
//  Created by admin on 2017/11/29.
//  Copyright © 2017年 虞嘉伟. All rights reserved.
//

#import "VIPConfirmOrderViewController.h"
#import "VIPDetailPriceCell.h"
#import "VIPConfirmOrderCell.h"
#import "DefaultCell.h"
#import "ActionSheetView.h"
#import "PaymentBarView.h"
#import "VIPPayResultViewController.h"
#import "VIPDetailViewController.h"
#import "VIPWaitPayViewController.h"

@interface VIPConfirmOrderViewController ()<DelegateCallBack>
@property (nonatomic, strong) PaymentBarView *paymentBar;
@property (nonatomic, assign) BOOL isConfirm; //是否同意协议
@property (nonatomic, assign) TSPayType payType; //支付方式
@end

@implementation VIPConfirmOrderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"确认订单";
    self.leftBarButtonItem([UIImage load:@"back_gray"]);
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view).insets(UIEdgeInsetsMake(0, 0, 49, 0));
    }];
    
    self.paymentBar = [PaymentBarView PaymentBarView];
    self.paymentBar.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.paymentBar];
    
    __weak typeof(self)weakSelf = self;
    self.paymentBar.buttonClickedBlock = ^(UIButton *btn) {
        //支付成功
//        VIPPayResultViewController *resultCtrl = (VIPPayResultViewController *)[weakSelf displayViewController:[VIPPayResultViewController class]];
//        resultCtrl.delegate = weakSelf;
        
        //支付失败
        VIPWaitPayViewController *waitPayCtrl = (VIPWaitPayViewController *)[weakSelf displayViewController:[VIPWaitPayViewController class]];
        waitPayCtrl.delegate = weakSelf;
    };
    [self.paymentBar setPrice:199];
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
    
    [self.paymentBar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self.view).insets(insets);
        make.height.mas_equalTo(49);
    }];
}

//代理方法
-(void)buttonClickedBackCtrlDelegate:(BaseViewController *)target withType:(int)type {
    [target dismissViewController];
    switch (type) {
        case 2: {
            //查看我的权益
            [self pushViewController:[VIPDetailViewController class]];
            break;
        }
        case 3: {
            //联系客服
            [ContactCustomerService ContactCustomerService];
            break;
        }
        default:
            break;
    }
}

-(void)leftBarButtonItemAction:(UIBarButtonItem *)leftBarButtonItem {
    [self popViewController];
}


-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0.01;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return section==0 ? 8 : scale(257);
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            return 49;
        } else {
            return 164;
        }
    } else {
        if (indexPath.row == 0) {
            return 49;
        } else {
            return 27;
        }
    }
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return nil;
}
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    if (section == 1) {
        UIView *footView = [UIView new];
        footView.backgroundColor = [UIColor whiteColor];
        
        UIButton *confirmAgreementBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        
        NSMutableAttributedString *attrStr = [[NSMutableAttributedString alloc] initWithString:@"我同意《INNOSPACE+ VIP服务协议》"];
        [attrStr addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithHexString:@"#666666"] range:NSMakeRange(0, 3)];
        [attrStr addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithHexString:@"#4B9FED"] range:NSMakeRange(3, attrStr.length-3)];
        [attrStr addAttribute:NSFontAttributeName value:[UIFont font:12] range:NSMakeRange(0, attrStr.length)];
        [confirmAgreementBtn setAttributedTitle:attrStr forState:UIControlStateNormal];
        
        [confirmAgreementBtn setImage:[UIImage load:@"checkbox_nor"] forState:UIControlStateNormal];
        [confirmAgreementBtn setImage:[UIImage load:@"checkbox_sel"] forState:UIControlStateSelected];
        [confirmAgreementBtn jk_setImagePosition:LXMImagePositionLeft spacing:10];
        [confirmAgreementBtn jk_addActionHandler:^(NSInteger tag) {
            confirmAgreementBtn.selected = !confirmAgreementBtn.selected;
        }];
        [footView addSubview:confirmAgreementBtn];
        [confirmAgreementBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.equalTo(footView);
            make.height.mas_equalTo(57);
        }];
        return footView;
    }
    return nil;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            VIPDetailPriceCell *cell = (VIPDetailPriceCell *)[tableView obtainCell:[VIPDetailPriceCell class]];
            cell.viplogo.image = [UIImage load:@"vip"];
            return cell;
        } else if (indexPath.row == 1) {
            VIPConfirmOrderCell *cell = (VIPConfirmOrderCell *)[tableView obtainXibCell:[VIPConfirmOrderCell class]];
            return cell;
        }
    } else {
        if (indexPath.row == 0) {
            DefaultCell *cell = (DefaultCell *)[tableView obtainCell:[DefaultCell class]];
            cell.textLabel.text = @"支付方式";
            cell.detailTextLabel.text = @"支付宝";
            return cell;
        } else if (indexPath.row == 1) {
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
            if (!cell) {
                cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UITableViewCell"];
                cell.textLabel.textColor = [UIColor colorWithHexString:@"#999999"];
                cell.textLabel.font = [UIFont font:12];
            }
            cell.textLabel.text = @"*支付成功后不可退款，会员权益立即激活";
            return cell;
        }
    }
    return nil;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [super tableView:tableView didSelectRowAtIndexPath:indexPath];
    
    if (indexPath.section == 1 && indexPath.row == 0) {
        //MARK:: 选择支付方式
        ActionSheetView *actionSheet = [ActionSheetView new];
        
    }
}


@end
