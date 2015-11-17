//
//  SupportCityManager.m
//  BaseProject
//
//  Created by tarena on 15/11/14.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "SupportCityManager.h"
#import "SupportCity.h"
//route.showapi.com/585-2?showapi_appid=12153&showapi_timestamp=20151114162859&showapi_sign=b75352417e11470a8fbcf41dc96a8579
@implementation SupportCityManager
+(id)getDate:(NSString *)date completionHandle:(void (^)(id, NSError *))completionHandle
{
    NSString *path=[NSString stringWithFormat:@"https://route.showapi.com/585-2?showapi_appid=12153&showapi_timestamp=%@&showapi_sign=b75352417e11470a8fbcf41dc96a8579",date];
    return [self GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
        completionHandle([SupportCity mj_objectWithKeyValues:responseObj],error);
    }];
}
@end
