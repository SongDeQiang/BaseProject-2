//
//  LeftViewController.m
//  BaseProject
//
//  Created by songjianqiang on 15/11/14.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "LeftViewController.h"
#import "SupportCityViewMode.h"
#import "ViewController.h"
#import "SearchViewController.h"


@interface LeftViewController ()<UITableViewDelegate,UITableViewDataSource,UISearchResultsUpdating,UISearchBarDelegate>
@property (nonatomic ,strong)SupportCityViewMode *SCM;


@property (nonatomic ,strong)UISearchController *searchController;
@property (nonatomic ,strong)NSIndexPath *indexpath;
@property (nonatomic ,strong)SearchViewController *showResultVC;

@end



@implementation LeftViewController

-(instancetype)init
{
    if (self=[super init]) {
        self.title=@"各地房价";
        
    }
    return self;
}
+(NaviViewController *)navi
{
    
    static NaviViewController *navi=nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        LeftViewController *lvc=[LeftViewController new];
        navi=[[NaviViewController alloc]initWithRootViewController:lvc];
        navi.navigationBar.translucent=NO;
    });
    
    return navi;
    
}
-(SupportCityViewMode *)SCM
{
    if (!_SCM) {
        
        _SCM=[[SupportCityViewMode alloc]initWithDate:self.date];
        
      
    }
    return _SCM;
}
-(UITableView *)tableView
{
    if (!_tableView) {
        _tableView=[[UITableView alloc]initWithFrame:CGRectZero style:0];
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
        [self.view addSubview:_tableView];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
        _tableView.delegate=self;
        _tableView.dataSource=self;
        _tableView.backgroundView=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"1420510116_GtPhiwkW"]];
        _tableView.mj_header=[MJRefreshNormalHeader headerWithRefreshingBlock:^{
            [self.SCM getDataFromNetCompleteHandle:^(NSError *error) {
                [self.tableView reloadData];
                self.showResultVC=[SearchViewController new];
                self.searchController.searchResultsUpdater=self;
                
                self.searchController.searchBar.delegate=self;
                [self.tableView.mj_header endRefreshing];
                 [self.showResultVC.tableView reloadData];
            }];
        }];
        
    }
    return _tableView;
}
- (NSString *)time
{
    
    
    
    NSDate *  senddate=[NSDate date];
    
    NSDateFormatter  *dateformatter=[[NSDateFormatter alloc] init];
    
    [dateformatter setDateFormat:@"YYYYMMddHHmmss"];
    NSString *  locationString=[dateformatter stringFromDate:senddate];
    return locationString;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
self.date=[self time];
   
    [self.tableView.mj_header beginRefreshing];
    
    
    
    
    self.definesPresentationContext=YES;
    [self.searchController.searchBar sizeToFit];
    self.tableView.tableHeaderView=self.searchController.searchBar;
   
    self.searchController=[[UISearchController alloc]initWithSearchResultsController:self.showResultVC];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.SCM.rowNumber;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"Cell"];
    cell.textLabel.text=[self.SCM WithForRow][indexPath.row];
    cell.backgroundView=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"1420510115_JFAlhdBt-1"]];
    cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
   
    self.indexpath=indexPath;
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    ViewController *vc=[ViewController new];
    vc.name=[self.SCM WithForRow][indexPath.row];
    
    [self.navigationController pushViewController:vc animated:YES];
    
}
-(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    [self updateSearchResultsForSearchController:self.searchController];
}
-(void)updateSearchResultsForSearchController:(UISearchController *)searchController
{
    NSString *searchText=searchController.searchBar.text;
    NSMutableArray *resultArray=[NSMutableArray array];
    for (NSString *path in self.SCM.dataArr) {
        NSRange range= [path rangeOfString:searchText];
        if (range.length>0) {
            [resultArray addObject:path];
        }
    }
   
    self.showResultVC.bigAreaArr=resultArray;
   
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
