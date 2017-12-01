//
//  HomePageCtrl.m
//  Tang
//
//  Created by admin on 2017/12/1.
//  Copyright © 2017年 虞嘉伟. All rights reserved.
//

#import "HomePageCtrl.h"
#import "PersonalHeadCell.h"
#import "HPPersonalEmptyCell.h"
#import "HPPersonalProjectCell.h"
#import "HPPersonalEduCell.h"
#import "HPPersonalHeadView.h"

#import "HPEditPersonalViewController.h"
@interface HomePageCtrl ()

@end

@implementation HomePageCtrl

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"";
    self.leftBarButtonItem([UIImage load:@"back_gray"]);
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.backgroundColor = [UIColor whiteColor];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 4;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 1;
    } else {
        return 1;
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSInteger section = indexPath.section;
    if (section == 0) {
        return 220;
    } else {
        //empty cell return 60;
        //normal cell return cal
        if (section == 1) {
            return 70;
        } else if (section == 2) {
            return 67;
        }
        return 60; //105;
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return 0.01;
    } else {
        return 44;
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return section==3 ? 0.01 : 8;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return nil;
    } else {
        NSString *btnTitle = @"";
        if (section == 1) {
            btnTitle = @"项目";
        } else if (section == 2) {
            btnTitle = @"教育";
        } else {
            btnTitle = @"标签";
        }
        HPPersonalHeadView* headView = [HPPersonalHeadView HeadViewTag:100+section withButtonTitle:btnTitle];
        [headView.button addTarget:self action:@selector(editButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        return headView;
    }
}
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    UIView *footView = [UIView new];
    footView.backgroundColor = [UIColor colorWithHexString:@"#F6F6F6"];
    return footView;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSInteger section = indexPath.section;
    if (section == 0) {
        PersonalHeadCell *cell = (PersonalHeadCell *)[tableView obtainXibCell:[PersonalHeadCell class]];
        __weak typeof(self)weakSelf = self;
        [cell.editInformationBtn jk_addActionHandler:^(NSInteger tag) {
            [weakSelf pushViewCtrl:[HPEditPersonalViewController new]];
        }];
        return cell;
    } else {
        if (section == 1) {
            HPPersonalProjectCell *cell = (HPPersonalProjectCell *)[tableView obtainXibCell:[HPPersonalProjectCell class]];
            return cell;
        } else if (section == 2) {
            HPPersonalEduCell *cell = (HPPersonalEduCell *)[tableView obtainXibCell:[HPPersonalEduCell class]];
            return cell;
        }
        HPPersonalEmptyCell *cell = (HPPersonalEmptyCell *)[tableView obtainCell:[HPPersonalEmptyCell class]];
        [cell assignmentCellWithSection:section];
        return cell;
    }
}

//编辑按钮的点击事件
-(void)editButtonAction:(UIButton *)sender {
    if (sender.tag == 102) {
        //编辑教育
        
    } else {
        //编辑标签
        
    }
}

@end
