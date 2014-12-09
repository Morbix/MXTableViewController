//
//  CellNoData.m
//  MXTableViewController
//
//  Created by HP Developer on 09/12/14.
//  Copyright (c) 2014 Henrique Morbin - Mac HP. All rights reserved.
//

#import "CellNoData.h"

@implementation CellNoData

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


-(void)mx_configureCellWithObject:(id)object target:(id)target indexPath:(NSIndexPath *)indexPath
{
    //doing nothing, this class is just to conforms
}

@end
