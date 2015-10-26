//
//  TableViewController.m
//  ObjPopoverPresentationController
//
//  Created by Kai Windle on 26/10/2015.
//  Copyright © 2015 Kai Windle. All rights reserved.
//

#import "TableViewController.h"


#define kCellWithIdentifier @"cell"

@interface TableViewController ()
@property (nonatomic, copy) NSArray *names;

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    self.names = @[@"John", @"Mike", @"Sarah", @"Karen", @"Kai", @"Brad", @"Louise"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.names.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellWithIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    cell.textLabel.text = self.names[indexPath.row];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (self.deleagate && [self.deleagate respondsToSelector:@selector(updateViewWithSelectedData:)]) {
        
        [self.deleagate updateViewWithSelectedData:self.names[indexPath.row]];
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
