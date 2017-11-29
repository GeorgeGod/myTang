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

@interface MemberCenterCtrl ()

@end

@implementation MemberCenterCtrl

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"会员中心";
    
    [self.tableView registerClass:[MemberCenterCell class] forCellReuseIdentifier:@"MemberCenterCell"];
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
        return [EnjoySectionHeader EnjoySectionHeader];
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return section==0 ? 0.01 : 60;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return indexPath.section==0 ? 250 : 220;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        MemberCenterCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MemberCenterCell"];
        return cell;
    }
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UITableViewCell"];
    return cell;
}

@end
