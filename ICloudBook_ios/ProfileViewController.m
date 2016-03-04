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
    dataList = [[NSArray alloc] initWithContentsOfFile:plistPath];
    
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
    
    NSDictionary * tempDict = [dataList objectAtIndex:[indexPath row]];
    
    NSNumber *type = [tempDict objectForKey:@"type"];
    
    if (cell == nil) {
        if ([type compare:[NSNumber numberWithInt:0]] == NSOrderedSame) {       ///0.normal
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identifier];
            cell.detailTextLabel.text = tempDict[@"value"];
            
        } else if ([type compare:[NSNumber numberWithInt:1]] == NSOrderedSame) {///1.arrow
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identifier];
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            cell.detailTextLabel.text = tempDict[@"value"];
            
        } else if ([type compare:[NSNumber numberWithInt:2]] == NSOrderedSame) {///2.head picture
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identifier];
            UIImageView * headImg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"person_head_img"]];
            [headImg setFrame:CGRectMake(0, 0, 45, 45)];
            [headImg setTag:909];
            
            cell.accessoryView = headImg;
            
            cell.accessoryType=UITableViewCellAccessoryNone;
            
        } else if ([type compare:[NSNumber numberWithInt:3]] == NSOrderedSame) {///3.single label
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identifier];
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            cell.detailTextLabel.text = tempDict[@"value"];
            
        } else {///4                                                            ///4.double labels.
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
            cell.detailTextLabel.text = tempDict[@"value"];
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        }
        
    }
    
    cell.textLabel.text = tempDict[@"label"];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 56;
}

///tableView row height
//-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
//    return 50;
//}


///click
-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.row) {
        case 0:
        {
            UIActionSheet * actionSheet = [[UIActionSheet alloc] initWithTitle:@"修改头像" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"相机", @"相册选择", nil];
            [actionSheet setTitle:@"修改头像"];
        
            [actionSheet showInView:self.view];
        }
            break;
//        case 1://姓名暂时不能修改
//            
//            break;
        case 2:
            
            break;
        case 3:
            
            break;
        case 4:
            
            break;
        case 5:
            
            break;
        case 6:
            
            break;
        case 7:
            
            break;
        case 8:
            
            break;
        case 9:
            
            break;
        case 10:
            
            break;
        default:
            
            break;
    }
}

///action sheet click
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    switch (buttonIndex) {
        case 0:
            if ([UIImagePickerController isCameraDeviceAvailable:UIImagePickerControllerCameraDeviceRear]) {
                UIImagePickerController* imagePicker = [[UIImagePickerController alloc] init];
                imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
                imagePicker.delegate   = self;
                [self presentViewController:imagePicker animated:YES completion:^{}];
            }else{
                
            }
            break;
        case 1:
        {
            UIImagePickerController* imagePicker = [[UIImagePickerController alloc] init];
            imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
            imagePicker.delegate   = self;
            [self presentViewController:imagePicker animated:YES completion:^{}];
            
        }
            break;
        default:
            break;
    }
}

#pragma ImagePicker delegate
-(void) imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)image editingInfo:(NSDictionary<NSString *,id> *)editingInfo {
    UIImageView * imageView = (UIImageView *)[self.view viewWithTag:909];
    imageView.image = image;
    [picker dismissViewControllerAnimated:YES completion:NULL];
}
///image picker choose.
//- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(nonnull NSDictionary<NSString *,id> *)info {
//    UIImageView * imageView = (UIImageView *)[self.view viewWithTag:909];
//    UIImage * image = [info objectForKey:UIImagePickerControllerEditedImage];
//    imageView.image = image;
//    [picker dismissViewControllerAnimated:YES completion:NULL];
//}

///cancel select
-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    NSLog(@"取消选择");
    [picker dismissViewControllerAnimated:YES completion:NULL];
}


@end
