//
//  HPEditPersonalModel.m
//  Tang
//
//  Created by 虞嘉伟 on 2017/12/1.
//  Copyright © 2017年 虞嘉伟. All rights reserved.
//

#import "HPEditPersonalModel.h"

@implementation HPEditPersonalModel
+(instancetype)EditModel:(NSString *)title detail:(NSString *)detail place:(NSString *)placeholder show:(BOOL)show {
    HPEditPersonalModel *model = [HPEditPersonalModel new];
    model.title = title;
    model.detail = detail;
    model.placeholder = placeholder;
    model.showArrow = show;
    return model;
}

//根据生日计算年龄
-(NSString *)calculateAge:(NSString *)birth {
    
    if (!birth) {
        birth = @"2016-10-30";
    }
    NSCalendar *calendar = [NSCalendar currentCalendar];//定义一个NSCalendar对象
    
    NSDate *nowDate = [NSDate date];
    
    
    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    //生日
    NSDate *birthDay = [dateFormatter dateFromString:birth];
    
    //用来得到详细的时差
    unsigned int unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    NSDateComponents *date = [calendar components:unitFlags fromDate:birthDay toDate:nowDate options:0];
    
    
    if ([date year] > 0) {
        return [NSString stringWithFormat:@"%ld岁", [date year]];
    } else {
        return @"0岁";
    }
    
//    if([date year] >0){
//        NSLog(@"%@",[NSString stringWithFormat:(@"%ld岁%ld月%ld天"),(long)[date year],(long)[date month],(long)[date day]]) ;
//    }else if([date month] >0){
//        NSLog(@"%@",[NSString stringWithFormat:(@"%ld月%ld天"),(long)[date month],(long)[date day]]);
//    }else if([date day]>0){
//        NSLog(@"%@",[NSString stringWithFormat:(@"%ld天"),(long)[date day]]);
//    }else {
//        NSLog(@"0天");
//    }
}


- (NSString *)getConstellationWithMonth:(int)m_ day:(int)d_ {
    NSString * astroString = @"摩羯座水瓶座双鱼座白羊座金牛座双子座巨蟹座狮子座处女座天秤座天蝎座射手座摩羯座";
    NSString * astroFormat = @"102123444543";
    NSString * result;
    
    result = [NSString stringWithFormat:@"%@",[astroString substringWithRange:NSMakeRange(m_*3-(d_ < [[astroFormat substringWithRange:NSMakeRange((m_-1), 1)] intValue] - (-19))*3, 3)]];
    
    return result;
}

@end
