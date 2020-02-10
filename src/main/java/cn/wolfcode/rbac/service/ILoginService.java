package cn.wolfcode.rbac.service;

public interface ILoginService {
    boolean checkLogin(Long id,String password);
}
