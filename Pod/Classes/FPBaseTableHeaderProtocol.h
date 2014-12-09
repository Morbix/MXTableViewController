//
//  FPBaseTableHeaderProtocol.h
//  FinancasPessoais
//
//  Created by Henrique Morbin on 23/11/14.
//  Copyright (c) 2014 Moolab. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol FPBaseTableHeaderProtocol <NSObject>

@required
- (CGFloat)getHeaderHeight;
- (UIView *)getHeaderView;

@end
