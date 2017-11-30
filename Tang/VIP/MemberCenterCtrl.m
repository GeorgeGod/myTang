//
//  MemberCenterCtrl.m
//  Tang
//
//  Created by admin on 2017/11/29.
//  Copyright © 2017年 虞嘉伟. All rights reserved.
//

#import "MemberCenterCtrl.h"
#import "EnjoySectionHeader.h"
#import "MemberCenterCell.h"
#import "MemberEnjoyCell.h"
#import "VIPDetailViewController.h"

@interface MemberCenterCtrl ()

@end

@implementation MemberCenterCtrl

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"会员中心";
    self.tableView.backgroundColor = [UIColor whiteColor];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return nil;
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
    return indexPath.section==0 ? 250 : 220;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return [tableView obtainCell:[MemberCenterCell class]];
    }
    else {
        MemberEnjoyCell *cell = (MemberEnjoyCell *)[tableView obtainCell:[MemberEnjoyCell class]];
        return cell;
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [self pushViewController:[VIPDetailViewController class]];
}

@end
