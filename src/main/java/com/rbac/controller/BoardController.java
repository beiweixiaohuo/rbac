package com.rbac.controller;

import com.github.pagehelper.PageInfo;
import com.rbac.pojo.Board;
import com.rbac.pojo.Employee;
import com.rbac.query.QueryObject;
import com.rbac.service.IBoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.sql.Timestamp;
import java.util.HashSet;
import java.util.List;

@Controller
@RequestMapping("/board")
public class BoardController {

    @Autowired
    private IBoardService boardService;
    @Autowired
    private HttpSession session;

    /**
     * 跳到list.jsp页面
     * @param model
     * @param qo
     * @return
     */
    @RequestMapping("/list")
    public String list(Model model,@ModelAttribute("qo")QueryObject qo){
        //取出用户具有的权限
        HashSet<Integer> myPermissions = (HashSet<Integer>) session.getAttribute("myPermissions");
        //如果用户不具有权限Id为4的权限,跳到common/nopermission说明用户无权限
        if (myPermissions.contains(6)){
            model.addAttribute("flag",true);
        }
        //查询已发布，但未被删除的公告
        PageInfo<Board> publishList = boardService.selectPublish(qo);
        //查询已发布，但被删除到回收站的公告
        List<Board> recycleList = boardService.selectRecycle();
        model.addAttribute("page",publishList);
        model.addAttribute("recycleList",recycleList);
        return "board/list";
    }

    /**
     * 发布新公告
     * @param title
     * @param context
     * @return
     */
    @RequestMapping("/publish")
    public String publish(@RequestParam("title")String title,@RequestParam("context")String context){
        //取出用户具有的权限
        HashSet<Integer> myPermissions = (HashSet<Integer>) session.getAttribute("myPermissions");
        //如果用户不具有权限Id为4的权限,跳到common/nopermission说明用户无权限
        if (!myPermissions.contains(6)){
            return "common/nopermission";
        }
        Board board = new Board();
        board.setTitle(title);
        board.setContext(context);
        Employee user =(Employee) session.getAttribute("user");
        board.setPublisher(user.getName());
        board.setCreateTime(new Timestamp(System.currentTimeMillis()));
        board.setIsdelete(0);
        boardService.insert(board);
        return "redirect:/board/list.do";
    }

    /**
     * 删除到回收站
     * @param id
     * @return
     */
    @RequestMapping("/deleteToRecycle")
    public String deleteToRecycle(@RequestParam("id")Integer id){
        //取出用户具有的权限
        HashSet<Integer> myPermissions = (HashSet<Integer>) session.getAttribute("myPermissions");
        //如果用户不具有权限Id为4的权限,跳到common/nopermission说明用户无权限
        if (!myPermissions.contains(6)){
            return "common/nopermission";
        }
        boardService.deleteToRecycle(id);
        return "redirect:/board/list.do";
    }

    /**
     * 永久删除
     * @param id
     * @return
     */
    @RequestMapping("/delete")
    public String delete(@RequestParam("id")Integer id){
        //取出用户具有的权限
        HashSet<Integer> myPermissions = (HashSet<Integer>) session.getAttribute("myPermissions");
        //如果用户不具有权限Id为4的权限,跳到common/nopermission说明用户无权限
        if (!myPermissions.contains(6)){
            return "common/nopermission";
        }
        boardService.deleteByPrimaryKey(id);
        return "redirect:/board/list.do";
    }

    /**
     * 从回收站恢复公告
     * @param id
     * @return
     */
    @RequestMapping("/recycleToPublish")
    public String recycleToPublish(@RequestParam("id")Integer id){
        //取出用户具有的权限
        HashSet<Integer> myPermissions = (HashSet<Integer>) session.getAttribute("myPermissions");
        //如果用户不具有权限Id为4的权限,跳到common/nopermission说明用户无权限
        if (!myPermissions.contains(6)){
            return "common/nopermission";
        }
        boardService.recycleToPublish(id);
        return "redirect:/board/list.do";
    }
    /**
     * 公告详细界面
     * @param model
     * @param id
     * @return
     */
    @RequestMapping("/detail")
    public String detail(Model model,@RequestParam("id")Integer id){
        Board board = boardService.selectByPrimaryKey(id);
        model.addAttribute("board",board);
        return "board/detail";
    }

    //跳到update.jsp页面
    @RequestMapping("/toUpdate")
    public String toUpdate(Model model,@RequestParam("id")Integer id){
        //取出用户具有的权限
        HashSet<Integer> myPermissions = (HashSet<Integer>) session.getAttribute("myPermissions");
        //如果用户不具有权限Id为4的权限,跳到common/nopermission说明用户无权限
        if (!myPermissions.contains(6)){
            return "common/nopermission";
        }
        Board board = boardService.selectByPrimaryKey(id);
        model.addAttribute("board",board);
        return "board/update";
    }
    //执行update.jsp页面的修改功能
    @RequestMapping("/update")
    public String update(Model model,Board board){
        //取出用户具有的权限
        HashSet<Integer> myPermissions = (HashSet<Integer>) session.getAttribute("myPermissions");
        //如果用户不具有权限Id为4的权限,跳到common/nopermission说明用户无权限
        if (!myPermissions.contains(6)){
            return "common/nopermission";
        }
        board.setUpdateTime(new Timestamp(System.currentTimeMillis()));

        boardService.updateByPrimaryKey(board);
        return "redirect:/board/list.do";
    }
}
