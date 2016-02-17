/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2016/2/17 17:32:44                           */
/*==============================================================*/


drop table if exists customer;

drop table if exists customertriprecord;

drop index dsinstructor_pk on instructor;

drop table if exists instructor;

drop table if exists traingrecord;

drop table if exists traininglog;

drop table if exists triprecord;

drop table if exists boat;

drop table if exists book;

drop table if exists bookitem;

drop index captain_pk on captain;

drop table if exists captain;

drop table if exists employee;

drop table if exists feedback;

drop table if exists gear;

drop table if exists gearrecord;

drop table if exists project;

drop table if exists r_user_role;

drop table if exists role;

drop table if exists schedule;

drop table if exists trip;

/*==============================================================*/
/* Table: customer                                              */
/*==============================================================*/
create table customer
(
   id                   int not null auto_increment,
   passportno           varchar(32),
   cname                varchar(32),
   password             char(32),
   ename                varchar(64),
   gender               char(1),
   birth                date,
   weixin               varchar(64),
   mobile               varchar(18),
   email                varchar(255),
   primary key (id)
);

alter table customer comment '�ͻ���Ϣ';

/*==============================================================*/
/* Table: customertriprecord                                    */
/*==============================================================*/
create table customertriprecord
(
   id                   smallint,
   c_id                 int,
   t_id                 int
);

alter table customertriprecord comment '�г̿ͻ�����';

/*==============================================================*/
/* Table: instructor                                            */
/*==============================================================*/
create table instructor
(
   id                   smallint not null,
   cno                  varchar(32),
   name                 varchar(32),
   gender               char(1),
   birth                date,
   intro                text,
   primary key (id)
);

alter table instructor comment '����';

/*==============================================================*/
/* Index: dsinstructor_pk                                       */
/*==============================================================*/
create unique index dsinstructor_pk on instructor
(
   id
);

/*==============================================================*/
/* Table: traingrecord                                          */
/*==============================================================*/
create table traingrecord
(
   id                   int not null,
   c_id                 int,
   i_id                 smallint,
   trainingdate         date,
   status               tinyint,
   primary key (id)
);

alter table traingrecord comment '������ѵ��¼';

/*==============================================================*/
/* Table: traininglog                                           */
/*==============================================================*/
create table traininglog
(
   id                   int not null,
   l_id                 int,
   content              text,
   createtime           timestamp,
   primary key (id)
);

alter table traininglog comment '������ѵ��־';

/*==============================================================*/
/* Table: triprecord                                            */
/*==============================================================*/
create table triprecord
(
   t_id                 int,
   e_id                 smallint,
   jobdutie             varchar(255)
);

alter table triprecord comment '�г���Ա���ż�¼';

/*==============================================================*/
/* Table: boat                                                  */
/*==============================================================*/
create table boat
(
   id                   smallint not null,
   bname                varchar(32),
   bno                  varchar(32),
   primary key (id)
);

alter table boat comment '��';

/*==============================================================*/
/* Table: book                                                  */
/*==============================================================*/
create table book
(
   id                   int not null auto_increment,
   c_id                 int,
   orderdate            timestamp,
   status               tinyint comment '1 ����ͻ�ԤԼ 2 ����ͷ��ظ�ȷ�Ͽ����޸� 3 ����ͻ�ȷ�� 4 ����ͻ�ȷ�ϲ����� 5 ����ԤԼ��� ',
   primary key (id)
);

alter table book comment 'ԤԼ��';

/*==============================================================*/
/* Table: bookitem                                              */
/*==============================================================*/
create table bookitem
(
   id                   int not null auto_increment,
   c_id                 int not null,
   p_id                 smallint,
   b_id                 int not null,
   targetdate           timestamp,
   rating               tinyint,
   review               varchar(255),
   primary key (id)
);

alter table bookitem comment 'Ԥ����Ŀ';

/*==============================================================*/
/* Table: captain                                               */
/*==============================================================*/
create table captain
(
   id                   smallint not null,
   license              varchar(32),
   primary key (id)
);

alter table captain comment '��ֻ��ʻԱ';

/*==============================================================*/
/* Index: captain_pk                                            */
/*==============================================================*/
create unique index captain_pk on captain
(
   id
);

/*==============================================================*/
/* Table: employee                                              */
/*==============================================================*/
create table employee
(
   id                   smallint not null,
   loginname            varchar(32),
   realname             varchar(32),
   password             char(32),
   email                varchar(255),
   weixin               varchar(64),
   mobile               varchar(13),
   primary key (id)
);

alter table employee comment 'Ա��';

/*==============================================================*/
/* Table: feedback                                              */
/*==============================================================*/
create table feedback
(
   id                   int not null,
   l_id                 int,
   content              text,
   createtime           timestamp,
   primary key (id)
);

alter table feedback comment 'ѧԱ����';

