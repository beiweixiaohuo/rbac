package com.rbac.mapper;

import com.rbac.pojo.Board;
import java.util.List;

public interface BoardMapper {

    int insert(Board record);

    Board selectByPrimaryKey(Integer id);

    List<Board> selectPublish();
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
