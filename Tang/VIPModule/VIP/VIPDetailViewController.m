//
//  VIPDetailViewController.m
//  Tang
//
//  Created by admin on 2017/11/29.
//  Copyright © 2017年 虞嘉伟. All rights reserved.
//

#import "VIPDetailViewController.h"
#import "VIPConfirmOrderViewController.h"

#import "VIPDetailPriceCell.h"
#import "VIPPrivilegeCell.h"
#import "VIPDetailTipsCell.h"

@interface VIPDetailViewController ()
{
    NSArray *priceArray; //价格列表
    NSArray *privilegeArray; //特权列表
    NSString *tips; //最后提示
}

/**
 判断是否已经开通VIP权限（底部按钮有差异）
 */
@property (nonatomic, assign) BOOL isVIP;

@end

@implementation VIPDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"VIP特权";
    self.leftBarButtonItem([UIImage load:@"back_gray"]);
    self.rightBarButtonItem(@"联系客服");
}

-(void)initData {
    if (self.currentPage == 0) {
        priceArray = @[
                       @{@"title":@"包月VIP会员", @"price":@"¥199/月"},
                       @{@"title":@"包年VIP会员", @"price":@"¥299/月"},
                       ];
        privilegeArray = @[
                           @{@"icon":@"icon_gift", @"title":@"INNO会员大礼包", @"detail":@"价值298元的大礼包，包含以下内容：", @"describe":@"· 灵活工位抵用券2张（价值140元，每张可体验一天）；\n· INNO挂耳咖啡包一盒（价值73元）；\n· 会议室抵用券2张（价值80元，每张可抵用0.5h）；\n· NNO马克杯一个；\n· 免费打印10张；\n· NNO-T恤1件；"},
                           @{@"icon":@"icon_discount", @"title":@"INNO Store专享价", @"detail":@"在INNO商城购买任何商品均享受专享价"},
                           @{@"icon":@"icon_enquire", @"title":@"企业咨询服务", @"detail":@"可享受INNO专家提供的企业咨询服务"},
                           @{@"icon":@"icon_exclusive", @"title":@"INNO会员专属标识", @"detail":@"会员才拥有的专属标识，身份和地位的象征"},
                           @{@"icon":@"icon_country", @"title":@"全国范围享受权益", @"detail":@"在全国所有的INNOSPACE+旗下空间均可享受此VIP特权"},
                           ];
        tips = @"*开通会员后，所有特权立即生效，会员专属大礼包需要联系客服领取。\n会员权益同时只可购买一个月，需要当月权益过期后方可购买下一个月的权益。\n最终解释权归INNOSPACE+所有";
    } else {
        priceArray = @[
                       @{@"title":@"包月InnoMaker会员", @"price":@"¥100"},
                       @{@"title":@"半年InnoMaker会员", @"price":@"¥450", @"desc":@"(合¥75每个月)"},
                       @{@"title":@"全年InnoMaker会员", @"price":@"¥800", @"desc":@"(合¥66.7每个月)"},
                       ];
        privilegeArray = @[
                           @{@"icon":@"icon_tools", @"title":@"工具使用权", @"detail":@"可以在开放时间内使用工具以及空间（大型机器需要接受培训）（材料自费）"},
                           @{@"icon":@"icon_box", @"title":@"储物箱租用权", @"detail":@"可付费租用储物箱存放个人物品，请不要存放贵重物品，丢失概不负责，租用价格：30元／月，180元／半年，360元／每年"},
                           @{@"icon":@"icon_workshop", @"title":@"工作坊开发权", @"detail":@"可以在INNOSPACE+开发个人收费工作坊"},
                           @{@"icon":@"icon_course", @"title":@"专属课程福利", @"detail":@"可参加空间的各类免费及付费的工作坊及培训课程；（付费工作坊及课程享受9折优惠）"},
                           @{@"icon":@"icon_cost", @"title":@"参赛费用优惠", @"detail":@"多人团队代表INNOSPACE+参加比赛时，只需付一个人的费用"},
                           @{@"icon":@"icon_hobby", @"title":@"专属兴趣小组", @"detail":@"可参与会员专属的会员兴趣小组、各种会谈及讨论活动"},
                           ];
        tips = @"*InnoMaker会员只限上海创智旗舰使用\n会员需遵守各自会员参与时间，不得在非权限使用时间内使用本空间；\n会员在空间内活动时应举止文明，尊重他人的思想及爱好；\n会员在使用空间各种测量及加工设备前，需充分了解工具的使用方法，严格按照安全要求规范使用；\n会员需爱护并小心使用空间内任一工具，使用完工具后放回原位，工具有任何损坏应及时告知管理员；\n使用完工作台后，请自觉清理干净";
    }
    
}

-(void)leftBarButtonItemAction:(UIBarButtonItem *)leftBarButtonItem {
    [self popViewController];
}

-(void)rightBarButtonItemAction:(UIBarButtonItem *)rightBarButtonItem {
    [ContactCustomerService ContactCustomerService];
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 49;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row < priceArray.count) {
        return 49;
    } else if (indexPath.row < priceArray.count+privilegeArray.count) {
        return [VIPPrivilegeCell CalculateCellHeightWithData:privilegeArray[indexPath.row-priceArray.count]];
    } else if (indexPath.row == priceArray.count+privilegeArray.count) {
        return [VIPDetailTipsCell CalculateCellHeightWithData:tips];
    } else {
        return 0;
    }
}

-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    
    UIButton *vipBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [vipBtn setTitle:@"立即开通VIP会员" forState:UIControlStateNormal];
    vipBtn.titleLabel.font = [UIFont font:17];
    [vipBtn setBackgroundImage:[UIImage imageWithColor:[UIColor colorWithHexString:@"#222222"]] forState:UIControlStateNormal];
    [vipBtn setShowsTouchWhenHighlighted:YES];
    __weak typeof(self) weakSelf = self;
    [vipBtn jk_addActionHandler:^(NSInteger tag) {
        [weakSelf pushViewController:[VIPConfirmOrderViewController class]];
    }];
    return vipBtn;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return priceArray.count+privilegeArray.count+1;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row < priceArray.count) {
        VIPDetailPriceCell *cell = (VIPDetailPriceCell *)[tableView obtainCell:[VIPDetailPriceCell class]];
        [cell assignmentCellWithData:priceArray[indexPath.row]];
        return cell;
    } else if (indexPath.row < priceArray.count+privilegeArray.count) {
        VIPPrivilegeCell *cell = (VIPPrivilegeCell *)[tableView obtainXibCell:[VIPPrivilegeCell class]];
        [cell assignmentCellWithData:privilegeArray[indexPath.row-priceArray.count]];
        return cell;
    } else if (indexPath.row == priceArray.count+privilegeArray.count) {
        VIPDetailTipsCell *cell = (VIPDetailTipsCell *)[tableView obtainCell:[VIPDetailTipsCell class]];
        [cell assignmentCellWithData:tips];
        return cell;
    }
    return nil;
}




@end
