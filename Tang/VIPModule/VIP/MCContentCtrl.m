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
    int currentPage; //当前Page
    NSArray<MemberCenterStatusModel *> *dataArray;
}
@property (nonatomic, strong) UIButton *bottomButton; //底部按钮
@end

@implementation MCContentCtrl

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    self.title = @"会员中心";
//    self.leftBarButtonItem([UIImage load:@"back_gray"]);
//    self.rightBarButtonItem(@"联系客服");
    self.tableView.backgroundColor = [UIColor whiteColor];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
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
        if (currentPage<0 || currentPage>2) {
            NSLog(@"---会员中心的page出错了！");
        }
        VIPConfirmOrderViewController *orderCtrl = [VIPConfirmOrderViewController new];
        orderCtrl.centerType = currentPage+1;
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
    return 3;
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
        EnjoySectionHeader *header = [EnjoySectionHeader EnjoySectionHeader];
        header.backgroundColor = [UIColor whiteColor];
        return header;
    }
}

-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    return nil;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return section==0 ? 0.01 : 60;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.01f;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return 245;
    } else if (indexPath.section == 1) {
        return 220;
    } else {
        return [MemberCenterTipsCell obtainRichTextHeight];
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        MemberCenterCell *cell = (MemberCenterCell *)[tableView obtainCell:[MemberCenterCell class]];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        __weak typeof(self)weakSelf = self;
        cell.didEndScroll = ^(int crtPage) {
            NSLog(@"current page : %d", crtPage);
            currentPage = crtPage;
            //刷新数据
            [weakSelf refreshData];
        };
        cell.buttonClickedBlock = ^(UIButton *btn) {
            NSLog(@"查看会员权益");
            [self pushViewController:[VIPDetailViewController class]];
        };
        return cell;
    }
    else if (indexPath.section == 1) {
        MemberEnjoyCell *cell = (MemberEnjoyCell *)[tableView obtainCell:[MemberEnjoyCell class]];
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
    int state = dataArray[currentPage].Status;
    NSString *date = [NSString stringWithFormat:@"已开通，%@到期", dataArray[currentPage].DeadLint];
    [self changeBottomButtonState:state withDate:date];
}

@end
