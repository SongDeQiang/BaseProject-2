//
//  Support.h
//  BaseProject
//
//  Created by tarena on 15/11/14.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseModel.h"

@class SupportCityShow;
@interface SupportCity : BaseModel

@property (nonatomic, strong) SupportCityShow *showapi_res_body;

@property (nonatomic, copy) NSString *showapi_res_error;

@property (nonatomic, assign) NSInteger showapi_res_code;


@end
@interface SupportCityShow : NSObject

@property (nonatomic, copy) NSString *errormsg;

@property (nonatomic, copy) NSString *ret_code;

@property (nonatomic, strong) NSArray<NSString *> *contents;

@end

