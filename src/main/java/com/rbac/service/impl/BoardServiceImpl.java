package com.rbac.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.rbac.mapper.BoardMapper;
import com.rbac.pojo.Board;
import com.rbac.query.QueryObject;
import com.rbac.service.IBoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.ModelAttribute;

import java.util.List;

@Service
public class BoardServiceImpl implements IBoardService {
    @Autowired
    private BoardMapper boardMapper;

    @Override
    public int insert(Board record) {
        return boardMapper.insert(record);
    }

    @Override
    public Board selectByPrimaryKey(Integer id) {
        return boardMapper.selectByPrimaryKey(id);
    }

    @Override
    public PageInfo<Board> selectPublish( @ModelAttribute("qo") QueryObject qo) {
        PageHelper.startPage(qo.getCurrentPage(),qo.getPageSize(),true);
        List<Board> list = boardMapper.selectPublish();
        return new PageInfo<>(list);
    }

    @Override
    public List<Board> selectRecycle() {
        return boardMapper.selectRecycle();
    }

    @Override
    public int updateByPrimaryKey(Board record) {
        return boardMapper.updateByPrimaryKey(record);
    }

    @Override
    public void deleteToRecycle(Integer id) {
        boardMapper.deleteToRecycle(id);
    }

    @Override
    public int deleteByPrimaryKey(Integer id) {
        return boardMapper.deleteByPrimaryKey(id);
    }

    @Override
    public void recycleToPublish(Integer id) {
        boardMapper.recycleToPublish(id);
    }
}
