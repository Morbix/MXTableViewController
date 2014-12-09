//
//  FPStaticTableViewController.m
//  FinancasPessoais
//
//  Created by Henrique Morbin on 23/11/14.
//  Copyright (c) 2014 Moolab. All rights reserved.
//

#import "FPStaticTableViewController.h"
#import "FPBaseTableView.h"

@interface FPStaticTableViewController ()
{
    FPBaseTableView *baseTableView;
}
@end

@implementation FPStaticTableViewController

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        
    }
    return self;
}

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    //arrayRows = [NSMutableArray new];
    //[arrayRows addObject:[NSMutableArray new]];
    baseTableView = [[FPBaseTableView alloc] init];
    
    
    [self configBarButtons];
    
    [self.navigationController.navigationBar setTranslucent:NO];
}


#pragma mark - Métodos
- (void)configBarButtons
{
    barButtonAdd     = [[UIBarButtonItem alloc]
                        initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                        target:self
                        action:@selector(addNewData)];
    
    barButtonRefresh = [[UIBarButtonItem alloc]
                        initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh
                        target:self
                        action:@selector(barButtonRefreshTouched)];
}

- (void)barButtonRefreshTouched
{
    [self reloadData];
}

- (void)reloadData
{
    NSLogWithPrettyFunction(@"reloadNetworkData not implemented");
}

- (void)addNewData
{
    NSLogWithPrettyFunction(@"addNewData not implemented");
}

#pragma mark - Manipulation Data
- (void)addHeader:(id)header
{
    [baseTableView addHeader:header];
}

- (void)removeAllHeaders
{
    [baseTableView removeAllHeaders];
}

- (void)addFooter:(id)footer
{
    [baseTableView addFooter:footer];
}

- (void)removeAllFooters
{
    [baseTableView removeAllFooters];
}

#pragma mark - Headers
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return [baseTableView tableView:tableView heightForHeaderInSection:section];
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    return [baseTableView tableView:tableView viewForHeaderInSection:section];
}

#pragma mark - Footers
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return [baseTableView tableView:tableView heightForFooterInSection:section];
}

-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    return [baseTableView tableView:tableView viewForFooterInSection:section];
}
@end
