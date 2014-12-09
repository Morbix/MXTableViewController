//
//  FPBaseTableCellProtocol.h
//  FinancasPessoais
//
//  Created by Henrique Morbin on 19/11/14.
//  Copyright (c) 2014 Moolab. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol FPBaseTableCellProtocol <NSObject>

@required
- (void)configureCellWithObject:(id)object target:(id)target indexPath:(NSIndexPath *)indexPath;

@end
