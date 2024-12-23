package cn.duozai.service;

import cn.duozai.entity.SysUser;

import java.util.List;

/**
 * 用户表业务逻辑接口
 */
public interface SysUserService {

    /**
     * 查询用户列表
     *
     * @return 用户列表
     */
    List<SysUser> getUserList();

}
