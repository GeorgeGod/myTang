//
//  HPEditJobViewController.m
//  Tang
//
//  Created by 虞嘉伟 on 2017/12/1.
//  Copyright © 2017年 虞嘉伟. All rights reserved.
//

#import "HPEditJobViewController.h"

@interface HPEditJobViewController ()<UITextViewDelegate>
{
    int limitWord;
}
@property (nonatomic, strong) UILabel *limitWordLabel;
@end

@implementation HPEditJobViewController
@synthesize jobStr;

- (void)viewDidLoad {
    [super viewDidLoad];
    limitWord = 20;
    if (!jobStr) {
        jobStr = @"";
    }
    
    self.leftBarButtonItem([UIImage load:@"back_gray"]);
    self.tableView.backgroundColor = [UIColor whiteColor];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}

-(void)initView {
    [super initView];
    UIView *line = [UIView new];
    line.backgroundColor = [UIColor colorWithHexString:@"#e5e5e5"];
    [self.view addSubview:line];
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(self.tableView);
        make.height.mas_equalTo(0.5);
    }];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 150;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 88;
}
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    UIView *footView = [UIView new];
    footView.backgroundColor = [UIColor whiteColor];
    UIButton *saveBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [saveBtn setTitle:@"保存" forState:UIControlStateNormal];
    [saveBtn jk_setBackgroundColor:[UIColor colorWithHexString:@"#222222"] forState:UIControlStateNormal];
    [saveBtn addTarget:self action:@selector(saveButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [footView addSubview:saveBtn];
    [saveBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(footView).insets(UIEdgeInsetsMake(20, 20, 20, 20));
    }];
    return footView;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UITableViewCell"];
        
        //创建textview
        UITextView *tv = [UITextView new];
        tv.tag = 100;
        tv.delegate = self;
        tv.textColor = [UIColor colorWithHexString:@"#222222"];
        tv.font = [UIFont lightFont:15];
        [cell.contentView addSubview:tv];
        
        //创建label
        UILabel *lab = [UILabel new];
        lab.textColor = [UIColor colorWithHexString:@"#999999"];
        lab.font = [UIFont lightFont:12];
        self.limitWordLabel = lab;
        [cell.contentView addSubview:lab];
        
        //布局
        [tv mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(cell.contentView).insets(UIEdgeInsetsMake(10, 20, 0, 20));
        }];
        [lab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.bottom.equalTo(tv);
        }];
    }
    UITextView *tv = [cell.contentView viewWithTag:100];
    tv.text = jobStr;
    self.limitWordLabel.text = [NSString stringWithFormat:@"%ld/%d", jobStr.length, limitWord];
    return cell;
}


- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    if (text.length == 0) {
        return true;
    } else {
        NSUInteger len = textView.text.length;
        if (text.length > limitWord-len) {
            //text的长度超过了剩余可输入的长度
            text = [text substringToIndex:limitWord-len];
            textView.text = [NSString stringWithFormat:@"%@%@", textView.text, text];
            return false;
        }
        return true;
    }
}
- (void)textViewDidChange:(UITextView *)textView {
    //观察输入的情况
    jobStr = textView.text;
    self.limitWordLabel.text = [NSString stringWithFormat:@"%ld/%d", jobStr.length, limitWord];
    NSLog(@"输入框:%@,字数:%ld", textView.text, textView.text.length);
}


/**
 保存按钮的点击事件
 */
-(void)saveButtonAction {
    if (self.inputComplete) {
        self.inputComplete(jobStr);
    }
    [self popViewController];
}

@end
