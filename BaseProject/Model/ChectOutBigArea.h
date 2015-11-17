//
//  ChectOutBigArea.h
//  BaseProject
//
//  Created by tarena on 15/11/14.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseModel.h"


@class ChectOutBigAreaShowModel;
@interface ChectOutBigArea : BaseModel

@property (nonatomic, strong) ChectOutBigAreaShowModel *showapi_res_body;

@property (nonatomic, copy) NSString *showapi_res_error;

@property (nonatomic, assign) NSInteger showapi_res_code;

@end

@interface ChectOutBigAreaShowModel : NSObject

@property (nonatomic, assign) NSInteger allnum;

@property (nonatomic, copy) NSString *ret_code;

@property (nonatomic, copy) NSString *city;

@property (nonatomic, strong) NSArray<NSString *> *contents;

@property (nonatomic, copy) NSString *errormsg;

@end

