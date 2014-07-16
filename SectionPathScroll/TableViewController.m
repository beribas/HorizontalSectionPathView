//
//  TableViewController.m
//  SectionPathScroll
//
//  Created by Oleg Langer on 26.03.14.
//  Copyright (c) 2014 Oleg Langer. All rights reserved.
//

#import "TableViewController.h"

@interface TableViewController ()
@property BOOL userManuallyDragging;

@end

@implementation TableViewController


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.sectionTitles.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 30;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return self.sectionTitles[section];
}

- (void)sectionPathViewSelectedSectionAtIndex:(NSInteger)sectionIndex {
    NSIndexPath *firstRowInSelectedSection = [NSIndexPath indexPathForRow:0 inSection:sectionIndex];
    [self.tableView scrollToRowAtIndexPath:firstRowInSelectedSection atScrollPosition:UITableViewScrollPositionTop animated:YES];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString* cellIdentifier = @"CellIdentifier";
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"%ld,%ld", (long)indexPath.section, (long)indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

}

- (void)tableView:(UITableView *)tableView willDisplayHeaderView:(UIView *)view forSection:(NSInteger)section {
//    NSLog(@"%s  section index = %d", __PRETTY_FUNCTION__, section);
    if (!self.userManuallyDragging) return;
    if ([self.horizontalSectionPathViewDelegate respondsToSelector:@selector(tableViewWillDisplaySectionAtIndex:)]) {
        [self.horizontalSectionPathViewDelegate tableViewWillDisplaySectionAtIndex:section];
    }
    else if ([self.horizontalSectionPathViewDelegate respondsToSelector:@selector(tableViewWillDisplaySectionWithTitle:)]) {
        [self.horizontalSectionPathViewDelegate tableViewWillDisplaySectionWithTitle:self.sectionTitles[section]];
    }
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    self.userManuallyDragging = YES;
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    NSLog(@"%s", __PRETTY_FUNCTION__);
    self.userManuallyDragging = NO;
}
- (void)scrollViewDidScrollToTop:(UIScrollView *)scrollView {
    NSLog(@"%s", __PRETTY_FUNCTION__);
}

@end
