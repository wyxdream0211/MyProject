spring、springmvc、mybatis整合

所用技术

1、数据源 DRUID
2、数据库 mysql

3、日志记录 log4j
4、单元测试 junit

5、spring
6、spring 声明式事务
7、spring mvc
8、MyBatis

9、jstl标准标签库


整合步骤：
1、加载spring容器
    在resource目录中创建applicationContext.xml配置文件
    web.xml中配置ContextLoaderListener监听器

2、spring管理数据源

3、spring整合mybatis
    3.1 注入sqlSessionFactory(事先创建好mybatis配置文件： mybatis-config.xml)
    3.2 自动扫描mapper.xml文件
    3.3 spring管理mybatis的事务
    3.4 配置log4j.properties(不是必须的)

4、springmvc配置
    4.1 配置前端控制器 web.xml中配置dispatchServlet
    4.2 配置适配器、映射器支持注解
    4.3 自动扫描controller(自动扫描组件)
    4.4 配置视图解析器 InternalResourceViewResolver



使用方法及注意事项

1、<!-- 加载Spring容器 -->
      <context-param>
          <param-name>contextConfigLocation</param-name>
          <param-value>classpath:applicationContext.xml</param-value>
      </context-param>
      <listener>
          <listener-class>org.springframework.web.context.ContextLoaderListener</listener-class>
      </listener>

2、<!--======================配置数据源=======================-->
      <bean id="dataSource" class="com.alibaba.druid.pool.DruidDataSource">
          <property name="driverClassName" value="com.mysql.jdbc.Driver"/>
          <property name="url" value="jdbc:mysql:///test?useSSL=false"/>
          <property name="username" value="root"/>
          <property name="password" value="root"/>
      </bean>

3.1<!--=====================配置SqlSessionFactory=============-->
       <bean id="sqlSessionFactory" class="org.mybatis.spring.SqlSessionFactoryBean">
           <property name="dataSource" ref="dataSource"/>
           <property name="configLocation" value="classpath:mybatis-config.xml"/>
       </bean>
3.2<!--====================配置自动扫描mapper.xml文件===========-->
       <bean class="org.mybatis.spring.mapper.MapperScannerConfigurer">
           <property name="basePackage" value="com.it"/>
           <property name="sqlSessionFactoryBeanName" value="sqlSessionFactory"/>
       </bean>
3.3<!--=====================配置事务管理============= ===========-->
       <bean id="transactionManager" class="org.springframework.jdbc.datasource.DataSourceTransactionManager">
           <property name="dataSource" ref="dataSource"/>
       </bean>
       <tx:annotation-driven transaction-manager="transactionManager"/>
3.4略

4.1<!--mvc前端控制器-->
       <servlet>
           <servlet-name>springmvc</servlet-name>
           <servlet-class>org.springframework.web.servlet.DispatcherServlet</servlet-class>
           <init-param>
               <param-name>contextConfigLocation</param-name>
               <param-value>classpath:springmvc.xml</param-value>
           </init-param>
       </servlet>
       <servlet-mapping>
           <servlet-name>springmvc</servlet-name>
           <!--
               第一种：*.action 访问以.action结尾 由DispatcherServlet进行解析
               第二种：/        所有访问都由DispatcherServlet进行解析对于静态文件的解析需配置不让DispatcherServlet解析
                               此种方式可以实现RESTful风格的url
           -->
           <url-pattern>*.action</url-pattern>
       </servlet-mapping>
4.2<!--=====================基于注解配置适配器，映射器=================-->
       <mvc:annotation-driven/>
4.3<!--=====================配置自动扫描controller====================-->
       <context:component-scan base-package="com.it.action"/>
4.4<!-- =================== 配置SpringMVC的视图解析器 =============== -->
       <bean class="org.springframework.web.servlet.view.InternalResourceViewResolver">
       </bean>