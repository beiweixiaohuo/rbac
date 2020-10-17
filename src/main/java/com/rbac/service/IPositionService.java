package com.rbac.service;


import com.github.pagehelper.PageInfo;
import com.rbac.pojo.Position;
import com.rbac.query.QueryObject;
import org.springframework.web.bind.annotation.ModelAttribute;

import java.util.List;

public interface IPositionService {
    void deleteById(Integer id);

    void saveOrUpdate(Position position);

    Position queryById(Integer id);

    List<Position> queryAll();

    PageInfo<Position> queryAllPage(@ModelAttribute("qo") QueryObject qo);
}
