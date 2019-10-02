CREATE DATABASE seckill;

use seckill;

CREATE TABLE seckill (
    `seckill_id` BIGINT NOT NUll AUTO_INCREMENT COMMENT 'ID',
    `name` varchar(120) NOT NULL COMMENT 'name of item',
    `number` int NOT NULL COMMENT '',
    `start_time` timestamp NOT NULL COMMENT 'seckill start time',
   `end_time`   TIMESTAMP   NOT NULL COMMENT 'seckill end time',
    `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'create time',
    PRIMARY KEY (seckill_id),
    key idx_start_time(start_time),
    key idx_end_time(end_time),
    key idx_create_time(create_time)
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8 COMMENT='秒杀库存表';

insert into seckill (name, number, start_time, end_time)
values
    ('1000元秒杀iphone6', 100, '2015-11-01 00:00:00', '2015-11-02 00:00:00'),
    ('500元秒杀ipad2', 200, '2015-11-01 00:00:00', '2015-11-02 00:00:00'),
    ('300元秒杀xiaomi4', 300, '2015-11-01 00:00:00', '2015-11-02 00:00:00'),
    ('200元秒杀redmi note', 400, '2015-11-01 00:00:00', '2015-11-02 00:00:00');

create table success_killed (
    `seckill_id` bigint NOT NULL COMMENT 'seckill item id',
     `user_phone` bigint NOT NULL COMMENT '',
     `state` tinyint NOT NULL DEFAULT -1 COMMENT 'state:-1:invalid 0:success 1:paid 2:delivered',
     `create_time` timestamp NOT NULL COMMENT '创建时间',
    PRIMARY KEY (seckill_id,user_phone), /* */
    key idx_create_time (create_time)

) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8 COMMENT='秒杀成功明细表';
