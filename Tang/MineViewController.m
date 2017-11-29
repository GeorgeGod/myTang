//
//  MineViewController.m
//  Tang
//
//  Created by 虞嘉伟 on 2017/11/28.
//  Copyright © 2017年 虞嘉伟. All rights reserved.
//

#import "MineViewController.h"
#import "MineModel.h"

#import "MineHeadTableViewCell.h"
#import "MineClassifyTableViewCell.h"
#import "MineNormalTableViewCell.h"

#import "MemberCenterCtrl.h"
@interface MineViewController ()<UITableViewDelegate, UITableViewDataSource>

//是否登陆状态
@property (nonatomic, assign) BOOL isLogin;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray<NSArray *> *dataArray;
@end

@implementation MineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"我的";
    self.leftBarButtonItem([UIImage load:@"news_no"]);
    self.rightBarButtonItem([UIImage load:@"news_yes"]);
    self.isLogin = YES;
    
}

//override
-(void)initView {
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
}

-(void)initData {
    
    NSMutableArray *sec1Array = [NSMutableArray array];
    MineHeadModel *model1 = [MineHeadModel MineModel];
    [sec1Array addObject:model1];
    
    MineClassifyModel *model2 = [MineClassifyModel MineClassifyModel:@"" withTitle:@"办公"];
    MineClassifyModel *model3 = [MineClassifyModel MineClassifyModel:@"" withTitle:@"订单"];
    MineClassifyModel *model4 = [MineClassifyModel MineClassifyModel:@"" withTitle:@"好友"];
    MineClassifyModel *model5 = [MineClassifyModel MineClassifyModel:@"" withTitle:@"收藏"];
    [sec1Array addObject:@[model2, model3, model4, model5]];
    
    
    NSArray *sec2Array = @[
                           [MineModel MineModel:@"我的预约"],
                           [MineModel MineModel:@"我的动态"],
                           [MineModel MineModel:@"我的活动"],
                           [MineModel MineModel:@"我的发布"],
                           [MineModel MineModel:@"钱包"],
                           [MineModel MineModel:@"优惠券"],
                           [MineModel MineModel:@"邀请码"],
                           ];
    self.dataArray = @[sec1Array, sec2Array];
}



- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
        if (indexPath.section == 0) {
            if (indexPath.row == 0) {
                
                MineHeadTableViewCell *cell= [tableView dequeueReusableCellWithIdentifier:@"MineHeadTableViewCell"];
                if (!cell) {
                    cell = [[[NSBundle mainBundle]loadNibNamed:@"MineHeadTableViewCell" owner:nil options:nil] firstObject];
                }
                cell.islogin = _isLogin;
                return cell;
            }
            else {
                MineClassifyTableViewCell *cell= [tableView dequeueReusableCellWithIdentifier:@"MineClassifyTableViewCell"];
                if (!cell) {
                    cell = [[[NSBundle mainBundle]loadNibNamed:@"MineClassifyTableViewCell" owner:nil options:nil] firstObject];
                }
                return cell;
            }
        }
        else {
            MineNormalTableViewCell *cell= [tableView dequeueReusableCellWithIdentifier:@"MineNormalTableViewCell"];
            if (!cell) {
                cell = [[MineNormalTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"MineNormalTableViewCell"];
            }
            
            MineModel *model = nil;
            @try {
                model = self.dataArray[indexPath.section][indexPath.row];
            } @catch (NSException *exception) {
                
            } @finally {
                cell.textLabel.text = model.title;
            }
            return cell;
        }
//    }
//    else {
        UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UITableViewCell"];
        return cell;
//    }
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray[section].count;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.dataArray.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            return 70;
        }
        else {
            return 92;
        }
    }
    return 49;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self pushViewController:[MemberCenterCtrl class]];
}

@end
