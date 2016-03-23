//
//  ViewController.m
//  2016-3-22-获取当前时间
//
//  Created by mac on 16/3/22.
//  Copyright © 2016年 wl. All rights reserved.
//

#import "ViewController.h"
#import <Foundation/Foundation.h>
@interface ViewController ()
{
    UILabel *lb;
    NSArray *_arrayList;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(100, 100, 100, 40);
    btn.backgroundColor = [UIColor redColor];
    [btn addTarget:self action:@selector(clickBtn2) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
     lb = [[UILabel alloc] init];
    lb.frame = CGRectMake(100, 160, 320, 40);
    lb.backgroundColor = [UIColor groupTableViewBackgroundColor];
    [self.view addSubview:lb];
    _arrayList = [[NSArray alloc] init];
}
//获取当前时间
- (void)clickBtn
{
    NSString *formateString = @"yyyy-MM-dd-HH-mm-ss";
    NSDate *date =[NSDate date];

    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:formateString];
    NSString *strDate = [formatter stringFromDate:date];
    lb.text = strDate;
//    NSCalendar
    

}
//获取当前时间和星期几
- (void)clickBtn1
{
    NSArray * arrWeek=[NSArray arrayWithObjects:@"星期日",@"星期一",@"星期二",@"星期三",@"星期四",@"星期五",@"星期六", nil];
    NSDate *date = [NSDate date];
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *comps = [[NSDateComponents alloc] init];
    NSInteger unitFlags = NSYearCalendarUnit |
    NSMonthCalendarUnit |
    NSDayCalendarUnit |
    NSWeekdayCalendarUnit |
    NSHourCalendarUnit |
    NSMinuteCalendarUnit |
    NSSecondCalendarUnit;
    comps = [calendar components:unitFlags fromDate:date];
    NSInteger week = [comps weekday];
    NSInteger year=[comps year];
    NSInteger month = [comps month];
    NSInteger day = [comps day];
    NSString *strYear=[NSString stringWithFormat:@"%ld年%ld月",(long)year,(long)month];
    NSString *strDay=[NSString stringWithFormat:@"%ld",(long)day];
    NSString *strMoun=[NSString stringWithFormat:@"%@",[arrWeek objectAtIndex:week]];
}


- (void)clickBtn2
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    unsigned unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit |  NSDayCalendarUnit;
    
    NSDateComponents *components = [calendar components:unitFlags fromDate:[NSDate date]];
    BOOL _isFlag = NO;
    NSInteger iCurYear = [components year];  //当前的年份
    NSArray *array1 = [[NSArray alloc] initWithObjects:@"1",@"3",@"5",@"7",@"8",@"10",@"12", nil];
    NSArray *array2 = [[NSArray alloc] initWithObjects:@"4",@"6",@"9",@"11", nil];
    //判断是否是瑞年
    if (iCurYear%4==0) {
        _isFlag = YES;
    }
    
    NSInteger iCurMonth = [components month];  //当前的月份
    //当月的天数
    NSInteger strDayMount = 0;
    for (NSString *str in array1) {
        if ([str integerValue] == iCurMonth) {
            strDayMount = 31;
        }
    }
    for (NSString *str in array2) {
        if ([str integerValue] == iCurMonth) {
            strDayMount = 31;
        }
    }
    if (iCurMonth ==2) {
        if (_isFlag) {
            strDayMount = 29;
        }
        else{
            strDayMount = 28;
        }
    }
    lb.text = [NSString stringWithFormat:@"%ld",strDayMount];
    
    
    
    NSInteger iCurDay = [components day];  // 当前的号数
    
    NSString  *dateStr = nil;
    NSMutableArray *arr = [NSMutableArray array];
    
    for (NSInteger i = 1; i <= strDayMount; i++) {
        dateStr  = [NSString stringWithFormat:@"%ld-%ld-%ld", (long)iCurYear, (long)iCurMonth, (long)i];
        [arr addObject:dateStr];
    }
    
    _arrayList = [arr copy];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
