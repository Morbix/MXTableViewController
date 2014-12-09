//
//  PFBaseTableFooterProtocol.h
//  FinancasPessoais
//
//  Created by Henrique Morbin on 23/11/14.
//  Copyright (c) 2014 Moolab. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol FPBaseTableFooterProtocol <NSObject>

@required
- (CGFloat)getFooterHeight;
- (UIView *)getFooterView;

@end
