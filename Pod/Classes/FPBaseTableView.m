//
//  FPBaseTableView.m
//  FinancasPessoais
//
//  Created by Henrique Morbin on 20/11/14.
//  Copyright (c) 2014 Moolab. All rights reserved.
//

#import "FPBaseTableView.h"

@interface FPBaseTableView ()

@property (nonatomic, strong) NSMutableArray *arraySections;
@property (nonatomic, strong) NSMutableArray *arrayHeaders;
@property (nonatomic, strong) NSMutableArray *arrayFooters;

@end

@implementation FPBaseTableView

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self configure];
    }
    return self;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self configure];
    }
    return self;
}

- (void)configure
{
    self.delegate   = self;
    self.dataSource = self;
    
    self.arraySections    = [NSMutableArray new];
    self.arrayHeaders = [NSMutableArray new];
    self.arrayFooters = [NSMutableArray new];
    
    [self.arraySections addObject:[NSMutableArray new]];
}

#pragma mark - Manipulation Data
- (void)addRow:(id)object inSection:(int)section
{
    while (!(section < self.arraySections.count)) {
        [self.arraySections addObject:[NSMutableArray new]];
    }
    
    [self validateSection:section];
    
    [self.arraySections[section] addObject:object];
}

- (void)removeAllRowsInSection:(int)section
{
    [self validateSection:section];
    
    [self.arraySections[section] removeAllObjects];
}

- (void)addHeader:(id)header
{
    [self.arrayHeaders addObject:header];
}

- (void)removeAllHeaders
{
    [self.arrayHeaders removeAllObjects];
}

- (void)addFooter:(id)footer
{
    [self.arrayFooters addObject:footer];
}

- (void)removeAllFooters
{
    [self.arrayFooters removeAllObjects];
}

#pragma mark - Validations
- (void)validateArrays
{
    //NSAssert((self.arrayRows.count == self.arrayHeaders.count) && (self.arrayRows.count == self.arrayFooters.count), @"[%s] arrayRows and arrayHeaders and arrayFooters must have the same number of elements", __PRETTY_FUNCTION__);
}

- (void)validateSection:(NSInteger)section
{
    NSAssert([self.arraySections[section] isKindOfClass:[NSMutableArray class]], @"[%s] self.arrayRows must have an array inside", __PRETTY_FUNCTION__);
}



#pragma mark - UITableViewDelegate and UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    [self validateArrays];
    
    return self.arraySections.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    [self validateArrays];
    [self validateSection:section];
    
    return [self.arraySections[section] count];
}

#pragma mark - Cells
- (NSString *)tableView:(UITableView *)tableView identifierForRowAtIndexPath:(NSIndexPath *)indexPath andObject:(id)object
{
    [self validateArrays];
    [self validateSection:indexPath.section];
    
    NSAssert([object conformsToProtocol:@protocol(FPBaseTableRowProtocol)], @"[%s] object(%@) must conform to FPBaseTableRowProtocol", __PRETTY_FUNCTION__, NSStringFromClass([object class]));
    
    id<FPBaseTableRowProtocol> row = object;
    
    return [row getCellIdentifier];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self validateArrays];
    [self validateSection:indexPath.section];
    
    id object = self.arraySections[indexPath.section][indexPath.row];
    
    NSString *identifier = [self tableView:tableView identifierForRowAtIndexPath:indexPath andObject:object];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    
    NSAssert([cell conformsToProtocol:@protocol(FPBaseTableCellProtocol)], @"[%s] cell(%@) must conform to FBBaseTableCellProtocol", __PRETTY_FUNCTION__, NSStringFromClass([cell class]));
    
    
    [(id<FPBaseTableCellProtocol>)cell configureCellWithObject:object
                                                        target:self
                                                     indexPath:indexPath];
    
    /*SEL selector = NSSelectorFromString(@"configureCellWithObject:target:indexPath:");
    IMP imp = [cell methodForSelector:selector];
    void (*func) (id, SEL, id, id, id) = (void *)imp;
    
    if ([cell respondsToSelector:selector]){
        func(cell, selector, object, self, indexPath);
    }*/
    
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self validateArrays];
    [self validateSection:indexPath.section];
    
    id object = self.arraySections[indexPath.section][indexPath.row];
    
    NSAssert([object conformsToProtocol:@protocol(FPBaseTableRowProtocol)], @"[%s] object(%@) for row must conform to FBBaseTableRowProtocol", __PRETTY_FUNCTION__, NSStringFromClass([object class]));
    
    id<FPBaseTableRowProtocol> row = object;
    
    return [row getCellHeight];
}

#pragma mark - Headers
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    [self validateArrays];
    
    if (section < self.arrayHeaders.count) {
        id object = self.arrayHeaders[section];
        
        NSAssert([object conformsToProtocol:@protocol(FPBaseTableHeaderProtocol)], @"[%s] object(%@) for header must conform to FPBaseTableHeaderProtocol", __PRETTY_FUNCTION__, NSStringFromClass([object class]));
        
        id<FPBaseTableHeaderProtocol> header = object;
        
        return [header getHeaderHeight];
    }
    
    return 0.1f;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    [self validateArrays];
    
    if (section < self.arrayHeaders.count) {
        id object = self.arrayHeaders[section];
        
        NSAssert([object conformsToProtocol:@protocol(FPBaseTableHeaderProtocol)], @"[%s] object(%@) for header must conform to FPBaseTableHeaderProtocol", __PRETTY_FUNCTION__, NSStringFromClass([object class]));
        
        id<FPBaseTableHeaderProtocol> header = object;
        
        return [header getHeaderView];
    }
    
    return [[UIView alloc] initWithFrame:CGRectZero];
}

#pragma mark - Footers
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    [self validateArrays];
    
    if (section < self.arrayFooters.count) {
        id object = self.arrayFooters[section];
        
        NSAssert([object conformsToProtocol:@protocol(FPBaseTableFooterProtocol)], @"[%s] object(%@) for footer must conform to FPBaseTableFooterProtocol", __PRETTY_FUNCTION__, NSStringFromClass([object class]));
        
        id<FPBaseTableFooterProtocol> header = object;
        
        return [header getFooterHeight];
    }
    
    return 0.1f;
}

-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    [self validateArrays];
    
    if (section < self.arrayFooters.count) {
        id object = self.arrayFooters[section];
        
        NSAssert([object conformsToProtocol:@protocol(FPBaseTableFooterProtocol)], @"[%s] object(%@) for footer must conform to FPBaseTableFooterProtocol", __PRETTY_FUNCTION__, NSStringFromClass([object class]));
        
        id<FPBaseTableFooterProtocol> header = object;
        
        return [header getFooterView];
    }
    
    return [[UIView alloc] initWithFrame:CGRectZero];
}

@end