/*==============================================================*/
/* Table: gear                                                  */
/*==============================================================*/
create table gear
(
   id                   smallint not null,
   gno                  varchar(32),
   name                 varchar(32),
   price                float,
   buydate              date,
   primary key (id)
);

alter table gear comment '�豸';

/*==============================================================*/
/* Table: gearrecord                                            */
/*==============================================================*/
create table gearrecord
(
   id                   int not null,
   t_id                 int,
   e_id                 smallint,
   g_id                 smallint,
   gtime                timestamp,
   btime                timestamp,
   primary key (id)
);

alter table gearrecord comment '�豸��ȡ����¼';

/*==============================================================*/
/* Table: project                                               */
/*==============================================================*/
create table project
(
   id                   smallint not null auto_increment,
   projectname          varchar(32),
   content              varchar(255),
   price                float,
   remark               varchar(255),
   primary key (id)
);

alter table project comment '������Ŀ';

/*==============================================================*/
/* Table: r_user_role                                           */
/*==============================================================*/
create table r_user_role
(
   id                   smallint not null,
   r_id                 tinyint not null,
   primary key (id, r_id)
);

alter table r_user_role comment 'Ա����ɫ��ϵ';

/*==============================================================*/
/* Table: role                                                  */
/*==============================================================*/
create table role
(
   id                   tinyint not null,
   rolename             varchar(32),
   duties               varchar(255),
   primary key (id)
);

alter table role comment '��ɫ';

/*==============================================================*/
/* Table: schedule                                              */
/*==============================================================*/
create table schedule
(
   id                   tinyint not null auto_increment,
   dayofweek            tinyint,
   islands              varchar(64),
   primary key (id)
);

alter table schedule comment '�ճ̱�';

/*==============================================================*/
/* Table: trip                                                  */
/*==============================================================*/
create table trip
(
   id                   int not null,
   b_id                 smallint,
   s_id                 tinyint,
   tripdate             date,
   amount               tinyint,
   primary key (id)
);

alter table trip comment '�г�';

alter table customertriprecord add constraint fk_r_customer_trip_record foreign key (c_id)
      references customer (id) on delete restrict on update restrict;

alter table customertriprecord add constraint fk_r_trip_customer_record foreign key (t_id)
      references trip (id) on delete restrict on update restrict;

alter table customertriprecord add constraint fk_r_trip_project foreign key (id)
      references project (id) on delete restrict on update restrict;

alter table traingrecord add constraint fk_r_customer_training foreign key (c_id)
      references customer (id) on delete restrict on update restrict;

alter table traingrecord add constraint fk_r_instructor_customer foreign key (i_id)
      references instructor (id) on delete restrict on update restrict;

alter table traininglog add constraint fk_relationship_20 foreign key (l_id)
      references traingrecord (id) on delete restrict on update restrict;

alter table triprecord add constraint fk_r_employee_trip foreign key (e_id)
      references employee (id) on delete restrict on update restrict;

alter table triprecord add constraint fk_r_trip_record foreign key (t_id)
      references trip (id) on delete restrict on update restrict;

alter table book add constraint fk_r_customer_book foreign key (c_id)
      references customer (id) on delete restrict on update restrict;

alter table bookitem add constraint fk_r_book_item foreign key (b_id)
      references book (id) on delete restrict on update restrict;

alter table bookitem add constraint fk_r_customer_item foreign key (c_id)
      references customer (id) on delete restrict on update restrict;

alter table bookitem add constraint fk_r_item_service foreign key (p_id)
      references project (id) on delete restrict on update restrict;

alter table employee add constraint fk_r_employee_captain foreign key (id)
      references captain (id) on delete restrict on update restrict;

alter table employee add constraint fk_r_employee_instructor foreign key (id)
      references instructor (id) on delete restrict on update restrict;

alter table feedback add constraint fk_relationship_21 foreign key (l_id)
      references traingrecord (id) on delete restrict on update restrict;

alter table gearrecord add constraint fk_r_employee_gear foreign key (e_id)
      references employee (id) on delete restrict on update restrict;

alter table gearrecord add constraint fk_r_gear_record foreign key (g_id)
      references gear (id) on delete restrict on update restrict;

alter table gearrecord add constraint fk_r_trip_equipment foreign key (t_id)
      references trip (id) on delete restrict on update restrict;

alter table r_user_role add constraint fk_r_user_role foreign key (id)
      references employee (id) on delete restrict on update restrict;

alter table r_user_role add constraint fk_r_user_role2 foreign key (r_id)
      references role (id) on delete restrict on update restrict;

alter table trip add constraint fk_r_boat_trip foreign key (b_id)
      references boat (id) on delete restrict on update restrict;

alter table trip add constraint fk_r_trip_schedule foreign key (s_id)
      references schedule (id) on delete restrict on update restrict;

