//
//  AddPersonVC.m
//  BuildMall
//
//  Created by 51wood on 2018/11/21.
//  Copyright © 2018 51wood. All rights reserved.
//

#import "AddPersonVC.h"
#import "Product.h"
#import "DataModel.h"

#import "AddPersonResultVC.h"

#import <AddressBook/AddressBook.h>
#import <AddressBookUI/AddressBookUI.h>
/// iOS 9的新框架
#import <ContactsUI/ContactsUI.h>

#define Is_up_Ios_9      ([[UIDevice currentDevice].systemVersion floatValue]) >= 9.0


@interface AddPersonVC ()<UISearchResultsUpdating, UISearchBarDelegate,CNContactPickerDelegate>

@property (nonatomic, strong) UISearchController *searchController;
@property (nonatomic, strong) NSMutableArray *searchResults; // Filtered search results
@property (nonatomic, strong) NSMutableArray *products;

@property (nonatomic, strong)NSMutableArray* selectArray;

@property(strong,nonatomic)NSMutableArray* infoArr;

@property(retain,nonatomic)UITableView *m_tableView;




@property (weak, nonatomic) IBOutlet UIView *topView;

@end

@implementation AddPersonVC


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.navigationItem.title = @"添加联系人";
    _products = [NSMutableArray array];
    _selectArray = [NSMutableArray array];
    _infoArr = [NSMutableArray array];


    AddPersonResultVC *result = [[AddPersonResultVC alloc] init];
    result.view.frame = CGRectMake(0, 0, screenW, screenH-64);
    self.searchController = [[UISearchController alloc] initWithSearchResultsController:result];
    
    self.searchController.searchResultsUpdater = self;
    self.searchController.searchBar.placeholder = @"木聊号/手机号";
    self.searchController.searchBar.frame = CGRectMake(self.searchController.searchBar.frame.origin.x, self.searchController.searchBar.frame.origin.y, self.searchController.searchBar.frame.size.width, 44.0);
    UIImage* searchBarBg = [self GetImageWithColor:[UIColor colorWithHexString:@"F5F5F5"] andHeight:32.0f];
//    self.searchController.view.backgroundColor =[UIColor whiteColor];
    
    
    [self.searchController.searchBar setBackgroundImage:searchBarBg];
    [self.topView addSubview:self.searchController.searchBar];
    self.definesPresentationContext = YES;
    self.extendedLayoutIncludesOpaqueBars = YES;
    [self setAutomaticallyAdjustsScrollViewInsets:YES];

    NSLog(@"%f",_searchController.searchBar.height);

}


- (IBAction)phonePersonAction:(UIButton *)sender {
    
//    if (Is_up_Ios_9) {
//        CNContactStore * contactStore = [[CNContactStore alloc]init];
//        if ([CNContactStore authorizationStatusForEntityType:CNEntityTypeContacts] == CNAuthorizationStatusNotDetermined) {
//            [contactStore requestAccessForEntityType:CNEntityTypeContacts completionHandler:^(BOOL granted, NSError * __nullable error) {
//                if (error)
//                {
//                    NSLog(@"Error: %@", error);
//                }
//                else if (!granted)
//                {
//                    //iOS9 没有权限
//
//                    [self showAlert:@"请到设置>隐私>通讯录打开本应用的权限设置"];
//
//                }
//                else
//                {
//                    //iOS9 有权限
//                    //[self methodForNineOrMore];
//                }
//            }];
//        }
//        else if ([CNContactStore authorizationStatusForEntityType:CNEntityTypeContacts] == CNAuthorizationStatusAuthorized){
//
//            NSError *error = nil;
//
//            //创建数组,必须遵守CNKeyDescriptor协议,放入相应的字符串常量来获取对应的联系人信息
//            NSArray <id<CNKeyDescriptor>> *keysToFetch = @[CNContactFamilyNameKey, CNContactGivenNameKey, CNContactPhoneNumbersKey];
//            //创建获取联系人的请求
//            CNContactFetchRequest *fetchRequest = [[CNContactFetchRequest alloc] initWithKeysToFetch:keysToFetch];
//            //遍历查询
//            [self.infoArr removeAllObjects];
//
//
//            __weak typeof(self)weakSelf = self;
//            [contactStore enumerateContactsWithFetchRequest:fetchRequest error:&error usingBlock:^(CNContact * _Nonnull contact, BOOL * _Nonnull stop) {
//                if (!error) {
//
//                    NSDictionary *dic = @{@"name":contact.familyName,@"lastname":contact.givenName,@"phone":(contact.phoneNumbers.lastObject.value).stringValue};
//
//                    [weakSelf.infoArr addObject:dic];
//
//                    NSUserDefaults* user = [NSUserDefaults standardUserDefaults];
//
//                    [user setObject:weakSelf.infoArr forKey:@"user0"];
//
//                }
//                else{
//                    NSLog(@"error:%@", error.localizedDescription);
//                }
//            }];
//
//        }
//        else {
//
//            [self showAlert:@"请到设置>隐私>通讯录打开本应用的权限设置"];
//
//        }
//    }
    
    CNContactPickerViewController * contactVc = [CNContactPickerViewController new];
    contactVc.delegate = self;
    [self presentViewController:contactVc animated:YES completion:nil];
}

