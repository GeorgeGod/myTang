//
//  VIPDetailViewController.m
//  Tang
//
//  Created by admin on 2017/11/29.
//  Copyright © 2017年 虞嘉伟. All rights reserved.
//

#import "VIPDetailViewController.h"

#import "VIPDetailPriceCell.h"
#import "VIPDetailGiftBagCell.h"
#import "VIPDetailDiscountCell.h"
#import "VIPDetailTipsCell.h"

@interface VIPDetailViewController ()


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

-(void)leftBarButtonItemAction:(UIBarButtonItem *)leftBarButtonItem {
    [self popViewController];
}

-(void)rightBarButtonItemAction:(UIBarButtonItem *)rightBarButtonItem {
    [ContactCustomerService ContactCustomerService];
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0.01;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 49;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        return 49;
    } else if (indexPath.row == 1) {
        return 179;
    } else if (indexPath.row == 2 || indexPath.row == 3 || indexPath.row == 4) {
        return 94;
    } else if (indexPath.row == 5 || indexPath.row == 6) {
        return 110;
    } else {
        return 0;
    }
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 7;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        
    }
    
    if (indexPath.row == 6) {
        VIPDetailTipsCell *cell = [tableView dequeueReusableCellWithIdentifier:@"VIPDetailTipsCell"];
        if (!cell) {
            cell = [[VIPDetailTipsCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"VIPDetailTipsCell"];
        }
        return cell;
    }
}



@end
