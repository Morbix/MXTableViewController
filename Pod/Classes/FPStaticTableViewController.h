//
//  FPStaticTableViewController.h
//  FinancasPessoais
//
//  Created by Henrique Morbin on 23/11/14.
//  Copyright (c) 2014 Moolab. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FPStaticTableViewController : UITableViewController
{
    UIBarButtonItem *barButtonAdd;
    UIBarButtonItem *barButtonRefresh;
}

- (void)reloadData;
- (void)addNewData;

#pragma mark - Manipulation Data
- (void)addHeader:(id)header;
- (void)removeAllHeaders;
- (void)addFooter:(id)footer;
- (void)removeAllFooters;

@end
