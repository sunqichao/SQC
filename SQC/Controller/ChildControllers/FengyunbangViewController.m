//
//  FengyunbangViewController.m
//  SQC
//
//  Created by sun qichao on 14-1-8.
//  Copyright (c) 2014年 sun qichao. All rights reserved.
//

#import "FengyunbangViewController.h"
#import "FengyunbangCell.h"
@interface FengyunbangViewController ()
@property (nonatomic ,retain) NSArray *dataSource;
@end

@implementation FengyunbangViewController

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
        dispatch_queue_t queue = dispatch_queue_create("getfengyun", Nil);
        
        dispatch_async(queue, ^{
            self.dataSource = [SQCAPI getFengYunData];

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
    return 84;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [_dataSource count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"FengyunbangCell";
    FengyunbangCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell)
    {
        cell = (FengyunbangCell *)[FengyunbangCell cellFromNibNamed:NSStringFromClass([FengyunbangCell class])];
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    [cell setDataSource:[_dataSource objectAtIndex:indexPath.row] withIndex:indexPath.row];
    
    // Configure the cell...
    
    return cell;
}

@end
