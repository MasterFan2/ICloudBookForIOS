//
//  ProfileViewController.m
//  ICloudBook_ios
//
//  Created by 范国强 on 16/3/2.
//  Copyright © 2016年 MasterFan. All rights reserved.
//

#import "ProfileViewController.h"
#import "ModifyNicknameViewController.h"
#import "ModifyPwdViewController.h"
#import "ModifyPhoneViewController.h"
#import "ModifyEmailViewController.h"
#import "ModifyMottoViewController.h"
#import "ModifyIntroViewController.h"

@interface ProfileViewController ()

@end

@implementation ProfileViewController
@synthesize  dataList;  //main datas
@synthesize clickLine;  //selected type . switch infomation
@synthesize classes;    //classes
@synthesize headClasses;//
@synthesize what;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    ///default
    clickLine = 0;
    
    ///follow two lines to set title.
    self.title=@"个人设置";// or self.navigationItem.title=@"个人信息设置";
    
    ///register modify nickname callback
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(nicknameCompletion:) name:@"registerCompletionNotification" object:nil];

    ///load content from plist file.
    NSString * plistPath = [[NSBundle mainBundle] pathForResource:@"Profile" ofType:@"plist"];
    dataList = [[NSMutableArray alloc] initWithContentsOfFile:plistPath];
    
    ///
    
   classes =  [NSMutableDictionary dictionaryWithObjectsAndKeys:@[@"1班", @"2班"], @"2012级",
              @[@"1班", @"2班", @"3班", @"4班", @"5班"], @"2013级",
              @[@"1班", @"2班", @"3班"], @"2014级",
               @[@"1班", @"2班", @"3班", @"4班"], @"2015级",
               nil];
    headClasses = [classes allKeys];
    
    if (classes != nil && [classes count] > 0) {
        NSLog(@"has data");
    }else {
        NSLog(@"empty arry");
    }
}


//_____________________________________beautiful Separator line________________________________________________start
///nickname callback
-(void) nicknameCompletion:(NSNotification *) notification {
    //get data and set to orign
    NSDictionary * data = [notification userInfo];
    NSString * username = [data objectForKey:@"username"];
    [dataList objectAtIndex:2][@"value"] = username;
    
    ///get indexpath & correspond refresh row
    NSIndexPath *indexPath=[NSIndexPath indexPathForRow:2 inSection:0];
    [profileTable reloadRowsAtIndexPaths:[NSArray arrayWithObjects:indexPath,nil] withRowAnimation:UITableViewRowAnimationAutomatic];
}



//--------------------------------------beautiful separator line------------------------------------------------end


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
        } else if ([type compare:[NSNumber numberWithInt:1]] == NSOrderedSame) {///1.arrow
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identifier];
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        } else if ([type compare:[NSNumber numberWithInt:2]] == NSOrderedSame) {///2.head picture
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identifier];
        } else if ([type compare:[NSNumber numberWithInt:3]] == NSOrderedSame) {///3.single label
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identifier];
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        } else {///4                                                            ///4.double labels.
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
        }
    }
    
    if ([type compare:[NSNumber numberWithInt:0]] == NSOrderedSame) {      ///0.normal
        cell.detailTextLabel.text = tempDict[@"value"];
    }else if ([type compare:[NSNumber numberWithInt:1]] == NSOrderedSame) {///1.arrow
        cell.detailTextLabel.text = tempDict[@"value"];
    }else if ([type compare:[NSNumber numberWithInt:2]] == NSOrderedSame) {///2.head picture
        UIImageView * headImg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"person_head_img"]];
        [headImg setFrame:CGRectMake(0, 0, 45, 45)];
        [headImg setTag:909];
        
        cell.accessoryView = headImg;
        
        cell.accessoryType=UITableViewCellAccessoryNone;
    }else if ([type compare:[NSNumber numberWithInt:3]] == NSOrderedSame) {///3.single label
        cell.detailTextLabel.text = tempDict[@"value"];
    }else {
        cell.detailTextLabel.text = tempDict[@"value"];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
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
            clickLine = 0;
            UIActionSheet * actionSheet = [[UIActionSheet alloc] initWithTitle:@"修改头像" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"相机", @"相册选择", nil];
            [actionSheet showInView:self.view];
        }
            break;
