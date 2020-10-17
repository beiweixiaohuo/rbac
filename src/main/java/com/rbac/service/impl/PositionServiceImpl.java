package com.rbac.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.rbac.mapper.PositionMapper;
import com.rbac.pojo.Position;
import com.rbac.query.QueryObject;
import com.rbac.service.IPositionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.ModelAttribute;

import java.util.List;

@Service
public class PositionServiceImpl implements IPositionService {
    @Autowired
    private PositionMapper positionMapper;

    @Override
    public void deleteById(Integer id) {
        positionMapper.deleteByPrimaryKey(id);
    }

    @Override
    public void saveOrUpdate(Position position) {
        if (position != null && position.getId()!=null) {// department.nn ：非空判断
            // 修改
            positionMapper.updateByPrimaryKey(position);
        }else {
            // 新增
            positionMapper.insert(position);
        }
    }

    @Override
    public Position queryById(Integer id) {
        return positionMapper.selectByPrimaryKey(id);
    }

    @Override
    public List<Position> queryAll() {
        return positionMapper.selectAll();
    }

    @Override
    public PageInfo<Position> queryAllPage(@ModelAttribute("qo") QueryObject qo) {
        PageHelper.startPage(qo.getCurrentPage(),qo.getPageSize(),true);
        List<Position> list = positionMapper.selectAll();
        return new PageInfo<>(list);
    }
}
