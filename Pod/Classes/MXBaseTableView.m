//
//  FPBaseTableView.m
//  Copyright (c) 2014 Henrique Morbin - HP Macbook Pro <morbin_@hotmail.com>
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.

#import "MXBaseTableView.h"

#import "MXBaseTableRowProtocol.h"
#import "MXBaseTableCellProtocol.h"
#import "MXBaseTableHeaderProtocol.h"
#import "MXBaseTableFooterProtocol.h"

@interface MXBaseTableView ()

@property (nonatomic, strong) NSMutableArray *arraySections;
@property (nonatomic, strong) NSMutableArray *arrayHeaders;
@property (nonatomic, strong) NSMutableArray *arrayFooters;

@end

@implementation MXBaseTableView

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
    
    NSAssert([object conformsToProtocol:@protocol(MXBaseTableRowProtocol)], @"[%s] object(%@) must conform to FPBaseTableRowProtocol", __PRETTY_FUNCTION__, NSStringFromClass([object class]));
    
    id<MXBaseTableRowProtocol> row = object;
    
    return [row getCellIdentifier];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self validateArrays];
    [self validateSection:indexPath.section];
    
    id object = self.arraySections[indexPath.section][indexPath.row];
    
    NSString *identifier = [self tableView:tableView identifierForRowAtIndexPath:indexPath andObject:object];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    
    NSAssert([cell conformsToProtocol:@protocol(MXBaseTableCellProtocol)], @"[%s] cell(%@) must conform to FBBaseTableCellProtocol", __PRETTY_FUNCTION__, NSStringFromClass([cell class]));
    
    
    [(id<MXBaseTableCellProtocol>)cell configureCellWithObject:object
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
    
    NSAssert([object conformsToProtocol:@protocol(MXBaseTableRowProtocol)], @"[%s] object(%@) for row must conform to FBBaseTableRowProtocol", __PRETTY_FUNCTION__, NSStringFromClass([object class]));
    
    id<MXBaseTableRowProtocol> row = object;
    
    return [row getCellHeight];
}

#pragma mark - Headers
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    [self validateArrays];
    
    if (section < self.arrayHeaders.count) {
        id object = self.arrayHeaders[section];
        
        NSAssert([object conformsToProtocol:@protocol(MXBaseTableHeaderProtocol)], @"[%s] object(%@) for header must conform to FPBaseTableHeaderProtocol", __PRETTY_FUNCTION__, NSStringFromClass([object class]));
        
        id<MXBaseTableHeaderProtocol> header = object;
        
        return [header getHeaderHeight];
    }
    
    return 0.1f;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    [self validateArrays];
    
    if (section < self.arrayHeaders.count) {
        id object = self.arrayHeaders[section];
        
        NSAssert([object conformsToProtocol:@protocol(MXBaseTableHeaderProtocol)], @"[%s] object(%@) for header must conform to FPBaseTableHeaderProtocol", __PRETTY_FUNCTION__, NSStringFromClass([object class]));
        
        id<MXBaseTableHeaderProtocol> header = object;
        
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
        
        NSAssert([object conformsToProtocol:@protocol(MXBaseTableFooterProtocol)], @"[%s] object(%@) for footer must conform to FPBaseTableFooterProtocol", __PRETTY_FUNCTION__, NSStringFromClass([object class]));
        
        id<MXBaseTableFooterProtocol> header = object;
        
        return [header getFooterHeight];
    }
    
    return 0.1f;
}

-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    [self validateArrays];
    
    if (section < self.arrayFooters.count) {
        id object = self.arrayFooters[section];
        
        NSAssert([object conformsToProtocol:@protocol(MXBaseTableFooterProtocol)], @"[%s] object(%@) for footer must conform to FPBaseTableFooterProtocol", __PRETTY_FUNCTION__, NSStringFromClass([object class]));
        
        id<MXBaseTableFooterProtocol> header = object;
        
        return [header getFooterView];
    }
    
    return [[UIView alloc] initWithFrame:CGRectZero];
}

@end
