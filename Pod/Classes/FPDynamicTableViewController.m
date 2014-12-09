//
//  MCBaseTableViewController.m
//  FinancasPessoais
//
//  Created by Henrique Morbin on 19/11/14.
//  Copyright (c) 2014 Moolab. All rights reserved.
//

#import "FPDynamicTableViewController.h"
#import "FPBaseTableView.h"

@interface FPDynamicTableViewController ()
{
    FPBaseTableView *baseTableView;
}
@end

@implementation FPDynamicTableViewController

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

    
    self.tableView.delegate = baseTableView;
    self.tableView.dataSource = baseTableView;
    
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
- (void)addRow:(id)object inSection:(int)section
{
    [baseTableView addRow:object inSection:section];
}

- (void)removeAllRowsInSection:(int)section
{
    [baseTableView removeAllRowsInSection:section];
}

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
@end

