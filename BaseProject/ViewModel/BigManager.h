//
//  BigManager.h
//  BaseProject
//
//  Created by tarena on 15/11/14.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseNetManager.h"

@interface BigManager : BaseNetManager
+(id)getBigArea:(NSString *)cityname Date:(NSString *)date kCompletionHandle;
@end
