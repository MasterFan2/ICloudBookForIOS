//
//  ProfileViewController.m
//  ICloudBook_ios
//
//  Created by 范国强 on 16/3/2.
//  Copyright © 2016年 MasterFan. All rights reserved.
//

#import "ProfileViewController.h"

@interface ProfileViewController ()

@end

@implementation ProfileViewController
@synthesize  dataList;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self.navigationController setTitle:@"Profile"];
//    dataList = [NSArray arrayWithObjects:@"姓名", @"电话", @"班级", @"座右铭", @"生日", @"星座", nil];
    
    ///follow two lines to set title.
    self.title=@"个人信息设置";
//    self.navigationItem.title=@"个人信息设置";


    ///load content from plist file.
    NSString * plistPath = [[NSBundle mainBundle] pathForResource:@"Profile" ofType:@"plist"];
    self.pDict = [[NSDictionary alloc] initWithContentsOfFile:plistPath];
    dataList = self.pDict.allKeys;
    
    
    ///comparator
//    NSComparator sort = ^(NSString *obj1,NSString *obj2){
//        unichar obj1Char = [obj1 characterAtIndex:0];
//        unichar obj2Char = [obj2 characterAtIndex:0];
//        
//        NSLog(@"obj1char=%c,     obj2Char=%c", obj1Char, obj2Char);
//        
//        if (obj1Char > obj2Char) {
//            return NSOrderedDescending;
//        }else if (obj1Char < obj2Char){
//            return NSOrderedAscending;
//        }else {
//            return NSOrderedSame;
//        }
//    };
//    
//    [dataList sortedArrayUsingComparator:sort];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return dataList.count;
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString* identifier = @"profileIdentifier";
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    NSDictionary* tempDict = [self.pDict valueForKey:[dataList objectAtIndex:[indexPath row]]];
    
    NSNumber *type = [tempDict objectForKey:@"type"];
    
    NSLog(@"%@", type);
    
    if (cell == nil) {
        if ([type compare:[NSNumber numberWithInt:0]] == NSOrderedSame) {       ///0.normal
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identifier];
            
        } else if ([type compare:[NSNumber numberWithInt:1]] == NSOrderedSame) {///1.arrow
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identifier];
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            cell.detailTextLabel.text = @"Ha.";
            
        } else if ([type compare:[NSNumber numberWithInt:2]] == NSOrderedSame) {///2.head picture
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identifier];
            cell.detailTextLabel.text = @"Ha.";
            
        } else if ([type compare:[NSNumber numberWithInt:3]] == NSOrderedSame) {///3.single label
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identifier];
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            cell.detailTextLabel.text = @"";
            
        } else {///4                                                            ///4.double labels.
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
            cell.detailTextLabel.text = @"Ha.";
        }
        
    }
    
    cell.textLabel.text = [dataList objectAtIndex:indexPath.row];
    
    return cell;
}

///tableView row height
//-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
//    return 50;
//}


///click
-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}



@end
