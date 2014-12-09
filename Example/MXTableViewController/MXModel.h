//
//  MXModel.h
//  MXTableViewController
//
//  Created by HP Developer on 09/12/14.
//  Copyright (c) 2014 Henrique Morbin - Mac HP. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <MXTableViewController/MXBaseTableRowProtocol.h>

@interface MXModel : NSObject <MXBaseTableRowProtocol>

@property (nonatomic, strong) NSString *titleStuff;

- (instancetype)initWithTitleStuff:(NSString *)title;

@end
