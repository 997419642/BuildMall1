//
//  OrderDBTool.m
//  BuildMall
//
//  Created by 51wood on 2019/1/4.
//  Copyright © 2019 51wood. All rights reserved.
//

#import "OrderDBTool.h"
#import "OrderDBModel.h"

@interface OrderDBTool ()

@property (strong , nonatomic) DataBaseTool *dbTool;


@end
static id _instance;

@implementation OrderDBTool

+ (instancetype)shareInstance
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[self alloc] init];
    });
    
    return _instance;
}

- (instancetype)init
{
    if (self = [super init]) {
        NSString *dbName = @"fundingSys.db";
        NSString *directory = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
        NSString *dbPath = [directory stringByAppendingPathComponent:dbName];
        NSLog(@"%@",dbPath);
        _dbTool = [[DataBaseTool alloc] initWithPath:dbPath];
    }
    return self;
}

- (void)createTable
{
    NSString *sql = @"CREATE TABLE 'OrderDBModel' ('Id' INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL UNIQUE, 'norderDetailId' TEXT, 'nbuyNumber' TEXT, 'nbuyPrice' TEXT, 'nunitNum' TEXT, 'ngoodsId' TEXT, 'nstockNum' TEXT, 'nlockNum' TEXT, 'ngoodsNuit' TEXT, 'npackages' TEXT, 'ngenshu' TEXT, 'nhoudu' TEXT, 'nkuandu' TEXT, 'nchangdu' TEXT, 'nshuzhong' TEXT, 'npinpai' TEXT, 'ndengji' TEXT, 'nisCus' TEXT, 'ncangku' TEXT, 'ncategoryId' TEXT);";
    if (![_dbTool tableExists:@"OrderDBModel"]) {
        [_dbTool executeUpdate:sql param:nil];
    }
    else
    {
        NSLog(@"OrderDBModel表已经存在");
    }
    
    
}

- (void)insertModel:(OrderDBModel *)noticeModel
{
    NSString *sql = @"insert into OrderDBModel( norderDetailId, nbuyNumber, nbuyPrice, nunitNum, ngoodsId, nstockNum, nlockNum, ngoodsNuit, npackages, ngenshu, nhoudu, nkuandu, nchangdu, nshuzhong, npinpai, ndengji, nisCus, ncangku, ncategoryId) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
    NSArray *param = @[noticeModel.orderDetailId,noticeModel.buyNumber,noticeModel.buyPrice,noticeModel.unitNum,noticeModel.goodsId,noticeModel.stockNum,noticeModel.lockNum,noticeModel.goodsNuit,noticeModel.packages,noticeModel.genshu,noticeModel.houdu,noticeModel.kuandu,noticeModel.changdu,noticeModel.shuzhong,noticeModel.pinpai,noticeModel.dengji,noticeModel.isCus,noticeModel.cangku,noticeModel.categoryId];
    if([_dbTool executeUpdate:sql param:param]){
        NSLog(@"插入数据成功");
    }
    else
    {
        NSLog(@"插入数据失败");
    }
}

-(void)deleteModelWithkey:(NSString *)key value:(NSString *)value{
    NSString *sql = [NSString stringWithFormat:@"delete from OrderDBModel where %@ = %@",key,value];
    if ([_dbTool executeUpdate:sql param:nil]) {
        NSLog(@"删除成功");
    }
    else
    {
        NSLog(@"删除失败");
    }
}

-(void)updateModelWithkey:(NSString *)key value:(NSString *)value nId:(NSString *)nId{
    NSString *sql = [NSString stringWithFormat:@"update OrderDBModel set %@ = '%@' where Id = %@",key,value,nId];
    if ([_dbTool executeUpdate:sql param:nil]) {
        NSLog(@"修改成功");
    }
    else
    {
        NSLog(@"修改失败");
    }
}

- (NSArray *)selectAllModel
{
    return [_dbTool executeQuery:@"select * from OrderDBModel" withArgumentsInArray:nil modelClass:[OrderDBModel class]];
}

- (OrderDBModel *)selectLocalNoticeModelWithNoticeId:(NSString *)noticeId
{
    NSString *sql = [NSString stringWithFormat:@"select * from OrderDBModel where Id = %@",noticeId];
    NSArray *arr = [_dbTool executeQuery:sql withArgumentsInArray:nil modelClass:[OrderDBModel class]];
    OrderDBModel *model = [[OrderDBModel alloc]init];
    NSDictionary *dict = arr[0];
    model.noticeId = [dict valueForKey:@"noticeId"];
    model.orderDetailId = [dict valueForKey:@"orderDetailId"];
    model.buyNumber = [dict valueForKey:@"buyNumber"];
    model.buyPrice = [dict valueForKey:@"buyPrice"];
    model.unitNum = [dict valueForKey:@"unitNum"];
    model.goodsId = [dict valueForKey:@"goodsId"];
    model.stockNum = [dict valueForKey:@"stockNum"];
    model.lockNum = [dict valueForKey:@"lockNum"];
    model.goodsNuit = [dict valueForKey:@"goodsNuit"];
    model.packages = [dict valueForKey:@"packages"];
    model.genshu = [dict valueForKey:@"genshu"];
    model.houdu = [dict valueForKey:@"houdu"];
    model.kuandu = [dict valueForKey:@"kuandu"];
    model.changdu = [dict valueForKey:@"changdu"];
    model.shuzhong = [dict valueForKey:@"shuzhong"];
    model.pinpai = [dict valueForKey:@"pinpai"];
    model.dengji = [dict valueForKey:@"dengji"];
    model.isCus = [dict valueForKey:@"isCus"];
    model.cangku = [dict valueForKey:@"cangku"];
    model.categoryId = [dict valueForKey:@"categoryId"];

    return model;
}

- (void)dropTable{
    if([_dbTool dropTable:@"OrderDBModel"])
    {
        NSLog(@"删除成功");
    }
    else
    {
        NSLog(@"删除失败");
    }
}

@end
