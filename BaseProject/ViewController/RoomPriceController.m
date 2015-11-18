//
//  RoomPriceController.m
//  BaseProject
//
//  Created by songjianqiang on 15/11/14.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "RoomPriceController.h"
#import "RoomPriceViewModel.h"
#import "RoomPriceCell.h"
#import "FangViewController.h"
@interface RoomPriceController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (nonatomic ,strong)UICollectionView *collectionView;
@property (nonatomic ,strong)RoomPriceViewModel *RVM;
@property (nonatomic ,strong)UICollectionViewFlowLayout *flowLayout;
@end

@implementation RoomPriceController
-(RoomPriceViewModel *)RVM
{
    if (!_RVM) {
        _RVM=[[RoomPriceViewModel alloc]initWithCityarea:self.cityarea City:self.city Date:self.date];
    }
    return _RVM;
}
- (NSString *)time
{
    
    
    
    NSDate *  senddate=[NSDate date];
    
    NSDateFormatter  *dateformatter=[[NSDateFormatter alloc] init];
    
    [dateformatter setDateFormat:@"YYYYMMddHHmmss"];
    NSString *  locationString=[dateformatter stringFromDate:senddate];
    return locationString;
    
}
-(UICollectionViewFlowLayout *)flowLayout
{
    if (!_flowLayout) {
        _flowLayout=[UICollectionViewFlowLayout new];
        _flowLayout.scrollDirection=UICollectionViewScrollDirectionVertical;
    }
    return _flowLayout;
}
-(UICollectionView *)collectionView
{
    if (!_collectionView) {
        _collectionView=[[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:self.flowLayout];
        _collectionView.backgroundColor=[UIColor whiteColor];
        _collectionView.delegate=self;
        _collectionView.dataSource=self;
        [_collectionView registerClass:[RoomPriceCell class] forCellWithReuseIdentifier:@"Cell"];
        [self.view addSubview:_collectionView];
        [_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
        _collectionView.backgroundView=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"1420510115_UiRWgTyl"]];
        self.collectionView.mj_header=[MJRefreshNormalHeader headerWithRefreshingBlock:^{
            [self.RVM refreshDataCompletionHandle:^(NSError *error) {
                if (error) {
                    [self showErrorMsg:error];
                }else{
                [self.collectionView reloadData];
                    [_collectionView.mj_footer resetNoMoreData];
               
                }
                 [self.collectionView.mj_header endRefreshing];
            }];
        }];
        self.collectionView.mj_footer=[MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
           [self.RVM getMoreDataCompletionHandle:^(NSError *error) {
               if (error) {
                   [self showErrorMsg:error.localizedDescription];
               }else
               {
                  
                   [self.collectionView reloadData];
                   
               }
               [_collectionView.mj_footer endRefreshing];
           }];
        }];
       
        
    }
    return _collectionView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.date=[self time];
    [self.collectionView.mj_header beginRefreshing];
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.RVM.rowNumber;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    RoomPriceCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    
    [cell.imageView setImageWithURL:[self.RVM imageURLRorRow:indexPath.row]];
    cell.addressLabel.text=[NSString stringWithFormat:@"地址:%@%@%@",self.city,self.cityarea ,[self.RVM areadetailForRow:indexPath.row]];
    cell.priceLabel.text=[NSString stringWithFormat:@"价格:%@/平米",[self.RVM areaPriceForRow:indexPath.row]];
    cell.areaname.text=[NSString stringWithFormat:@"小区:%@",[self.RVM areaNameForRow:indexPath.row]];
    cell.priceTrend.text=[NSString stringWithFormat:@"价格走向:%@",[self.RVM priceTrendForRow:indexPath.row]];
    cell.backgroundColor=[UIColor greenSeaColor];
    
    return cell;
}
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat width=kWindowW-30;
    CGFloat height=kWindowH/2 ;
    return CGSizeMake(width, height);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(10, 10, 10, 10);
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    FangViewController *fvc=[FangViewController new];
    fvc.path=@"http://www.baidu.com";
    [self.navigationController pushViewController:fvc animated:YES];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
