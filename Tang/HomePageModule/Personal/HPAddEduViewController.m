//
//  HPAddEduViewController.m
//  Tang
//
//  Created by 虞嘉伟 on 2017/12/2.
//  Copyright © 2017年 虞嘉伟. All rights reserved.
//

#import "HPAddEduViewController.h"
#import "HPEditPersonalModel.h"
#import "HPEditDefaultCell.h"

@interface HPAddEduViewController ()
{
    NSArray<HPEditPersonalModel *> *dataArray;
}
@end

@implementation HPAddEduViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"添加教育经历";
    self.leftBarButtonItem([UIImage load:@"back_gray"]);
    self.rightBarButtonItem(@"保存");
}

-(void)initView {
    self.tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    self.tableView.backgroundColor = [UIColor whiteColor];
    self.tableView.tableFooterView = [UIView new];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}

-(void)initData {
    dataArray = @[
                  [HPEditPersonalModel EditModel:@"学校名称" detail:@"" place:@"请填写" show:NO],
                  [HPEditPersonalModel EditModel:@"专业名称" detail:@"" place:@"请填写" show:NO],
                  [HPEditPersonalModel EditModel:@"获得学位" detail:@"" place:@"请选择" show:YES],
                  [HPEditPersonalModel EditModel:@"入学时间" detail:@"" place:@"请选择" show:YES],
                  [HPEditPersonalModel EditModel:@"毕业时间" detail:@"" place:@"请选择" show:YES],
                  ];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 49;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return dataArray.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    HPEditPersonalModel *model = dataArray[indexPath.row];
    HPEditDefaultCell *cell = (HPEditDefaultCell *)[tableView obtainXibCell:[HPEditDefaultCell class]];
    
    cell.title.text = model.title;
    cell.detail.placeholder = model.placeholder;
    cell.detail.text = model.detail;
    cell.detail.enabled = !model.showArrow;
    if (model.showArrow) {
        cell.accessoryView = [[UIImageView alloc] initWithImage:[UIImage load:@"right_arrow"]];
    } else {
        cell.accessoryView = nil;
    }
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    HPEditPersonalModel *model = dataArray[indexPath.row];
    NSString *title = model.title;
    if ([title isEqualToString:@"获得学位"]) {
        
    } else if ([title isEqualToString:@"入学时间"]) {
        
    } else if ([title isEqualToString:@"毕业时间"]) {
        
    }
}

@end
