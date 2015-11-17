//
//  SupportCityManager.h
//  BaseProject
//
//  Created by tarena on 15/11/14.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseNetManager.h"

@interface SupportCityManager : BaseNetManager
+(id)getDate:(NSString *)date  completionHandle:(void(^)(id model, NSError *error))completionHandle;



@end
