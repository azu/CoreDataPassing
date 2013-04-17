//
//  DataListTableView.m
//  CoreDataPassing
//
//  Created by azu on 04/17/13.
//  Copyright (c) 2013 azu. All rights reserved.
//

#import "DataListTableView.h"
#import "CoreDataManager.h"

@interface DataListTableView ()
@property(nonatomic, strong) NSArray *dataSource;
@end

@implementation DataListTableView
#pragma mark - View lifecycle
- (void)viewWillAppear:(BOOL) animated {
    [super viewWillAppear:animated];
    // deselect cell
    [self.tableView deselectRowAtIndexPath:[self.tableView indexPathForSelectedRow] animated:YES];
    // update dataSource
    [self updateDataSource];
    // update visible cells
    [self updateVisibleCells];
}

- (NSArray *)arrayForSQLiteFiles {

    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *dirPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
    NSArray *fileArray = [fileManager contentsOfDirectoryAtPath:dirPath error:nil];

    NSMutableArray *sqlites = [NSMutableArray array];
    NSString *fileExt = @"sqlite";
    for (NSUInteger i = 0; i < [fileArray count]; i++) {
        NSString *workFileName = [fileArray objectAtIndex:i];
        NSString *workFileExt = [workFileName pathExtension];
        if (workFileExt != nil && [workFileExt isEqualToString:fileExt]) {
            [sqlites addObject:workFileName];
        }
    }
    return sqlites;
}

- (void)updateDataSource {
    self.dataSource = [self arrayForSQLiteFiles];
}

#pragma mark - Cell Operation
- (NSInteger)tableView:(UITableView *) tableView numberOfRowsInSection:(NSInteger) section {
    return [self.dataSource count];
}

- (void)updateVisibleCells {
    // 見えているセルの表示更新
    for (UITableViewCell *cell in [self.tableView visibleCells]) {
        [self updateCell:cell atIndexPath:[self.tableView indexPathForCell:cell]];
    }
}

- (void)updateCell:(UITableViewCell *) cell atIndexPath:(NSIndexPath *) indexPath {
    // Update Cells
    NSUInteger row = (NSUInteger)indexPath.row;
    cell.textLabel.text = self.dataSource[row];
}

- (UITableViewCell *)tableView:(UITableView *) tableView
         cellForRowAtIndexPath:(NSIndexPath *) indexPath {
    NSString *cellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    // Update Cell
    [self updateCell:cell atIndexPath:indexPath];

    return cell;
}


//--------------------------------------------------------------//
#pragma mark -- UITableViewDelegate --
//--------------------------------------------------------------//

- (void)tableView:(UITableView *) tableView didSelectRowAtIndexPath:(NSIndexPath *) indexPath {

    NSUInteger row = (NSUInteger)indexPath.row;
    NSString *fileName = self.dataSource[row];
    // Change CoreData sqlite file
    [[CoreDataManager sharedManager] changeStoreFileName:fileName];
    // ハイライトを外す
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [self.navigationController popViewControllerAnimated:YES];
}
@end
