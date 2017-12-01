//
//  HPEditPersonalViewController.m
//  Tang
//
//  Created by 虞嘉伟 on 2017/12/1.
//  Copyright © 2017年 虞嘉伟. All rights reserved.
//

#import "HPEditPersonalViewController.h"
#import "HPEditPersonalModel.h"
#import "HPEditPortraitCell.h"
#import "HPEditDefaultCell.h"

#import "HPEditJobViewController.h"
@interface HPEditPersonalViewController ()
{
    NSArray<NSArray *> *dataArray;
    BOOL isSaved; //是否已经保存
}
@end

@implementation HPEditPersonalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"编辑个人资料";
    self.leftBarButtonItem([UIImage load:@"back_gray"]);
    self.tableView.backgroundColor = [UIColor whiteColor];
}

-(void)leftBarButtonItemAction:(UIBarButtonItem *)leftBarButtonItem {
    if (!isSaved) {
        [self alertSavePersonalInfoTips];
    } else {
        [self popViewController];
    }
}

-(void)initData {
    dataArray = @[@[[HPEditPersonalModel EditModel:@"个人头像" detail:@"" place:@"" show:NO]], @[
                      [HPEditPersonalModel EditModel:@"真实姓名" detail:@"小颖" place:@"请输入" show:NO],
                      [HPEditPersonalModel EditModel:@"性别" detail:@"" place:@"请输入" show:YES],
                      [HPEditPersonalModel EditModel:@"公司职位" detail:@"用户体验设计师" place:@"请选择" show:YES],
                      [HPEditPersonalModel EditModel:@"生日" detail:@"" place:@"请选择" show:YES],
                      [HPEditPersonalModel EditModel:@"年龄" detail:@"" place:@"填写生日后自动显示" show:NO],
                      [HPEditPersonalModel EditModel:@"星座" detail:@"" place:@"填写生日后自动显示" show:NO],
                      ]];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return dataArray.count;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return dataArray[section].count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return section==0 ? 0.01 : 8;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return indexPath.section==0 ? 80 : 49;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *headView = [UIView new];
    headView.backgroundColor = [UIColor colorWithHexString:@"#F6F6F6"];
    return headView;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    HPEditPersonalModel *model = dataArray[indexPath.section][indexPath.row];
    if (indexPath.section == 0) {
        HPEditPortraitCell *cell = (HPEditPortraitCell *)[tableView obtainXibCell:[HPEditPortraitCell class]];
        if (model.detail.length == 0) {
            cell.portrail.image = [UIImage load:@"portrait"];
        } else {
//            cell.portrail sdsetimage;
        }
        return cell;
    } else {
        HPEditDefaultCell *cell = (HPEditDefaultCell *)[tableView obtainXibCell:[HPEditDefaultCell class]];
        cell.title.text = model.title;
        cell.detail.text = model.detail;
        cell.detail.placeholder = model.placeholder;
        if (model.showArrow) {
            cell.accessoryView = [[UIImageView alloc] initWithImage:[UIImage load:@"right_arrow"]];
        } else {
            cell.accessoryView = nil;
        }
        return cell;
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    HPEditPersonalModel *model = dataArray[indexPath.section][indexPath.row];
    NSString *title = model.title;
    if ([title isEqualToString:@"个人头像"]) {
        //选择头像
        
    } else if ([title isEqualToString:@"性别"]) {
        
    } else if ([title isEqualToString:@"公司职位"]) {
        HPEditJobViewController *jobCtrl = [HPEditJobViewController new];
        jobCtrl.title = @"公司职位";
        jobCtrl.jobStr = model.detail;
        jobCtrl.inputComplete = ^(NSString * _Nullable inputStr) {
            model.detail = inputStr;
            [self.tableView reloadData];
        };
        [self pushViewCtrl:jobCtrl];
        
    } else if ([title isEqualToString:@"生日"]) {
        
    }
}

/**
 弹出保存用户信息的弹框
 */
-(void)alertSavePersonalInfoTips {
//    UIAlertController
}

@end
