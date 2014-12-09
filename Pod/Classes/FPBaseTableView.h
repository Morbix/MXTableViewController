//
//  FPBaseTableView.h
//  FinancasPessoais
//
//  Created by Henrique Morbin on 20/11/14.
//  Copyright (c) 2014 Moolab. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface FPBaseTableView : UITableView <UITableViewDelegate, UITableViewDataSource>

#pragma mark - Manipulation Data
- (void)addRow:(id)object inSection:(int)section;
- (void)removeAllRowsInSection:(int)section;
- (void)addHeader:(id)header;
- (void)removeAllHeaders;
- (void)addFooter:(id)footer;
- (void)removeAllFooters;

@end