// 选择某个联系人时调用
- (void)contactPicker:(CNContactPickerViewController *)picker didSelectContactProperty:(CNContactProperty *)contactProperty
{
    CNContact *contact = contactProperty.contact;
    NSString *name = [CNContactFormatter stringFromContact:contact style:CNContactFormatterStyleFullName];
    CNPhoneNumber *phoneValue= contactProperty.value;
    NSString *phoneNumber = phoneValue.stringValue;
    NSLog(@"%@--%@",name, phoneNumber);
}


- (UIImage*)GetImageWithColor:(UIColor*)color andHeight:(CGFloat)height{
    
        CGRect r= CGRectMake(0.0f, 0.0f, 1.0f, height);
    
        UIGraphicsBeginImageContext(r.size);
    
        CGContextRef context = UIGraphicsGetCurrentContext();
    
        CGContextSetFillColorWithColor(context, [color CGColor]);
    
        CGContextFillRect(context, r);
    
        UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    
        UIGraphicsEndImageContext();
    
        return img;
    
}

- (void)updateSearchResultsForSearchController:(UISearchController *)searchController
{
    
//    _searchController.searchBar.height = 44;

    NSLog(@"%f",searchController.searchBar.height);
    
    searchController.searchBar.showsCancelButton = YES;
        
        for(id cc in [searchController.searchBar.subviews[0] subviews])
            {
                    if([cc isKindOfClass:[UIButton class]])
                        {
                                UIButton *btn = (UIButton *)cc;
                                [btn setTitle:@"取消" forState:UIControlStateNormal];
                    [btn setTitleColor:MINE_Color forState:UIControlStateNormal];
                }
                    
        }
    
    NSString *searchString = [self.searchController.searchBar text];
    
    NSString *scope = nil;
    
    NSInteger selectedScopeButtonIndex = [self.searchController.searchBar selectedScopeButtonIndex];
    if (selectedScopeButtonIndex > 0) {
        scope = [[Product deviceTypeNames] objectAtIndex:(selectedScopeButtonIndex - 1)];
    }
    
    [self updateFilteredContentForProductName:searchString type:scope];
    if (self.searchController.searchResultsController) {
        
        AddPersonResultVC *vc = (AddPersonResultVC *)self.searchController.searchResultsController;
        vc.searchResults = self.searchResults;
//        self.searchController.searchBar.height = 44;

        [vc.tableView reloadData];
    }
    
}

#pragma mark - Content Filtering
- (void)updateFilteredContentForProductName:(NSString *)productName type:(NSString *)typeName
{
//    _searchController.searchBar.height = 44;
    NSLog(@"%f",_searchController.searchBar.height);
    

    if ((productName == nil) || [productName length] == 0) {
        if (typeName == nil) {
            self.searchResults = [self.products mutableCopy];
        } else {
            NSMutableArray *searchResults = [[NSMutableArray alloc] init];
            for (DataModel *product in self.products) {
                [searchResults addObject:product];

                self.searchResults = searchResults;
            }
        }
        return;
    }


    [self.searchResults removeAllObjects];

    for (DataModel *product in self.products) {

        NSUInteger searchOptions = NSCaseInsensitiveSearch | NSDiacriticInsensitiveSearch;
        NSRange productNameRange = NSMakeRange(0, product.aName.length);
        NSRange foundRange = [product.aName rangeOfString:productName options:searchOptions range:productNameRange];
        if (foundRange.length > 0) {
            [self.searchResults addObject:product];
        }

    }
}


#pragma mark - UISearchBarDelegate
- (void)searchBar:(UISearchBar *)searchBar selectedScopeButtonIndexDidChange:(NSInteger)selectedScope
{
    [self updateSearchResultsForSearchController:self.searchController];
}

@end
