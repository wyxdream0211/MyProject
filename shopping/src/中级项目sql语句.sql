
CREATE TABLE users (
  userid number(20)  NOT NULL,
  username varchar(32) NOT NULL,
  password varchar(32) NOT NULL,
  street1 varchar(64) default NULL,
  street2 varchar(64) default NULL,
  city varchar(32) default NULL,
  zip varchar(8) default NULL,
  email varchar(32) default NULL,
  homephone varchar(16) default NULL,
  cellphone varchar(16) default NULL,
  officephone varchar(16) default NULL,
  PRIMARY KEY  (userid)
)

create sequence userid increment by 1 start with 1 maxvalue 9999999999999999999999999999 nocycle nocache 

select * from userss

 
CREATE TABLE product (
  productid number(20)  NOT NULL ,
  name varchar(64) NOT NULL,
  description varchar(2000) default NULL,
  baseprice number(20,2) NOT NULL,
  writer varchar(32) default NULL,
  publish varchar(64) default NULL,
  pages number(8) default NULL,
  images varchar(100) default NULL,
  PRIMARY KEY  (productid)
)
select * from product

create sequence productid increment by 1 start with 1 
maxvalue 9999999999999999999999999999 nocycle nocache 

CREATE TABLE orders  (
  orderid number(20)  NOT NULL ,
  cost number(15,3) default NULL,
  payType varchar(16) default NULL,
  userid number(20)  default NULL,
  status varchar(20) default NULL,
  time date default NULL,
  PRIMARY KEY  (orderid),
  CONSTRAINT orders_ibfk_1 FOREIGN KEY (userid) REFERENCES users(userid) ON DELETE SET NULL
)

create sequence orderid increment by 1 start with 1 maxvalue 9999999999999999999999999999 nocycle nocache
select * from orders
drop table orderline
CREATE TABLE orderline (
  lineid number(20)  NOT NULL ,
  orderid number(20)  default NULL,
 productid number(20)  default NULL,
  baseprice number(20,2) NOT NULL,
  num number(20) NOT NULL,
  PRIMARY KEY  (lineid),

  CONSTRAINT orderline_ibfk_1 FOREIGN KEY (orderid) REFERENCES orders (orderid) ON DELETE CASCADE ,
  CONSTRAINT orderline_ibfk_2 FOREIGN KEY (productid) REFERENCES product (productid) ON DELETE CASCADE 
)

create sequence orderlineid increment by 1 start with 1 maxvalue 9999999999999999999999999999 nocycle nocache




