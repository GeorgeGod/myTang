//
//  MemberEnjoyCell.m
//  Tang
//
//  Created by admin on 2017/11/30.
//  Copyright © 2017年 虞嘉伟. All rights reserved.
//

#import "MemberEnjoyCell.h"
#import <Masonry.h>
#import "UIFont+Extension.h"
#import "UIColor+Extension.h"
#import "UIImage+Path.h"

@interface MemberEnjoyCell()
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) NSArray< NSDictionary *> *dataArray;
@end
@implementation MemberEnjoyCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(nullable NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self initView];
    }
    return self;
}

-(void)assignmentCellWithData:(NSArray *)dataArray {
    self.dataArray = dataArray;
    [self.collectionView reloadData];
}

- (void)initView {
    float itemW = ([UIScreen mainScreen].bounds.size.width-14)/3.0;
    float itemH = itemW-20;
    UICollectionViewFlowLayout *flowLayout = [UICollectionViewFlowLayout new];
    flowLayout.itemSize = CGSizeMake(itemW, itemH);
    flowLayout.minimumLineSpacing = 0;
    flowLayout.minimumInteritemSpacing = 0;
    flowLayout.sectionInset = UIEdgeInsetsMake(0, 7, 0, 7);
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    self.collectionView.backgroundColor = [UIColor whiteColor];
    [self.collectionView registerClass:[MemberEnjoyCollectionCell class] forCellWithReuseIdentifier:@"MemberEnjoyCollectionCell"];
    [self.contentView addSubview:self.collectionView];
    
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.contentView);
    }];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {

    MemberEnjoyCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"MemberEnjoyCollectionCell" forIndexPath:indexPath];

    NSDictionary *data = nil;
    @try {
        data = self.dataArray[indexPath.row];
    } @catch (NSException *exception) {

    } @finally {
        [cell assignmentCellWithData:data];
    }
    return cell;
}


@end





//privite
@implementation MemberEnjoyCollectionCell
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self initView];
    }
    return self;
}

- (void)initView {
    //创建icon
    self.icon = [UIImageView new];
    self.icon.contentMode = UIViewContentModeScaleAspectFit;
    [self.contentView addSubview:self.icon];

    self.price = [UILabel new];
    self.price.textAlignment = NSTextAlignmentCenter;
    self.price.font = [UIFont MediumFont:30];
    self.price.textColor = [UIColor colorWithHexString:@"#8B909F"];
    self.price.hidden = YES;
    [self.contentView addSubview:self.price];
    
    //创建标题
    self.title = [UILabel new];
    self.title.textAlignment = NSTextAlignmentCenter;
    self.title.textColor = [UIColor colorWithHexString:@"#666666"];
    self.title.font = [UIFont LightFont:12];
    [self.contentView addSubview:self.title];

    //布局
    [self.icon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(33, 36));
        make.centerX.equalTo(self.contentView);
        make.top.mas_equalTo(20);
    }];
    [self.price mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(8);
        make.centerX.equalTo(self.contentView);
    }];
    [self.title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.icon.mas_bottom).offset(12);
        make.centerX.equalTo(self.contentView);
    }];
}

-(void)assignmentCellWithData:(NSDictionary *)data {
    if ([data objectForKey:@"icon"] && [data objectForKey:@"title"]) {
        if ([data[@"icon"] rangeOfString:@"¥"].location != NSNotFound) {
            self.price.hidden = NO;
            self.price.text = data[@"icon"];
            self.title.text = data[@"title"];
        } else {
            self.icon.image = [UIImage load:data[@"icon"]];
            self.title.text = data[@"title"];
        }
    }
}
@end
