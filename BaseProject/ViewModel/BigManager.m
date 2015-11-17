//
//  BigManager.m
//  BaseProject
//
//  Created by tarena on 15/11/14.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BigManager.h"
#import "ChectOutBigArea.h"
@implementation BigManager
+(id)getBigArea:(NSString *)cityname Date:(NSString *)date completionHandle:(void (^)(id, NSError *))completionHandle
{
//    //://route.showapi.com/585-3?cityname=北京&showapi_appid=12153&showapi_timestamp=20151114140920&type=2&showapi_sign=b75352417e11470a8fbcf41dc96a8579
//    NSCalendar *calendat=[[NSCalendar alloc]initWithCalendarIdentifier:NSGregorianCalendar];
//    NSDate *now;
//    NSInteger unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSWeekdayCalendarUnit |
//    NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit;
//    NSDateComponents *comps=[[NSDateComponents alloc]init];
//    now=[NSDate date];
//    comps=[calendat components:unitFlags fromDate:now];
//    NSDateFormatter *formatter=[[NSDateFormatter alloc]init];
//    [formatter setDateFormat:@"YYYYMMddhhmmss"];
//    NSString *date=[formatter stringFromDate:[NSDate date]];
    NSString *path=[ NSString stringWithFormat:@"https://route.showapi.com/585-3?cityname=%@&showapi_appid=12153&showapi_timestamp=%@&type=2&showapi_sign=b75352417e11470a8fbcf41dc96a8579",cityname,date];
    path = [self percentPathWithPath:path params:nil];
    return [self GET: path parameters:nil  completionHandler:^(id responseObj, NSError *error) {
        completionHandle([ChectOutBigArea mj_objectWithKeyValues:responseObj],error);
        
    }];
}
@end
