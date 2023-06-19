create table equipment_scheduling
(
    id                         int auto_increment
        primary key,
    Equipment_number           varchar(6)  null,
    Equipment_model            varchar(16) null,
    Equipment_name             varchar(30) null,
    Owning_workshop            varchar(10) null,
    Equipment_location         varchar(10) null,
    Maintenance_cycle          varchar(6)  null,
    Scheduled_maintenance_date date        null,
    Actual_maintenance_date    date        null,
    Responsible_person         varchar(16) null,
    member                     varchar(64) null,
    Schedule_time              varchar(6)  null,
    state                      int         null
)
    comment '设备排程';

create table menu_permission
(
    id               int auto_increment comment '菜单权限表主键'
        primary key,
    menu_name        varchar(20) null comment '菜单名',
    parent_menu_name varchar(20) null comment '父菜单名',
    url              varchar(50) null comment '地址',
    pid              int         null comment '标识'
)
    comment '菜单权限表';

create table operation_permissions
(
    id             int auto_increment comment '操作权限表主键'
        primary key,
    operation_name varchar(20) null comment '操作名',
    method_type    varchar(20) null comment '方法',
    url            varchar(50) null comment '地址',
    pid            int         null comment '标识'
)
    comment '操作权限表';

create table role
(
    id        int auto_increment comment '角色表主键'
        primary key,
    role_name varchar(20) null comment '角色名'
)
    comment '角色表';

create table role_menu_link
(
    role_menu_link_id int auto_increment comment '权限角色表主键'
        primary key,
    role_id           int null comment '角色外键',
    menu_id           int null comment '权限外键',
    constraint menu_role_link_fk
        foreign key (menu_id) references menu_permission (id)
            on delete cascade,
    constraint role_menu_link_fk
        foreign key (role_id) references role (id)
            on delete cascade
)
    comment '权限角色表';

create table role_operation_link
(
    role_operation_link_id int auto_increment comment '角色与操作权限表主键'
        primary key,
    role_id                int null comment '角色外键',
    operation_id           int null comment '操作权限外键',
    constraint operation_role_link_fk
        foreign key (operation_id) references operation_permissions (id)
            on delete cascade,
    constraint role_operation_link_fk
        foreign key (role_id) references role (id)
            on delete cascade
)
    comment '角色与操作权限外键表';

create table user
(
    id       int auto_increment comment '用户表主键'
        primary key,
    username varchar(20) null comment '用户名',
    password varchar(20) null comment '密码'
)
    comment '用户表';

create table user_role_link
(
    user_role_link_id int auto_increment comment '用户与角色外键表主键'
        primary key,
    user_id           int null comment '用户外键',
    role_id           int null comment '角色外键',
    constraint user_role_link_pk
        unique (user_id),
    constraint role_user_link_fk
        foreign key (role_id) references role (id)
            on delete cascade,
    constraint user_role_link__fk
        foreign key (user_id) references user (id)
            on delete cascade
)
    comment '用户与角色外键表';


