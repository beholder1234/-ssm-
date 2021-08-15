# 基于ssm电梯服务管理信息系统的设计与实现

![fc](https://lc-gluttony.s3.amazonaws.com/dQPTgVrFx1nP/23450af95c702ed32efa.gif/f.gif)

## 技术支持

- 开发软件：Eclipse

- 项目类型：Webapp

- 数据库：MySQL

- 数据库连接池：druid

- 框架：SSM

- 数据库设计软件：PowerDesigner

- 前端界面开发：HTML/CSS/JS,Jquery，AJAX，JSTL等 

  <font color='red'>注意：关于视图页面，个人只是基于原有界面进行修改，非完全自主开发</font>

## 项目介绍

>  是给电梯企业内部使用的一款辅助系统。是实现有数据资源，人事，电梯业务管理等业务的综合系统；

### 1. 系统模块

![image-20210305190401622](https://gitee.com/beholder1234/PersonalOnlineSource/raw/master/PictureFromTypora/image-20210305190401622.png)

### 2. 系统模块功能表

| 一级模块   | 二级模块          | 功能                                           |
| ---------- | ----------------- | ---------------------------------------------- |
| 人事管理   | 新增员工          | 添加新员工                                     |
|            | 员工管理          | 对员工信息进行修改，查询，删除                 |
|            | 帐号管理          | 对员工信息进行查询和对员工系统帐号进行密码重置 |
|            | 权限设置          | 显示和修该不同角色的系统访问权限               |
| 客户管理   | 客户列表          | 对客户进行增，删，改，查                       |
| 供应商管理 | 供应商列表        | 对供应商进行增，删，改，查                     |
| 商品管理   | 新增商品          | 添加新商入系统                                 |
|            | 商品列表          | 对商品信息进行修改，查询，删除                 |
| 业务管理   | 业务列表          | 对业务进行查询                                 |
|            | 业务分派          | 分派业务给不同员工与查询业务                   |
|            | 业务处理          | 查询业务，对业务处理和完成的系统同确定         |
| 采购管理   | 采购订单列表      | 采购订单的显示与查询                           |
|            | 采购申请          | 新建采购订单，提交录入系统                     |
|            | 采购审核          | 显示与查询订单和采购订单审核                   |
|            | 采购处理          | 显示查询订单和采购完成的确定                   |
| 销售管理   | 销售订单列表      | 销售订单的显示与查询                           |
|            | 销售申请          | 新建销售订单，提交录入系统                     |
|            | 销售审核          | 显示与查询订单和对销售订单进行审核             |
|            | 销售处理          | 显示与查询订单和对销售订单完成的确定           |
| 库存管理   | 商品库存列表      | 显示与查询库存列表                             |
|            | 商品出入库        | 完成对商品的出入库操作                         |
| 系统设置   | 个人信息          | 显示当前系统用户的个人信息                     |
|            | 密码修改          | 修改当前系统用户的密码                         |
|            | 系统账号登陆/退出 |                                                |

### 3. 数据库系统

![image-20210305191652471](https://gitee.com/beholder1234/PersonalOnlineSource/raw/master/PictureFromTypora/image-20210305191652471.png)



###  4. 电梯企业主要业务流程图

#### （1）电梯业务

> 电梯业务主要有安装，安检和年审三类，安装是在整机销售通过审核后生成的，而安检和年审是根据处理时间提前几天或几个月自动生成的。有管理层的技术总监来分派业务给技术员，最后由技术处理完成。

<img src="https://gitee.com/beholder1234/PersonalOnlineSource/raw/master/PictureFromTypora/image-20210305190853819.png" alt="image-20210305190853819" style="zoom:50%;" />

#### （2）销售流程图

> 销售业务流程是指电梯企业对整机与电梯零件的销售过程，首先，业务部的职员申请销售单，填写销售客户，所销售商品和销售数量与单格后提交给系统，由销售经理通过审核，其中若库存量小于要求量时，则要完成相应商品的采购入库。商品出库，完成商品销售

<img src="https://gitee.com/beholder1234/PersonalOnlineSource/raw/master/PictureFromTypora/image-20210305191043233.png" alt="image-20210305191043233" style="zoom: 50%;" />



#### （3）采购流程图



> 采购业务流程是指对电梯或相关零件的采购过程，首先由销售部职员申请销售单，在填入供应商信息，商品和采购数量与单价后提交给系统，采购经理对订单进行审核，然后由采购员进行采购，由货运员取货并运到相应仓库，最后由库管员入库，完成商品采购。

<img src="https://gitee.com/beholder1234/PersonalOnlineSource/raw/master/PictureFromTypora/image-20210305191241220.png" alt="image-20210305191241220" style="zoom: 50%;" />

## 5. 图形界面

#### （1）登陆界面

<img src="https://gitee.com/beholder1234/PersonalOnlineSource/raw/master/PictureFromTypora/image-20210305192556001.png" alt="image-20210305192556001" style="zoom:50%;" />

#### （2）操作界面

<img src="https://gitee.com/beholder1234/PersonalOnlineSource/raw/master/PictureFromTypora/image-20210305192659899.png" alt="image-20210305192659899" style="zoom:50%;" />


#### （3）界面操作——员工增删

![f2](https://lc-gluttony.s3.amazonaws.com/dQPTgVrFx1nP/3fb11031231248cfab91.gif/f2.gif)
