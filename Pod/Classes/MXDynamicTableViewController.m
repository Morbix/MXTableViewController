//
//  MCBaseTableViewController.m
//  Copyright (c) 2014 Henrique Morbin - HP Macbook Pro <morbin_@hotmail.com>
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.

#import "MXDynamicTableViewController.h"
#import "MXBaseTableView.h"

@interface MXDynamicTableViewController ()
{
    MXBaseTableView *baseTableView;
}
@end

@implementation MXDynamicTableViewController

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
    
    baseTableView = [[MXBaseTableView alloc] init];

    
    self.tableView.delegate = baseTableView;
    self.tableView.dataSource = baseTableView;
    
    [self configBarButtons];
    
    [self.navigationController.navigationBar setTranslucent:NO];
}


#pragma mark - Métodos
- (void)configBarButtons
{
    mx_barButtonAdd     = [[UIBarButtonItem alloc]
                        initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                        target:self
                        action:@selector(mx_addNewData)];
    
    mx_barButtonRefresh = [[UIBarButtonItem alloc]
                        initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh
                        target:self
                        action:@selector(barButtonRefreshTouched)];
}

- (void)barButtonRefreshTouched
{
    [self mx_reloadData];
}

- (void)mx_reloadData
{
    NSLog(@"[%s] reloadNetworkData not implemented", __PRETTY_FUNCTION__);
}

- (void)mx_addNewData
{
    NSLog(@"[%s] addNewData not implemented", __PRETTY_FUNCTION__);
}

#pragma mark - Manipulation Data
- (void)mx_addRow:(id)object inSection:(int)section
{
    [baseTableView mx_addRow:object inSection:section];
}

- (void)mx_removeAllRowsInSection:(int)section
{
    [baseTableView mx_removeAllRowsInSection:section];
}

- (void)mx_addHeader:(id)header
{
    [baseTableView mx_addHeader:header];
}

- (void)mx_removeAllHeaders
{
    [baseTableView mx_removeAllHeaders];
}

- (void)mx_addFooter:(id)footer
{
    [baseTableView mx_addFooter:footer];
}

- (void)mx_removeAllFooters
{
    [baseTableView mx_removeAllFooters];
}
@end

