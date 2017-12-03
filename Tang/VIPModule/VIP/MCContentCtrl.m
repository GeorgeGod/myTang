//
//  MCContentCtrl.m
//  Tang
//
//  Created by 虞嘉伟 on 2017/12/2.
//  Copyright © 2017年 虞嘉伟. All rights reserved.
//

#import "MCContentCtrl.h"
#import "EnjoySectionHeader.h"
#import "MemberCenterCell.h"
#import "MemberEnjoyCell.h"
#import "MemberCenterTipsCell.h"
#import "VIPConfirmOrderViewController.h"
#import "VIPDetailViewController.h"

@interface MCContentCtrl ()
{
//    int currentPage; //当前Page
    NSArray<MemberCenterStatusModel *> *dataArray;
    NSArray <NSDictionary *> *privilegeArray; //特权数组
}
@property (nonatomic, strong) UIButton *bottomButton; //底部按钮
@end

@implementation MCContentCtrl

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.backgroundColor = [UIColor whiteColor];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    if (self.currentPage == 0) {
        privilegeArray = @[
                           @{@"icon":@"icon_gift", @"title":@"298元大礼包"},
                           @{@"icon":@"icon_discount", @"title":@"Store专享价"},
                           @{@"icon":@"icon_enquire", @"title":@"企业咨询服务"},
                           @{@"icon":@"icon_exclusive", @"title":@"会员专属标识"},
                           @{@"icon":@"icon_country", @"title":@"全国通用"},
                           ];
    } else if (self.currentPage == 1) {
        privilegeArray = @[
                           @{@"icon":@"icon_tools", @"title":@"工具使用权"},
                           @{@"icon":@"icon_box", @"title":@"储物箱租用权"},
                           @{@"icon":@"icon_workshop", @"title":@"工作坊开发权"},
                           @{@"icon":@"icon_course", @"title":@"专属课程福利"},
                           @{@"icon":@"icon_cost", @"title":@"参赛费用优惠"},
                           @{@"icon":@"icon_hobby", @"title":@"专属兴趣小组"},
                           ];
    } else {
        privilegeArray = @[
                           @{@"icon":@"¥100", @"title":@"包月租用储物箱"},
                           @{@"icon":@"¥180", @"title":@"半年租用储物箱"},
                           @{@"icon":@"¥360", @"title":@"全年租用储物箱"},
                           ];
    }
}

-(void)leftBarButtonItemAction:(UIBarButtonItem *)leftBarButtonItem {
    [self popViewController];
}
-(void)rightBarButtonItemAction:(UIBarButtonItem *)rightBarButtonItem {
    [ContactCustomerService ContactCustomerService];
}

-(void)initView {
    [super initView];
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:@"立即开通" forState:UIControlStateNormal];
    [btn jk_setBackgroundColor:[UIColor colorWithHexString:@"#222222"] forState:UIControlStateNormal];
    [btn jk_setBackgroundColor:[UIColor colorWithHexString:@"#B2B2B2"] forState:UIControlStateDisabled];
    btn.showsTouchWhenHighlighted = YES;
    [self.view addSubview:btn];
    self.bottomButton = btn;
    __weak typeof(self)weakSelf = self;
    [btn jk_addActionHandler:^(NSInteger tag) {
        if (self.currentPage<0 || self.currentPage>2) {
            NSLog(@"---会员中心的page出错了！");
        }
        VIPConfirmOrderViewController *orderCtrl = [VIPConfirmOrderViewController new];
        orderCtrl.centerType = self.currentPage+1;
        [weakSelf pushViewCtrl:orderCtrl];
    }];
}


/**
 private 修改底部按钮的状态
 
 @param state 状态值
 @param date 截止日期
 */
-(void)changeBottomButtonState:(int)state withDate:(NSString *)date {
    if (state == 0) {
        self.bottomButton.enabled = YES;
    } else {
        self.bottomButton.enabled = NO;
        [self.bottomButton setTitle:date forState:UIControlStateDisabled];
    }
}

-(void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    UIEdgeInsets insets = UIEdgeInsetsZero;
    if (@available(iOS 11.0, *)) {
        insets = self.view.safeAreaInsets;
    }
    [self.bottomButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self.view).insets(insets);
        make.height.mas_equalTo(49);
    }];
    insets.bottom = insets.bottom+49;
    [self.tableView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view).insets(insets);
    }];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return  self.currentPage == 2 ? 3 : 2;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return nil;
    } else if (section == 1) {
        EnjoySectionHeader *header = [EnjoySectionHeader EnjoySectionHeader];
        header.backgroundColor = [UIColor whiteColor];
        return header;
    } else {
        EnjoySectionHeader *header = [EnjoySectionHeader EnjoySectionFooter];
        header.backgroundColor = [UIColor whiteColor];
        return header;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return section==0 ? 0.01 : 60;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.01f;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        float sw = [UIScreen mainScreen].bounds.size.width;
        float h = 245.0/375*sw;
        return h;//245; //w:375,h:245
    } else if (indexPath.section == 1) {
        return (self.currentPage==2) ? 80 : 220;
    } else {
        return [MemberCenterTipsCell obtainRichTextHeight];
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        MemberCenterCell *cell = (MemberCenterCell *)[tableView obtainCell:[MemberCenterCell class]];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        __weak typeof(self)weakSelf = self;
        cell.buttonClickedBlock = ^(UIButton *btn) {
            NSLog(@"查看会员权益");
            VIPDetailViewController *detailCtrl = [VIPDetailViewController new];
            detailCtrl.currentPage = weakSelf.currentPage;
            [weakSelf pushViewCtrl:detailCtrl];
        };
        [cell assignmentCellWithCurrentPage:self.currentPage];
        return cell;
    }
    else if (indexPath.section == 1) {
        MemberEnjoyCell *cell = (MemberEnjoyCell *)[tableView obtainCell:[MemberEnjoyCell class]];
        [cell assignmentCellWithData:privilegeArray];
        return cell;
    } else {
        return [tableView obtainCell:[MemberCenterTipsCell class]];
    }
}

-(void)requestData {
    HttpParams *para = [HttpParams new];
    para.uri = @"/api/app/buyvip/list";
    @try {
        para.bodyParams = @{@"IdentityId":USERINFO.memberId}; //会员ID
    } @catch (NSException *error) {
        
    } @finally {
        
    }
    [Http postWithParams:para success:^(NSDictionary * _Nullable json) {
        
        if (judgeCode(json)) {
            dataArray = [MemberCenterStatusModel mj_objectArrayWithKeyValuesArray:json[@"list"]];
            //刷新数据
            [self refreshData];
        }
    } failure:^(NSError * _Nullable error) {
        NSLog(@"bbb");
    }];
}


/**
 刷新数据
 */
-(void)refreshData {
    int state = dataArray[self.currentPage].Status;
    NSString *date = [NSString stringWithFormat:@"已开通，%@到期", dataArray[self.currentPage].DeadLint];
    [self changeBottomButtonState:state withDate:date];
}

@end
