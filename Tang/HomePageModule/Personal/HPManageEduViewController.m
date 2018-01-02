//
//  HPManageEduViewController.m
//  Tang
//
//  Created by 虞嘉伟 on 2017/12/2.
//  Copyright © 2017年 虞嘉伟. All rights reserved.
//

#import "HPManageEduViewController.h"
#import "UIImage+Path.h"
#import "UIColor+Extension.h"
#import "UIView+Extension.h"
#import <Masonry.h>
#import "UITableView+Extension.h"
#import <JKCategories/JKCategories.h>
#import "HPEditPersonalModel.h"
#import "HPEditDefaultCell.h"

#import "HPAddEduViewController.h"
@interface HPManageEduViewController ()
{
    NSMutableArray<NSArray <HPEditPersonalModel *> *> *dataArray;
}
@end

@implementation HPManageEduViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"教育经历";
    self.leftBarButtonItem([UIImage load:@"back_gray"]);
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}
-(void)initData {
    NSArray *arr = @[
                  @[[HPEditPersonalModel EditModel:@"湖南大学" detail:@"本科" place:@"" show:NO]],
                  @[[HPEditPersonalModel EditModel:@"英国邓迪大学" detail:@"硕士" place:@"" show:NO]],
                  ];
    dataArray = [NSMutableArray arrayWithArray:arr];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return dataArray.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return section == 0 ? 0.01 : 8;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 49;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *headView = [UIView new];
    headView.backgroundColor = [UIColor colorWithHexString:@"#F6F6F6"];
    return headView;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    HPEditPersonalModel *model = dataArray[indexPath.section][indexPath.row];
    HPEditDefaultCell *cell = (HPEditDefaultCell *)[tableView obtainXibCell:[HPEditDefaultCell class]];
    
    cell.title.text = model.title;
    cell.detail.text = model.detail;
    
    return cell;
}

//override
/**
 设置tableView的tableFooterView
 
 @param tableView tableView
 @return view及其子类对象
 */
-(UIView *)tableFootView:(UITableView *)tableView {
    UIView *tableFootView = [UIView new];
    tableFootView.height = 84;
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:@"添加教育经历" forState:UIControlStateNormal];
    [btn jk_setBackgroundColor:[UIColor colorWithHexString:@"#222222"] forState:UIControlStateNormal];
    btn.showsTouchWhenHighlighted = YES;
    [tableFootView addSubview:btn];
    __weak typeof(self) weakSelf = self;
    [btn jk_addActionHandler:^(NSInteger tag) {
        //添加教育经历
        HPAddEduViewController *addCtrl = [HPAddEduViewController new];
        [weakSelf pushViewCtrl:addCtrl];
    }];
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(tableFootView).insets(UIEdgeInsetsMake(20, 20, 20, 20));
    }];
    return tableFootView;
}


#pragma mark --侧滑删除功能
//先要设Cell可编辑
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

//定义编辑样式
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewCellEditingStyleDelete;
}

//修改编辑按钮文字
- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath {
    return @"删除";
}

- (NSArray *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath {
    // 添加一个删除按钮
    UITableViewRowAction *deleteRowAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDestructive title:@"删除"handler:^(UITableViewRowAction *action, NSIndexPath *indexPath) {
        NSLog(@"点击了删除");
        //在这里实现删除操作
        NSInteger deleteRow = indexPath.section;
        //删除数据，和删除动画
        [dataArray removeObjectAtIndex:deleteRow];
        [tableView deleteSections:[NSIndexSet indexSetWithIndex:deleteRow] withRowAnimation:UITableViewRowAnimationTop];
    }];
    deleteRowAction.backgroundColor = [UIColor colorWithHexString:@"#222222"];
    // 将设置好的按钮放到数组中返回
    return @[deleteRowAction];
    
}

//设置进入编辑状态时，Cell不会缩进
- (BOOL)tableView: (UITableView *)tableView shouldIndentWhileEditingRowAtIndexPath:(NSIndexPath *)indexPath {
    return NO;
}

//点击删除
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    //在这里实现删除操作
    NSInteger deleteRow = indexPath.section;
    //删除数据，和删除动画
    [dataArray removeObjectAtIndex:deleteRow];
    [tableView deleteSections:[NSIndexSet indexSetWithIndex:deleteRow] withRowAnimation:UITableViewRowAnimationTop];
}

@end
