//
//  MXNoData.m
//  MXTableViewController
//
//  Created by HP Developer on 09/12/14.
//  Copyright (c) 2014 Henrique Morbin - Mac HP. All rights reserved.
//

#import "MXNoData.h"

@implementation MXNoData

- (CGFloat)mx_getCellHeight
{
    return 60.0f;
}

- (NSString *)mx_getCellIdentifier
{
    return @"CellNoData";
}

@end
