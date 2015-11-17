//
//  BigAreaViewMode.h
//  BaseProject
//
//  Created by tarena on 15/11/14.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"

@interface BigAreaViewMode : BaseViewModel
-(instancetype)initWith:(NSString *)date Name:(NSString *)name;
@property (nonatomic)NSInteger rowNumeber;
-(NSArray *)AreaForRow;
@property (nonatomic,strong)NSString *date;
@property (nonatomic,strong)NSString *name;
@end
