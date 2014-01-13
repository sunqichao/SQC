//
//  HelpViewController.m
//  SQC
//
//  Created by sun qichao on 14-1-10.
//  Copyright (c) 2014年 sun qichao. All rights reserved.
//

#import "HelpViewController.h"
#import "DetailViewController.h"

@interface HelpViewController ()
@property (nonatomic ,retain) NSArray *dataSource;

@end

@implementation HelpViewController

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
        dispatch_queue_t queue = dispatch_queue_create("gethelp", Nil);
        
        dispatch_async(queue, ^{
            self.dataSource = [SQCAPI getHelpList];
            
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.mainTableView reloadData];
            });
        });
        
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    static NSString *CellIdentifier = @"HelpCell";
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


- (IBAction)dismisscontroller:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}
@end
