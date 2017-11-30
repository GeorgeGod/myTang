//
//  MemberEnjoyCell.m
//  Tang
//
//  Created by admin on 2017/11/30.
//  Copyright © 2017年 虞嘉伟. All rights reserved.
//

#import "MemberEnjoyCell.h"
@interface MemberEnjoyCell()
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) NSArray< NSDictionary *> *dataArray;
@end
@implementation MemberEnjoyCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(nullable NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self initData];
        [self initView];
    }
    return self;
}

- (void)initData {

    self.dataArray = @[
            @{@"icon":@"icon_tools", @"title":@"工具使用权"},
            @{@"icon":@"icon_box", @"title":@"储物箱租用权"},
            @{@"icon":@"icon_workshop", @"title":@"工作坊开发权"},
            @{@"icon":@"icon_course", @"title":@"专属课程福利"},
            @{@"icon":@"icon_cost", @"title":@"参赛费用优惠"},
            @{@"icon":@"icon_hobby", @"title":@"专属兴趣小组"},
    ];
}

- (void)initView {
    float itemW = (self.contentView.width-14)/3.0;
    float itemH = itemW-20;
    UICollectionViewFlowLayout *flowLayout = [UICollectionViewFlowLayout new];
    flowLayout.itemSize = CGSizeMake(itemW, itemH);
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

    //创建标题
    self.title = [UILabel new];
    self.title.textAlignment = NSTextAlignmentCenter;
    self.title.textColor = [UIColor colorWithHexString:@"#666666"];
    self.title.font = [UIFont font:12];
    [self.contentView addSubview:self.title];

    //布局
    [self.icon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(33, 36));
        make.centerX.equalTo(self.contentView);
        make.top.mas_equalTo(20);
    }];
    [self.title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.icon.mas_bottom).offset(12);
        make.centerX.equalTo(self.contentView);
    }];
}

-(void)assignmentCellWithData:(NSDictionary *)data {
    if ([data objectForKey:@"icon"] && [data objectForKey:@"title"]) {
        self.icon.image = [UIImage load:data[@"icon"]];
        self.title.text = data[@"title"];
    }
}
@end
