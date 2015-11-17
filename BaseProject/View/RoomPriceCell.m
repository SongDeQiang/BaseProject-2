//
//  RoomPriceCell.m
//  BaseProject
//
//  Created by songjianqiang on 15/11/15.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "RoomPriceCell.h"

@implementation RoomPriceCell
- (UIImageView *)imageView {
    if(_imageView == nil) {
        _imageView = [[UIImageView alloc] init];
        [self.contentView addSubview:_imageView];
        [_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.top.mas_equalTo(0);
            make.bottom.mas_equalTo(-50);
        }];
    }
    return _imageView;
}
- (UILabel *)priceLabel {
    if(_priceLabel == nil) {
        _priceLabel = [[UILabel alloc] init];
        [self.contentView addSubview:_priceLabel];
        [_priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
           make.top.mas_equalTo(self.addressLabel.mas_bottom).mas_equalTo(3);
            make.left.mas_equalTo(self.mas_left).mas_equalTo(0);
        }];
        _priceLabel.font=[UIFont systemFontOfSize:12.0];
    }
    return _priceLabel;
}

-(UILabel *)priceTrend
{
    if (!_priceTrend) {
        _priceTrend=[UILabel new];
        [self.contentView addSubview:_priceTrend];
        [_priceTrend mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.addressLabel.mas_bottom).mas_equalTo(3);
            make.right.mas_equalTo(self.mas_right).mas_equalTo(0);
        }];
        _priceTrend.font=[UIFont systemFontOfSize:12.0];
    }
    return _priceTrend;
}
-(UILabel *)areaname
{
    if (!_areaname) {
        _areaname=[UILabel new];
        [self.contentView addSubview:_areaname];
        [_areaname mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.imageView.mas_bottom).mas_equalTo(0);
            make.width.mas_equalTo(100);
            make.right.mas_equalTo(self.mas_right).mas_equalTo(0);
        }];
        _areaname.font=[UIFont systemFontOfSize:12.0];
        _areaname.textAlignment=UITextAlignmentRight;
    }
    return _areaname;
}
- (UILabel *)addressLabel {
    if(_addressLabel == nil) {
        _addressLabel = [[UILabel alloc] init];
        [self.contentView addSubview:_addressLabel];
        [_addressLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.imageView.mas_bottom).mas_equalTo(0);
            make.right.mas_equalTo(self.areaname.mas_left).mas_equalTo(5);
            make.left.mas_equalTo(self.mas_left).mas_equalTo(0);
            _addressLabel.font=[UIFont systemFontOfSize:11.0];
            _addressLabel.numberOfLines=0;
        }];
    }
    return _addressLabel;
}

@end
