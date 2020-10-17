package com.rbac.service;

import com.github.pagehelper.PageInfo;
import com.rbac.pojo.Board;
import com.rbac.query.QueryObject;
import org.springframework.web.bind.annotation.ModelAttribute;

import java.util.List;

public interface IBoardService {
    int insert(Board record);

    Board selectByPrimaryKey(Integer id);

    PageInfo<Board> selectPublish(@ModelAttribute("qo") QueryObject qo);
    //回收站中的公告
    List<Board> selectRecycle();

    int updateByPrimaryKey(Board record);

    //删除到回收站
    void deleteToRecycle(Integer id);
    //永久删除
    int deleteByPrimaryKey(Integer id);
    //从回收站中恢复
    void recycleToPublish(Integer id);
}