INSERT INTO product VALUES ('1', 'JAVA���˼�룺��3��', '�ӱ����õĸ�����Լ�����������صĶ��������У����ѿ�������һ������֮�������������ж���Ľ�ѧ���飬��C��C++��Java���Զ��ж������������⡣������ǳ��˽���ν���Java�������ſγ̣�Ҳ�ǳ��������Խ�ѧ�е��ѵ㼰���ǵ�����������ͨ���׶���С��ֱ�ӵ�ʾ��������һ������ɬ����ĸ������ѡȡ���Զ������Java������˵��Ϊ��Ҫ���Ĳ��ֱ�д���顣ͬʱ��������������ṩ�˴����ο����ϡ���Ҳ�Ǳ�������ﳬ��ֵ�ĵط���\r\n�������û�а��������Դ���루���Դ�֧����վwww.MindView.net������أ��������ṩ�˴������߽��ڵ����ۿ����ݼ������ǰ2�����ݡ�\r\n�������ݷḻ����Java�Ļ����﷨����߼����ԣ��ʺϸ���ε�Java����Ա�Ķ���ͬʱҲ�Ǹߵ�ԺУ��������������������Լ�Java���Եľ��ѽ̲ġ�', '95.00', '������Bruce Eckel', '��е��ҵ������', '796', 'images/product/zcover.gif');
INSERT INTO product VALUES ('2', '��ͨHibernate��Java����־û��������', '���������ٵļ�����鼮 �����ĵ�:<br>\r\n�������˵��Ľṹ�ñȷ��ݵĿ�ܣ����������ñȷ��ݵľ������Ԫ�ء������������ݵ���ʽ��Ϊ�����֡� ���ͼ�ͷ�����Ϊ�˰�ĳ��֪ʶ�������������Ҫ�ۺ�ʹ����������ʽ��Ԫ��......\r\n:<br>\r\n�����̡�Tomcat �� Java Web�����������(������)���͡���ͨStruts������MVC��Java Web����뿪��(������)��֮��Ӧ�����ߵ�ǿ��Ҫ�������ٵ���һ��������ͨHibernate��Java����־û�������⡷��������ӭ�����е�׼�����С�\r\nHibernate��һ������Java�Ŀ���Դ����ĳ־û��м��������JDBC������������װ�������ṩORMӳ����񣬻��ṩ���ݲ�ѯ�����ݻ��湦�ܣ�Java������Ա���Է����ͨ��Hibernate API���������ݿ⡣\r\n���ڣ�Խ��Խ���Java������Ա��Hibernate��Ϊ��ҵӦ�ú͹�ϵ���ݿ�֮����м�����Խ�ʡ�Ͷ���־û��йص�30%��JDBC��̹������� 2005�꣬Hibernate��Ϊ���������������ٻ��˵�15��Jolt�󽱡�Hibernate֮�����ܹ����У��鹦�������е����ơ�<br>\r\n���������ϴ������͵�ʵ������ϸ����������Ŀǰ������Hibernate2.1�汾����Java����־û��ļ�����Hibernate������Java ����ģ�ͺ͹�ϵ����ģ�͵�������ͨ�����飬���߲�����������Hibernate���߶�������ģ�ͽ���ӳ��ļ��������ܻ������뿪��Java����ģ�ͺ͹�ϵ����ģ�͵��Ƚ����顣', '59.00', '������', '���ӹ�ҵ������', '600', 'images/product/zcover2.gif');
INSERT INTO product VALUES ('3', 'Java 2���ļ�������6�棩 ��I������֪ʶ ', '    ������Ѿ���Java����Ա�����˽�Java���������ԣ�����ô����?ȥ��һ����ߵ�Javaר�ң����ǻ�����㣺��Java���ļ�����ͨ���ṩʵսָ�����ܹ�ʹ���������Java���裬��������ս�Ե�������Ҳ������������7�������緶Χ�ڳ�Ϊ����鼮��ԭ��<br>\r\n��������ȫ�潲���˱�׼ Java 2 1��4�汾�Ļ���֪ʶ�������˴�������ʽ��������I��O��������Ҫ�����ԡ������ܹ�����������������Javaƽ̨�����ľ���������Լ�ȫ������˵� Swing�û����濪���������������ݡ�����Ҫ���ǣ���6������˸���ֵ��������ʵ�ó���(����һֱ��������Щʵ�ó��������)�����ҽ����˸��£���ӳ�������SDK���Ժͷ�չ!<br>\r\n��������ΪJavaƽ̨�������ṩ����������Ϣ��<br>\r\n������Swing GUI������������������֤��������ǿ����<br>\r\n�����񿪷��ɿ����롪��������ʽ�쳣��ջ֡�����Ժ���־<br>\r\n�������µĸ����ܵ�I��O API�����ڴ�ӳ���ļ����ļ��������ַ������룯����<br>\r\n������ʹ�����µĹ���ǿ���java��utiI��regex����������ʽ<br>\r\n������Java 1��4ƽ̨���������ࣺ�µĿ�ƽ̨��������Ϣ�洢��<br>\r\n������̬�����ࡢ�ڲ��ࡢJavaƽ̨�¼�ģ�͡������ļ������Լ���������<br>\r\n���߼�飺<br>\r\n����CayS��Horstmann��ʥ����������ѧ�ļ������ѧ���ڣ���C++��Java��������󿪷������Ѿ���6�������� GaryCornell�ǿ����Ҹ��ѧ�Ľ��ڣ�Ҳ�ǹ�󿪷���Աϲ���ļ������ң�������������ܺ������������������˴����������ļ��������ͼ������� Apress��', '75.00', '(��)Gary Cornell', '��е��ҵ������', '698', 'images/product/zcover3.gif');
INSERT INTO product VALUES ('4', 'Effective Java���İ�', '���������������Java�����57������ʵ�ü�ֵ�ľ��������Щ������򺭸��˴����������Աÿ�������ٵ�����Ľ��������ͨ����Javaƽ̨���ר����ʹ�õļ�����ȫ����������ʾ��Ӧ����ʲô����Ӧ����ʲô���ܲ�����������׳�͸�Ч�Ĵ��롣 �����е�ÿ�������Լ�̡�������С������ʽ���֣���ЩС���°�������ϸ����ȷ�Ľ��飬�Լ������������ϸ΢֮���������������ͨ�����Ӵ�����Խ�һ��˵�����ᴩȫ�����ͨ�õ������÷������ģʽ���Լ�һЩ������������ļ��ɺͼ�����<br>\r\n<br>\r\n����������ϣ��10��ǰ�Ҿ���ӵ���Ȿ�顣�������˻���Ϊ�Ҳ���Ҫ�κι���Java���鼮��������ȷʵ��Ҫ�Ȿ�顣��<br> ����������������������������������������James Gosling��Java֮����Sun��˾���ܲ�<br>\r\n<br>\r\n��������һ���ǳ�������飬�����˸��ֹ���ʹ��Java����������Ժ�������������ƵĺõĽ��顣��<br>\r\n���������������������������������������� ����Gilad Bracha, Sun��˾�������ѧ�ң���The Java TM Language Specificationy����Second Edition��������֮һ ', '39.00', '(��)Joshua Bloch', '��е��ҵ������', '214', 'images/product/zcover4.gif');
INSERT INTO product VALUES ('5', 'Java��ģʽ', '������һ���������ԭ���Լ���Ϊ���������ģʽ��ʵ�ý̲ģ�Ŀ����Ϊ������æ��Javaϵͳ���ʦ�ṩһ�����ٶ�׼ȷ�����ԭ������ģʽ�ĸ����������Ϊ55�£�ÿһ���½ڽ���һ�����ģʽ��˵����ģʽ�����⡢�ṹ���Լ���һģʽ�ʺ���ʲô��������ȡ�ÿһ���½ڶ����ж�����Ӻ���ϰ�⣬��ϰ��Щ���ӡ������Щ��ϰ����԰������߸��õ�������������ݡ���������½ڶ�����Զ����ģ����߿��Դ򿪱��飬���κ�һ�¿�ʼ����Ϊ�����㲻ͬ�̶ȵĶ��ߵ���Ҫ�������ṩ��һЩ��Ϊ��ר�⡱���½ڣ����Ķ���Щ�½ڣ����Ķ�����ı�׼�½�û��Ӱ�졣��������֮�󣬶��߿��Ժ��������ĵ����Լ���ϵͳ��ƹ�����ʹ��ѧ�������ݣ���ͬ�½�������������ƾ��飬������ҵ��չ���и�����ջ񡣱����ʺ���Java����Ա���ܹ����ʦ�����ģʽ�����ߣ���һ��ʵ�õ����ԭ������ģʽ����ѧ�̲ĺ�ʹ���ֲ�', '88.00', '�ֺ�', '���ӹ�ҵ������', '1024', 'images/product/zcover5.gif');
INSERT INTO product VALUES ('6', '����ǳ��Hibernate', '�����ɻ�������Ӱ��㷺�Ŀ����ĵ�OpenDocϵ�����������׷��ĵ���Hibernate����ָ�ϡ���չ�������ڱ�д�����У����������¹�˼����֯��ͬʱ�����ݵ�������Ƚ������ص�ǿ��������ӳ־ò����֣���������/��ϵ���ݿ�ӳ����������������۽���Ŀǰ�����ơ���ǿ����ORM��Ʒ���� Hibernate����һ�������������֣�����Hibernate�Ļ����﷨�����ã��������ߵ����桢�ӳټ��صȸ߼����ԡ�������������ǳ�����Ƚ����־ò������ORM������Hibernate������Hibernate����Hibernate�߼�����˳��չ����ֱ��Hibernateʵս���ص㽲���� Hibernate�Ļ����﷨���������á�O/Rӳ�䡢���ݹ��������ݼ�����HQLʵ�ü������Զ���־û�ʵ�֡�Hibernate�ص������ء� Hibernate��ҳ��ʵ�ü�����Hibernateʵս��������һ����ʵ��̳�Ĵ�����ʾ��Hibernate��ǿ���ܡ������зḻ�ĸ�¼�����ڸ�¼�н�����Hibernate���õ�ӳ�����ã�Hibernate���ߡ�XDocletģ�������Լ�Hibernate������iBatis�÷������Կ�Ƭ����ʽ�г��˱��������õĹ��߼��������¼���һ�����ǡ������������롱�������߶Ա���ο���Ҳ����ѧ���ṩ��һ������𲽵Ļ����������ʺ���Hibernate�ĸ����ײ�Ķ��ߡ�', '59.00', '��� ������ ����', '���ӹ�ҵ������', '512', 'images/product/zcover6.gif');
INSERT INTO product VALUES ('7', 'Tomcat��Java Web�����������', '���� ������ϸ������������Tomcat 5�汾�Ͽ���Java WebӦ�õĸ��ּ�������Ҫ���ݰ�����Tomcat��Java Web�����Ļ���֪ʶ��Java Web�����ĸ߼�������Tomcat�뵱ǰ����ͨ������ļ��ɣ��Լ�Tomcat�ĸ��ָ߼����ܡ���������ע��������ʵ�����ϣ��о��˴������е����Ժ�ʵ�ü�ֵ��WebӦ��ʵ�������ṩ����ϸ�Ŀ����Ͳ����衣����Java Web������SUN��˾��Java Servlet�淶�������ͨ�ü�������˱��齲���Java WebӦ�����ӿ����������κ�һ��ʵ��SUN��Servlet�淶��Java Web�������ϡ����鸽����������Ϊ�������з���Դ�����Լ������漰����������������°汾�İ�װ���򡣱�����������ǳ����ͨ���׶������۶���Java Web���������ֻ����м���˵�����鶼�Ǿ�ͨTomcat�����Ϳ���Java WebӦ�õıر���ʵ���ֲᡣ', '45.00', '������ ����', '���ӹ�ҵ������', '438', 'images/product/zcover7.gif');
INSERT INTO product VALUES ('8', '��ͨSpring', '�����������������˵�ǰ���е��������������Spring�������ܹ��ֳ�3���֡���һ���֣��ص����Spring�ļܹ����ⲿ������ѭ�򽥽����쿪���߽���Spring�С���Ҫ���ڲ���Spring IOC��Spring AOP���ڶ����֣��ص����Spring��ʹ�á��ⲿ�����ݴӼ�Java/J2EE�ĽǶȳ�������J2EEƽ̨����������������������������о�ʵ������Spring�ṩ��API���в�������Ҫ���ڲ���Spring��J2EE API�ṩ�ķ�����󡣵������֣��ص����Spring�߼�ר�⡣�ⲿ�������ص����ͼ�����������о�����Ϊ���ڿ���WebӦ�ö��ԣ�ǰ�˽���Ŀ��������������ܴ���ˣ�ʹ�ú������ͼ��������WebӦ�ö�����Ŀ�ĳɹ����ܹؼ������⣬WebӦ�õİ�ȫ������Ҳ����ҵӦ������Ϊ��Ҫ������֮һ�������� Spring��Acegi��ȫ��ܺܺõؽ����������⣬��Ҳ�ǵ��������ص��о�������֮һ�������׸����е�Java��J2EE�������Ķ���', '39.00', '��ʱ��', '���ӹ�ҵ������', '425', 'images/product/zcover8.gif');
INSERT INTO users VALUES ('1', 'zhangsan', '123456', '', '', '', '', '', '', '', '');
select * from users for update