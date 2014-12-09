//
//  MXModel.m
//  MXTableViewController
//
//  Created by HP Developer on 09/12/14.
//  Copyright (c) 2014 Henrique Morbin - Mac HP. All rights reserved.
//

#import "MXModel.h"

@implementation MXModel

- (instancetype)initWithTitleStuff:(NSString *)title
{
    self = [super init];
    if (self) {
        self.titleStuff = title;
    }
    return self;
}

- (CGFloat)mx_getCellHeight
{
    return 44.0f;
}

- (NSString *)mx_getCellIdentifier
{
    return @"CellMain";
}

@end
