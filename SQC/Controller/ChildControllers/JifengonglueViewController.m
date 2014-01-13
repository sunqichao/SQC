//
//  JifengonglueViewController.m
//  SQC
//
//  Created by sun qichao on 14-1-8.
//  Copyright (c) 2014年 sun qichao. All rights reserved.
//

#import "JifengonglueViewController.h"
#import "DetailViewController.h"
@interface JifengonglueViewController ()
@property (nonatomic ,retain) NSArray *dataSource;
@end

@implementation JifengonglueViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    if ([_dataSource count]>10) {
        NSLog(@"OK");
    }else
    {
        dispatch_queue_t queue = dispatch_queue_create("getgonglue", Nil);
        
        dispatch_async(queue, ^{
            self.dataSource = [SQCAPI getGongLueList];
            
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.mainTableview reloadData];
            });
        });
        
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)dismissController:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [_dataSource count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"GonglueCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        
    }
    
    PFObject *gonglue = [_dataSource objectAtIndex:indexPath.row];
    
    cell.textLabel.text = gonglue[@"title"];
    
    // Configure the cell...
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    PFObject *gonglue = [_dataSource objectAtIndex:indexPath.row];
    DetailViewController *detail = [[DetailViewController alloc] init];
    detail.content = gonglue[@"content"];
    [self presentViewController:detail animated:YES completion:nil];
    
    
}












@end
