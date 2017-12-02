//
//  HPAddTagsViewController.m
//  Tang
//
//  Created by 虞嘉伟 on 2017/12/2.
//  Copyright © 2017年 虞嘉伟. All rights reserved.
//

#import "HPAddTagsViewController.h"

@interface HPAddTagsViewController ()<UITextViewDelegate>
{
    int limitWord;
}
@property (nonatomic, strong) UILabel *limitWordLabel;
@end

@implementation HPAddTagsViewController

@synthesize tagStr;

- (void)viewDidLoad {
    [super viewDidLoad];
    limitWord = 8;
    if (!tagStr) {
        tagStr = @"";
    }
    
    self.leftBarButtonItem([UIImage load:@"back_gray"]);
    self.rightBarButtonItem(@"保存");
    self.tableView.backgroundColor = [UIColor whiteColor];
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

-(void)rightBarButtonItemAction:(UIBarButtonItem *)rightBarButtonItem {
    [self saveButtonAction];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 150;
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
    tv.text = tagStr;
    self.limitWordLabel.text = [NSString stringWithFormat:@"%ld/%d", tagStr.length, limitWord];
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
    tagStr = textView.text;
    self.limitWordLabel.text = [NSString stringWithFormat:@"%ld/%d", tagStr.length, limitWord];
    NSLog(@"输入框:%@,字数:%ld", textView.text, textView.text.length);
}


/**
 保存按钮的点击事件
 */
-(void)saveButtonAction {
    if (self.inputComplete) {
        self.inputComplete(tagStr);
    }
    [self popViewController];
}


@end
