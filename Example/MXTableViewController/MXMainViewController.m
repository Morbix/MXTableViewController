//
//  MXMainViewController.m
//  MXTableViewController
//
//  Created by HP Developer on 09/12/14.
//  Copyright (c) 2014 Henrique Morbin - Mac HP. All rights reserved.
//

#import "MXMainViewController.h"

#import "MXNoData.h"
#import "MXModel.h"

@interface MXMainViewController ()
{
    NSMutableArray *arrayLocal;
}


@end

@implementation MXMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    arrayLocal = [NSMutableArray new];
    
    [self mx_addRow:[[MXNoData alloc] init] inSection:0];
    
    self.navigationItem.leftBarButtonItem = mx_barButtonRefresh;
    self.navigationItem.rightBarButtonItem = mx_barButtonAdd;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)mx_addNewData
{
    static int count = 0;
    
    count++;
    
    [arrayLocal addObject:[[MXModel alloc] initWithTitleStuff:[NSString stringWithFormat:@"Local Data %d", count]]];
    [self mx_addRow:[[MXModel alloc] initWithTitleStuff:[NSString stringWithFormat:@"Local Data %d", count]] inSection:1];
    
    [self.tableView reloadData];
}

-(void)mx_reloadData
{
    [self mx_removeAllRowsInSection:0];
    
    [self mx_addRow:[[MXModel alloc] initWithTitleStuff:@"Server Data 1"] inSection:0];
    [self mx_addRow:[[MXModel alloc] initWithTitleStuff:@"Server Data 2"] inSection:0];
    [self mx_addRow:[[MXModel alloc] initWithTitleStuff:@"Server Data 3"] inSection:0];
    [self mx_addRow:[[MXModel alloc] initWithTitleStuff:@"Server Data 4"] inSection:0];
    [self mx_addRow:[[MXModel alloc] initWithTitleStuff:@"Server Data 5"] inSection:0];
    
    for (id obj in arrayLocal) {
        [self mx_addRow:obj inSection:1];
    }
    
    [self.tableView reloadData];
}
@end
