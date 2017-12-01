//
//  HomePageCtrl.m
//  Tang
//
//  Created by admin on 2017/12/1.
//  Copyright © 2017年 虞嘉伟. All rights reserved.
//

#import "HomePageCtrl.h"
#import "PersonalHeadCell.h"

@interface HomePageCtrl ()

@end

@implementation HomePageCtrl

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"";
    self.leftBarButtonItem([UIImage load:@"back_gray"]);
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 4;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 1;
    } else {
        return 0;
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSInteger section = indexPath.section;
    if (section == 0) {
        return 220;
    } else {
        return 105;
    }
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        PersonalHeadCell *cell = (PersonalHeadCell *)[tableView obtainXibCell:[PersonalHeadCell class]];
        return cell;
    } else {
        return nil;
    }
}


@end
