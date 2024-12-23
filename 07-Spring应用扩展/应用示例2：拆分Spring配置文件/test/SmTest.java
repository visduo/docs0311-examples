import cn.duozai.entity.SysUser;
import cn.duozai.service.SysUserService;
import org.apache.log4j.Logger;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.List;

/**
 * 测试类
 */
public class SmTest {

    private static final Logger logger = Logger.getLogger(SmTest.class);

    /**
     * 查询用户列表
     *
     * @return void
     */
    @Test
    public void getUserList() {
        // 1、创建Spring容器上下文对象
        ApplicationContext context = new ClassPathXmlApplicationContext(
                "applicationContext.xml",
                "applicationContext-sm.xml",
                "applicationContext-tx.xml"
        );

        // 使用通配符加载配置文件
        // ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext*.xml");

        // 2、从Spring容器中获取Service层的Bean对象
        SysUserService sysUserService = (SysUserService) context.getBean("sysUserServiceImpl");
        // 3、调用Service层方法操作数据库
        List<SysUser> sysUserList = sysUserService.getUserList();
        // 4、调试输出结果
        for (SysUser sysUser : sysUserList) {
            logger.debug("SysUser => " + sysUser.getRealName());
        }
    }

    /**
     * 根据用户id修改密码
     *
     * @return void
     */
    @Test
    public void updatePassword() {
        ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
        SysUserService sysUserService = (SysUserService) context.getBean("sysUserServiceImpl");

        boolean result = sysUserService.updatePassword(1, "000111");
        if(result) {
            logger.debug("修改成功");
        } else {
            logger.debug("修改失败");
        }
    }

}