//        case 1://姓名暂时不能修改
//            
//            break;
        case 2://modify nickname
        {
            self.what = 2;
            ModifyNicknameViewController * modifyNicknameVc = [[ModifyNicknameViewController alloc] initWithNibName:@"ModifyNicknameViewController" bundle:nil];
            [self.navigationController pushViewController:modifyNicknameVc animated:YES];
        }
            break;
        case 3: {//modify gender.
            clickLine = 3;
            UIActionSheet * actionSheet = [[UIActionSheet alloc] initWithTitle:@"修改性别" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"男", @"女", nil];
            [actionSheet showInView:self.view];
        }
            break;
            
        case 4: {//modify birthday
            clickLine = 4;
//            UIActionSheet * actionSheet = [[UIActionSheet alloc] initWithTitle:@"选择生日" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"确定", nil];
//            actionSheet.tag = 333;
//            
//            
//            [actionSheet showInView:self.view];
            UIAlertController * alertController = [UIAlertController alertControllerWithTitle:@"\n\n\n\n\n\n\n\n\n" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
            UIAlertAction     * cancelAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action){
                if ([action.title compare:@"确定"] == NSOrderedSame) {
                    UIDatePicker * picker = (UIDatePicker *)[alertController.view viewWithTag:101];
                    NSDateFormatter * formatter = [[NSDateFormatter alloc] init];
                    formatter.dateFormat = @"YYYY年MM月dd日";
                    NSString* timestamp = [formatter stringFromDate:picker.date];
                    
                    
                    NSMutableDictionary * dict = [dataList objectAtIndex:4];
                    [dict setObject:timestamp forKey:@"value"];
                    [dataList replaceObjectAtIndex:4 withObject:dict];
                    
                    [profileTable reloadData];
//                    dispatch_async(dispatch_get_main_queue(), ^{[profileTable reloadData];});
                }
                
            }];
            
            UIDatePicker * datePicker = [[UIDatePicker alloc] init];
            datePicker.tag = 101;
            datePicker.datePickerMode = UIDatePickerModeDate;
//            [actionSheet addSubview:datePicker];
            [alertController.view addSubview:datePicker];
            [alertController addAction:cancelAction];
            [self presentViewController:alertController animated:YES completion:nil];
            
            
        }
            break;
            
        case 5: {//modify class
            UIAlertController * alertController = [UIAlertController alertControllerWithTitle:@"\n\n\n\n\n\n\n\n\n" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
            UIAlertAction     * cancelAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action){}];
            UIPickerView      * pickerView   = [[UIPickerView alloc]init];
            pickerView.delegate = self;
            pickerView.dataSource = self;
            pickerView.tag = 102;
            
            [alertController.view addSubview:pickerView];
            [alertController addAction:cancelAction];
            [self presentViewController:alertController animated:YES completion:nil];

        }
            break;
            
        case 6://modify phone
        {
            ModifyPhoneViewController * modifyPhoneVc = [[ModifyPhoneViewController alloc] initWithNibName:@"ModifyPhoneViewController" bundle:nil];
            [self.navigationController pushViewController:modifyPhoneVc animated:YES];
        }
            break;
            
        case 7://modify mail
        {
            ModifyEmailViewController * modifyEmailVc = [[ModifyEmailViewController alloc] initWithNibName:@"ModifyEmailViewController" bundle:nil];
            [self.navigationController pushViewController:modifyEmailVc animated:YES];
        }
            break;
        case 8://modify password
        {
            ModifyPwdViewController * modifyPwdVc = [[ModifyPwdViewController alloc] initWithNibName:@"ModifyPwdViewController" bundle:nil];
            [self.navigationController pushViewController:modifyPwdVc animated:YES];
        }
            break;
        case 9://modify motto
        {
            ModifyMottoViewController * modifyMottoVc = [[ModifyMottoViewController alloc] initWithNibName:@"ModifyMottoViewController" bundle:nil];
            [self.navigationController pushViewController:modifyMottoVc animated:YES];
        }
            break;
        case 10://modify introduction
        {
            ModifyIntroViewController * modifyIntroVc = [[ModifyIntroViewController alloc] initWithNibName:@"ModifyIntroViewController" bundle:nil];
            [self.navigationController pushViewController:modifyIntroVc animated:YES];
        }
            break;
        default:
            
            break;
    }
}

#pragma action sheet click
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (clickLine == 0) {//modify head image
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
        }/// end switch
        
    } else if (clickLine == 3){///modify gender.
        NSString* gender = nil;
        switch (buttonIndex) {
            case 0:
                gender = @"男";
                break;
            case 1:
                gender = @"女";
                break;
            default:
                break;
        }//end switch
        
        if (gender != nil) {
            
            [dataList objectAtIndex:3][@"value"] = gender;
            
            ///get indexpath & correspond refresh row
            NSIndexPath *indexPath=[NSIndexPath indexPathForRow:3 inSection:0];
            [profileTable reloadRowsAtIndexPaths:[NSArray arrayWithObjects:indexPath,nil] withRowAnimation:UITableViewRowAnimationFade];

        }
        
    }//end modify gender;
    
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

#pragma pickerView delegate 
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 2;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    if (component == 0) {
        return [headClasses count];
    }else {
        NSInteger row = [pickerView selectedRowInComponent:0];
        NSArray * tempArr = [classes objectForKey:[headClasses objectAtIndex:row]];
        return [tempArr count];
    }
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    if (0 == component) {
        NSString * key = [headClasses objectAtIndex:row];
       return key;
    }else{
        NSInteger tempRow = [pickerView selectedRowInComponent:0];
        NSArray * tempArr = [classes objectForKey:[headClasses objectAtIndex:tempRow]];
        return tempArr[row];
    }
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    NSLog(@"didSelectRow");
}

@end
