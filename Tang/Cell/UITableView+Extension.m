//
//  UITableView+Extension.m
//  Tang
//
//  Created by 虞嘉伟 on 2017/11/29.
//  Copyright © 2017年 虞嘉伟. All rights reserved.
//

#import "UITableView+Extension.h"

@implementation UITableView (Extension)

-(UITableViewCell *)obtainCell:(Class)clazz {
    UITableViewCell *cell = [self dequeueReusableCellWithIdentifier:NSStringFromClass(clazz)];
    if (!cell) {
        cell = [[clazz alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:NSStringFromClass(clazz)];
    }
    return cell;
}
-(UITableViewCell *)obtainXibCell:(Class)clazz {
    UITableViewCell *cell= [self dequeueReusableCellWithIdentifier:NSStringFromClass(clazz)];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(clazz) owner:nil options:nil] firstObject];
    }
    return cell;
}
@end
