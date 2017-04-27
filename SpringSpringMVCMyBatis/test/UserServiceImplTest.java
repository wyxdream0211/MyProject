import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.ssm.domain.Dept;
import com.ssm.domain.User;
import com.ssm.service.DeptService;
import com.ssm.service.UserService;
import com.ssm.service.impl.DeptServiceImpl;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by Administrator on 2016/12/21.
 */
public class UserServiceImplTest {
    public static void main(String[] args) {
        ApplicationContext act = new ClassPathXmlApplicationContext("applicationContext.xml");
        DeptService deptService = (DeptService) act.getBean("deptServiceImpl");
        System.out.println(deptService);
        deptService.add(null);
    }
}
