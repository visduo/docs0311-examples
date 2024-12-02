package cn.duozai.service;

import cn.duozai.entity.SysUser;

import java.util.List;

public interface SysUserService {

    /**
     * 查询用户列表
     *
     * @return java.util.List<cn.duozai.entity.SysUser>
     * @author 多仔ヾ
     */
    List<SysUser> getUserList();

    /**
     * 修改密码
     *
     * @param id 用户id
     * @param password 新密码
     * @return boolean
     * @author 多仔ヾ
     */
    boolean updatePassword(Integer id, String password);

}
