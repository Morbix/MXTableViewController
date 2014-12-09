//
//  CellMain.m
//  MXTableViewController
//
//  Created by HP Developer on 09/12/14.
//  Copyright (c) 2014 Henrique Morbin - Mac HP. All rights reserved.
//

#import "CellMain.h"

#import "MXModel.h"

@implementation CellMain

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)mx_configureCellWithObject:(id)object target:(id)target indexPath:(NSIndexPath *)indexPath
{
    if (object) {
        if ([object isKindOfClass:[MXModel class]]) {
            
            MXModel *model = object;
            
            self.textLabel.text = model.titleStuff;
        }
    }
}

@end
