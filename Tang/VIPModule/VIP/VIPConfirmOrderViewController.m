//
//  VIPConfirmOrderViewController.m
//  Tang
//
//  Created by admin on 2017/11/29.
//  Copyright © 2017年 虞嘉伟. All rights reserved.
//

#import "VIPConfirmOrderViewController.h"
#import "UIImage+Path.h"
#import <Masonry.h>
#import <MJExtension.h>
#import "UIFont+Extension.h"
#import "UITableView+Extension.h"
#import "GVUserDefaults+Extension.h"
#import "UIColor+Extension.h"
#import "NSNumber+Extension.h"
#import <JKCategories/JKCategories.h>
#import "VIPDetailPriceCell.h"
#import "VIPConfirmOrderCell.h"
#import "DefaultCell.h"
#import "ActionSheetView.h"
#import "PaymentBarView.h"
#import "VIPPayResultViewController.h"
#import "VIPDetailViewController.h"
#import "VIPWaitPayViewController.h"

#import "OrderPriceModel.h"
#import "ContactCustomerService.h"
#import "Http.h"

@interface VIPConfirmOrderViewController ()<DelegateCallBack>
{
    NSArray<OrderPriceModel *> *dataArray;
    int priceId; //价格ID
    TSPayType payType; //支付方式
}
@property (nonatomic, strong) PaymentBarView *paymentBar;
@property (nonatomic, assign) BOOL isConfirm; //是否同意协议
@property (nonatomic, assign) TSPayType payType; //支付方式
@end

@implementation VIPConfirmOrderViewController
@synthesize payType;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"确认订单";
    self.leftBarButtonItem([UIImage load:@"back_gray"]);
    
    //设置支付宝为默认支付方式
    payType = TSPayTypeAliPay;
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view).insets(UIEdgeInsetsMake(0, 0, 49, 0));
    }];
    
    self.paymentBar = [PaymentBarView PaymentBarView];
    self.paymentBar.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.paymentBar];
    
    __weak typeof(self)weakSelf = self;
    self.paymentBar.buttonClickedBlock = ^(UIButton *btn) {
        [weakSelf buyButtonClicked];
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
        if (indexPath.row < dataArray.count) {
            return 49;
        } else {
            return [VIPConfirmOrderCell obtainCellHeight:@"· 工具使用权\n· 储物箱租用权\n· 工作坊开发权\n· 专属课程福利\n· 参赛费用优惠\n· 专属兴趣小组" date:@"购买后即日起生效，有效期至2017-07-31"];
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
        [attrStr addAttribute:NSFontAttributeName value:[UIFont RegularFont:12] range:NSMakeRange(0, attrStr.length)];
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
    //第一个分区返回价格列表的数量加1
    return section==0 ? dataArray.count+1 : 2;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        if (indexPath.row < dataArray.count) {
            VIPDetailPriceCell *cell = (VIPDetailPriceCell *)[tableView obtainCell:[VIPDetailPriceCell class]];
            //异常捕获赋值（防止闪退）
            OrderPriceModel *model = nil;
            @try {
                model = dataArray[indexPath.row];
            } @catch (NSException *error) {} @finally {
//                if ([model.MainTitle isKindOfClass:[NSString class]]) {
//                    cell.title.text = [NSString stringWithFormat:@"%@", model.MainTitle];
//                }
                cell.price.text = model.Price;
            }
            if (self.centerType == TSMemberCenterTypeVIP) {
                cell.viplogo.image = [UIImage load:@"vip"];
            } else {
                cell.viplogo.image = [UIImage load:@"maker"];
            }
            return cell;
        } else {
            VIPConfirmOrderCell *cell = (VIPConfirmOrderCell *)[tableView obtainXibCell:[VIPConfirmOrderCell class]];
            [cell assignmentCellWithData:nil];
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
                cell.textLabel.font = [UIFont RegularFont:12];
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

//请求数据
-(void)requestData {
    //9.7
    HttpParams *para = [HttpParams new];
    para.uri = @"/api/app/buyvip/getprice";
    para.bodyParams = @{@"typeId":@(self.centerType)}; //1：VIP会员，2：InnoMaker会员，3：InnoMaker储物箱
    
    [Http postWithParams:para success:^(NSDictionary * _Nullable json) {
        
        dataArray = [OrderPriceModel mj_objectArrayWithKeyValuesArray:json[@"list"]];
        [self refreshData];
        
        NSLog(@"aaa=%@", (NSDictionary *)json);
    } failure:^(NSError * _Nullable error) {
        NSLog(@"bbb");
    }];
}

//刷新数据
-(void)refreshData {
    [self.tableView reloadData];
}


//购买按钮点击事件
-(void)buyButtonClicked {
    NSString *memberId = USERINFO.memberId;
    if (memberId.length == 0) {
        //未登录
        return;
    }
    if (priceId == 0) {
        //未选择价格
        priceId = dataArray.firstObject.Index;
//        return;
    }
    if (payType == 0) {
        //未选择支付方式
        return;
    }
    //请求订单ID
    HttpParams *para = [HttpParams new];
    para.uri = @"/api/app/buyvip/add";
    para.bodyParams = @{@"typeId":@(self.centerType), //1：VIP会员，2：InnoMaker会员，3：InnoMaker储物箱
                        @"IdentityId":memberId, //会员ID
                        @"priceId":@(priceId), //价格id
                        @"payType":@(payType),//1：支付宝，2：微信支付，3：银联，5：公司转账
                        };
    
    [Http postWithParams:para success:^(NSDictionary * _Nullable json) {
        
        NSLog(@"aaa=%@", (NSDictionary *)json);
        if ([json[@"errcode"] intValue] == 0) {
            [self paymentWithOrderId:[json[@"id"] longValue]];
        }
    } failure:^(NSError * _Nullable error) {
        NSLog(@"bbb");
    }];
}


/**
 调起支付第三方支付界面支付
 */
-(void)paymentWithOrderId:(long)orderId {
    if (orderId == 0) {
        NSLog(@"订单ID有问题!");
        return;
    }
    //TODO 支付吧
    __weak typeof(self)weakSelf = self;
    if (/* DISABLES CODE */ (1)) {
        //支付成功
        VIPPayResultViewController *resultCtrl = (VIPPayResultViewController *)[weakSelf displayViewController:[VIPPayResultViewController class]];
        resultCtrl.delegate = weakSelf;
    } else {
        //支付失败
        VIPWaitPayViewController *waitPayCtrl = (VIPWaitPayViewController *)[weakSelf displayViewController:[VIPWaitPayViewController class]];
        waitPayCtrl.delegate = weakSelf;
    }
}
@end
