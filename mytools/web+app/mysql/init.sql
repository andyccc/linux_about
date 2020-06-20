create table testdata (id int not null auto_increment primary key,foo varchar(25),bar int);
insert into testdata values(null, 'hello', 12345);
insert into testdata values(null, 'world', 56789);
insert into testdata values(null, 'other1', 100000);
insert into testdata values(null, 'other2', 200000);
insert into testdata values(null, 'other3', 300000);
insert into testdata values(null, 'other4', 400000);
insert into testdata values(null, 'other5', 500000);
insert into testdata values(null, 'other6', 600000);
insert into testdata values(null, 'other7', 700000);
insert into testdata values(null, 'other8', 800000);
insert into testdata values(null, 'other9', 900000);
insert into testdata values(null, 'other10', 1000000);
insert into testdata values(null, 'other11', 1100000);
insert into testdata values(null, 'other12', 1200000);
insert into testdata values(null, 'other13', 1300000);
insert into testdata values(null, 'other14', 1400000);
insert into testdata values(null, 'other15', 1500000);
insert into testdata values(null, 'other16', 1600000);
insert into testdata values(null, 'other17', 1700000);
insert into testdata values(null, 'other18', 1800000);
insert into testdata values(null, 'other19', 1900000);
insert into testdata values(null, 'other20', 2000000);
insert into testdata values(null, 'other21', 2100000);
insert into testdata values(null, 'other22', 2200000);

# show full columns from channel_auth;
CREATE TABLE channel_auth
(
  id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  name VARCHAR(250) NOT NULL comment '渠道名称',
  code VARCHAR(250) NOT NULL comment '认证-渠道编码',
  pwd VARCHAR(10) NOT NULL comment 'secretkey 渠道秘钥，也是盐值',

  token VARCHAR(32) NOT NULL comment '废弃，认证-渠道令牌生成机制;md5(code+ip+pwd)',
  token_expire INT NOT NULL comment '渠道有效时间,默认90天',

  iplist VARCHAR(250) NOT NULL comment '渠道服务器ip 地址列表',

  ip_bind_time INT NOT NULL comment '封禁IP时间,默认300秒',
  ip_time_out INT NOT NULL comment '指定ip访问频率时间段,默认60秒',
  connect_count INT NOT NULL comment '指定ip访问频率计数最大值,默认100次/分钟',

  limit_bandwidth INT NOT NULL comment '渠道分配带宽',

  save_host VARCHAR(32) NOT NULL comment '存储IP',
  save_port VARCHAR(32) NOT NULL comment '存储端口',

  status  INT DEFAULT 0 NOT NULL COMMENT '是否生效,0/1  未生效/生效'

) comment '渠道认证表';

insert into channel_auth values(1,'test','test','test',md5('testtest192.168.59.103bonc1234'),1,'192.168.59.103',300,60,100,10,'127.0.0.1',19000,1);

# --验证ip 地址与渠道号是否一致；
# --验证渠道号与账号是否一致；
# --验证渠道号+账号+ip地址+bonc1234 与令牌是否一致  [数据库的令牌，或者nginx 实时计算]
# --ip 并发控制+redis

